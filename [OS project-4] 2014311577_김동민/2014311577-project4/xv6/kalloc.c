// Physical memory allocator, intended to allocate
// memory for user processes, kernel stacks, page table pages,
// and pipe buffers. Allocates 4096-byte pages.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "spinlock.h"

void freerange(void *vstart, void *vend);
extern char end[]; // first address after kernel loaded from ELF file
                   // defined by the kernel linker script in kernel.ld

struct run {
  struct run *next;
};

struct {
  struct spinlock lock;
  int use_lock;
  struct run *freelist;
} kmem;

/*
  Bitmap management Unit
*/

// bitmap to log swap status
struct {
  struct spinlock lock;
  char * bitmap;
} bmap;

// initialize bitmap
void
bitmapinit(void)
{
  if(!bmap.bitmap)
  {
    initlock(&bmap.lock, "bmap");
    bmap.bitmap = kalloc();
    memset(bmap.bitmap, 0, PGSIZE);
  }
}

// get block number from bitmap.
int
getblkno(void)
{
  
  acquire(&bmap.lock);
  
  uint idx = 0;
  int flag = 0;

  for(int i = 0; i < PGSIZE; i++)
  {
    // swap index is full.
    if(bmap.bitmap[i] == 0xFF)
      continue;
    else
    {
      // not full: search for 0.
      for(int j = 0; j < 8; j++)
      {
        int mask = 1<<j;
        if(!(bmap.bitmap[i] & mask))
        {
          idx = i * 8 + j;
          flag = 1;
          break;
        }
      }
      if(flag) break;
    }
  }
  release(&bmap.lock);

  return idx;
}

// set bitmap bit to 0 or 1.
void
setbit(int idx, int boolean)
{
  acquire(&bmap.lock);
  int i = idx / 8;
  int j = 1 << (idx % 8);
  bmap.bitmap[i] = (bmap.bitmap[i] & ~j) | (boolean << (idx % 8));
  release(&bmap.lock);
}

/*
  LRU List Management Unit.
*/

struct page pages[PHYSTOP/PGSIZE];
int num_free_pages = 0;

struct page *page_lru_head;
int num_lru_pages = 0;

// insert page to the last of LRU list.
void
insertpage(struct page * p)
{
  // case 1.
  // initial case.
  if(!page_lru_head){
    page_lru_head = p;
    p->next = p;
    p->prev = p;
    num_lru_pages++;
    return;
  }
  
  // insert to the last.
  struct page *last = page_lru_head -> prev;

  last->next = p;
  p->prev = last;
  p->next = page_lru_head;
  page_lru_head->prev = p;

  num_lru_pages++;
}

void
deletepage(pde_t *pgdir, void *va)
{
  if(!page_lru_head){
    // no entry to delete. 
    // may imply an error.
    return;
  }

  struct page *cur = page_lru_head;
  while(1){
    // page is found.
    if(cur->pgdir == pgdir && cur->vaddr == (char*)va)
      break;

    cur = cur -> next;

    if(cur == page_lru_head){
      // page not found
      // may imply an error.
      return;
    }
  }

  // relocate page_lru_head
  if(cur == page_lru_head){
    if(cur->next == cur){
      page_lru_head = 0;
    }
    else{
      page_lru_head = cur->next;
    }
  }

  // rearrange
  struct page *nc, *pc;
  nc = cur->next; // next to cur
  pc = cur->prev; // prev to cur

  pc->next = nc;
  nc->prev = pc;

  // clear page
  cur->next = 0;
  cur->prev = 0;
  cur->pgdir = 0;
  cur->vaddr = 0;
  num_lru_pages--;
}

// log page to corresponding pages[] entry
struct page*
logpage(pde_t *pgdir, void *va, uint pa)
{
  int idx = pa / PGSIZE;
  pages[idx].pgdir = pgdir;
  pages[idx].vaddr = (char *) va;

  return &pages[idx];
}

// get victim page
// if PTE_A is 1, set to 0 and push back
// else, that is victim
struct page*
getvictim(void)
{
  struct page *cur = page_lru_head;
  pte_t * pte;

  if(!cur){
    return 0;
  }

  while(1)
  {
    pte = getpte(cur->pgdir, cur->vaddr);

    if(*pte & PTE_A){
      struct page *tmp = cur;
      pde_t * pgd = cur->pgdir;
      char * va = cur->vaddr;

      // set access bit to 0.
      *pte &= ~PTE_A;

      // delete and move back
      deletepage(pgd, va);
      tmp->pgdir = pgd;
      tmp->vaddr = va;
      insertpage(tmp);
      cur = page_lru_head;
    }
    else{
      break;
    }
  }

  return cur;
}

// reclaim pages by evicting
int
reclaim(void)
{
  struct page *victim;
  pte_t *pte;
  uint pa;
  uint blkno;

  // 1. get victim
  victim = getvictim(); // victim represented by LRU list.
  if(!victim){
    // out of memory error
    return 0;
  }
  pte = getpte(victim->pgdir, victim->vaddr);
  pa = PTE_ADDR(*pte);  // get physical address of the victim page.
  deletepage(victim->pgdir, victim->vaddr);

  // 2. log to bitmap
  blkno = getblkno();
  setbit(blkno, 1);
  
  // unlock
  if(kmem.use_lock)
    release(&kmem.lock);

  // 3. get swapspace by blkno,
  // and write it to swapspace.
  swapwrite(P2V(pa), blkno);
  

  // 4. free page.
  kfree(P2V(pa));


  // 5. set pte.
  *pte = 0;
  *pte = (blkno + SWAPBASE) << 12;
  *pte &= ~PTE_P;

  // lock
  if(kmem.use_lock)
    acquire(&kmem.lock);

  return 1;
}



// Initialization happens in two phases.
// 1. main() calls kinit1() while still using entrypgdir to place just
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
    kfree(p);
}

// Free the page of physical memory pointed at by v,
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  num_free_pages++;
  if(kmem.use_lock)
    release(&kmem.lock);
}

// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);

try_again:
  
  r = kmem.freelist;

  // bitmap exception
  if((char *) r == bmap.bitmap){
    // access to bitmap.
    // might imply an error.
    cprintf("bitmap access: skip.\n");
    kmem.freelist = r->next;
  }

  if(!r && reclaim())
	  goto try_again;
  
  if(r)
    kmem.freelist = r->next;

  if(!r) {
    cprintf("ERROR: OUT OF MEMORY!\n"); 
    if(kmem.use_lock)
      release(&kmem.lock);
    return 0; // OOM Error.
  }

  if(kmem.use_lock)
    release(&kmem.lock);

  num_free_pages--;
  return (char*)r;
}

