#include "param.h"
#include "types.h"
#include "defs.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "fs.h"
#include "spinlock.h"
#include "sleeplock.h"
#include "file.h"
#include "fcntl.h"
#include "elf.h"

extern char data[];  // defined by kernel.ld
pde_t *kpgdir;  // for use in scheduler()

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
  struct cpu *c;

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpuid()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
  lgdt(c->gdt, sizeof(c->gdt));
}

// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}

// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}


// Project 3: Virtual Memory

struct mmap_area {
  struct file *f;
  uint addr;
  int length;
  int offset;
  int prot;
  int flags;
  struct proc *p;
};

struct mmap_area mmlist[64];
int mmlen = 0;

// helper functions

void deleteEntry(int idx)
{
  if(idx < 0 || idx >= mmlen){
    cprintf("delete entry out of idx, exit\n");
    exit();
  }

  for(int i = idx + 1; i < mmlen; i++)
  {
    mmlist[i-1] = mmlist[i]; 
  }
}

// print out mmlist
void printmmlist()
{
  for(int i = 0; i < mmlen; i++){
    int upbdd = PGROUNDUP(mmlist[i].addr + mmlist[i].length);
    cprintf("-mmlist[%d]\n", i);
    cprintf("addr: %x\n", mmlist[i].addr);
    cprintf("length: %d\n", mmlist[i].length);
    cprintf("range: (%x, %x)\n", mmlist[i].addr, upbdd);
  }
}

// is [pgbase:PGSIZE] belongs to [base:length] ?
int pagebelongs(uint pgbase, uint base, int length)
{
  if(base <= pgbase && pgbase < base+length)
    return 1;
  return 0;
}


uint getaddr(uint start, int length, struct proc * p)
{
  uint addr = start;
  struct mmap_area *mmentry;
  int numpgs = length % PGSIZE == 0? length/PGSIZE: length/PGSIZE + 1 ;
  
  // check mmap region by page unit
  for(int i = addr ; ; i += PGSIZE)
  {
    int pginentry = 0;
    for(int pick = i; pick < i + PGSIZE * numpgs; pick += PGSIZE)
    {
      // iterate through mmlist
      for(int k = 0; k < mmlen; k++)
      {
        mmentry = &mmlist[k];
        if(p->pid == mmentry->p->pid && pagebelongs(pick, mmentry->addr, mmentry->length)){
          cprintf("%x occupied\n", pick);
          pginentry = 1;
          break;
        }
      }
      if(pginentry) break;
    }

    if(!pginentry){
      addr = i;
      break;
    }
  }

  return addr;
}

/*
#1. mmap
    1.addr is always page-aligned
    -if addr is NULL, should do automatic mapping
    -if addr is given & flag is MAP_FIXED, should map into according address
    2.length is also a multiple of page size
    3.prot can be PROT_READ or PROT_READ|PROT_WRITE 
    -prot should be match with file’s open flag
    4.flags can be given with the combinations
      1)MAP_PRIVATE should be given always
      2)MAP_FIXED should be given to non-NULL addr
      3)If MAP_ANONYMOUS is given, it is anonymous mapping
      4)If MAP_ANONYMOUS is not given, it is file mapping
      5)If MAP_POPULATE is given, allocate physical page & make page table for whole mapping area.
      6)If MAP_POPULATE is not given, just record its mapping area.
        If page fault occurs to according area (access to mapping area’s virtual address), 
        allocate physical page & make page table to according page
      7)Other flags will not be used
     5.fd is given for file mappings, if not, it should be -1
     6.offset is given for file mappings, if not, it should be 0
     7.MMAPBASE of each process’s virtual address is 0x40000000
*/
uint mmap(uint addr, int length, int prot, int flags, int fd, int offset)
{
  struct mmap_area nmmap; // new mmap object
  uint numpgs;
  uint va, va_proper;
  struct proc * curproc = myproc();
  char * mem;
  int mm_flag;
  struct file * f;

  flags |= MAP_PRIVATE; // MAP_PRIVATE is given always.
  numpgs = (length % PGSIZE == 0)? length/PGSIZE :(length / PGSIZE) + 1;

  cprintf("calling mmap\n");
  cprintf("--print mmlist--\n");
  printmmlist();

  cprintf("pages to cover: %d\n", numpgs);
  
  // 1. resolve address.
  // address is always given page-aligned.
  if(!addr && (flags & MAP_FIXED))
    return 0;

  if(addr && (flags & MAP_FIXED)){
    // if address is given, and flag is MAP_FIXED
    // should map into according address.
    va = MMAPBASE + addr;
    va_proper = getaddr(va, length, curproc);

    cprintf("addr to map: %x, proper mapping: %x\n", va, va_proper);

    // if that address is already being occupied, 
    // return 0 
    if(va != va_proper)
      return 0;
  } else {
    cprintf("Null addr mapping here\n");
    va = getaddr(MMAPBASE, length, curproc);
    cprintf("addr to map: %x\n", va);
  }
  
  // 2. register mmap_area
  nmmap.addr = va;
  nmmap.length = length;
  nmmap.offset = offset;
  nmmap.prot = prot;
  nmmap.flags = flags;
  nmmap.p = curproc;

  if(!(flags & MAP_ANONYMOUS)){
    f = curproc->ofile[fd];
    nmmap.f = f;

    if(!(f->writable) && (prot & PROT_WRITE))
      return 0;
  }

  mmlist[mmlen++] = nmmap;


  if(prot | PROT_WRITE)
    mm_flag = PTE_U | PTE_W;
  else
    mm_flag = PTE_U;

  // 3. check if populate is given
  if(flags & MAP_POPULATE) {
    cprintf("MAP_POPULATE given\n");

    // check if it is anonymous mapping.
    if(flags & MAP_ANONYMOUS) {
      cprintf("ANONYMOUS MAPPING: just spaces.\n");

      for(int i = 0; i < numpgs; i++) {
        // allocate physical memories for each pages.
        // set to zero(anonymous mapping)
        mem = kalloc();
        memset(mem, 0, PGSIZE);
        cprintf("alloc page at %x\n", va + i * PGSIZE);
        mappages(curproc->pgdir, (char *) (va + i*PGSIZE), PGSIZE, V2P(mem), mm_flag);
      }
    } else {
      cprintf("FILE MAPPING\n");
      cprintf("copy file data here %x\n", f);
      for(int i = 0; i < numpgs; i++) {
        // allocate physical memories for each pages.
        // set to 0, and read file. (file mapping)
        mem = kalloc();
        memset(mem, 0, PGSIZE);
        cprintf("alloc page at %x mem: %x \n", va + i * PGSIZE, (char * ) mem);
        ilock(f->ip);
        begin_op();
        readi(f->ip, mem, i*PGSIZE+offset, PGSIZE);
        end_op();
        iunlock(f->ip);
        mappages(curproc->pgdir, (char *) (va + i*PGSIZE), PGSIZE, V2P(mem), mm_flag);
      }
    }
  } // else, for non-populate mappings,
    // nothing else left to do.
    // tasks will be handled at handle_pgfault()

  cprintf("return va: %x\n", va);
  cprintf("\n");
  return va;
  
}


/*
  •Page fault handler is for dealing with access on mapping region with physical page & page table is not allocated
  •Return value: 1(succeed), -1(failed)
  1.When an access occurs (read/write), catch according page fault (interrupt 14, T_PGFLT) in traps.h
  2.In page fault handler, determine fault address by reading CR2 register(using rcr2()) 
    & access was read or write read: tf->err&2 == 0 / write: tf->err == 1
  3.Find according mapping region in mmap_area 
    If faulted address has no corresponding mmap_area, return -1
  4.If fault was write while mmap_areais write prohibited, then return -1
  5.For only one page according to faulted address
    1.Allocate new physical page
    2.Fill new page with 0
    3.If it is file mapping, read file into the physical page with offset
    4.If it is anonymous mapping, just left the page which is filled with 0s
    5.Make page table & fill it properly (if it was PROT_WRITE, PTE_W should be 1 in PTE value)
*/
int handle_pgfault(struct proc * p, uint faultaddr, uint errorcode)
{
  char * mem;
  int in_mmlist = 0;
  struct mmap_area *mmentry;
  int mm_flag;
  uint pg_loc = PGROUNDDOWN(faultaddr);
  struct file *f;
  int offset;

  // debug
  cprintf("errorcode: %d\n", errorcode);
  cprintf("pg_loc: %x\n", pg_loc); 
  if(errorcode == 1)
    cprintf("write\n");
  else if((errorcode & 2) == 0)
    cprintf("read\n");
  else{
    cprintf("sth wrong\n");
    return -1;
  }
  
  // find according mapping region in mmlist
  for(int i = 0; i < mmlen; i++){
    if((mmlist[i].p)->pid == p->pid && pagebelongs(pg_loc, mmlist[i].addr, mmlist[i].length)){
      cprintf("addr in mmlist!\n");
      in_mmlist = 1;
      mmentry = &mmlist[i];
      break;
    }
  }

  // check if there exists corresponding mmap_area
  if(!in_mmlist) return -1; 
  // check if access is write, with mmap area is write prohibited
  if((errorcode == 1) && !(mmentry->prot & PROT_WRITE)) return -1; 
  
  // handle one page of faulted address.
  
  // allocate new physical page
  mem = kalloc();
  if(!mem)
  {
    cprintf("allocuvm out of memory\n");
    return 0;
  }
  memset(mem, 0, PGSIZE); // fill new page with 0
  
  // page table parameter setting
  if(mmentry->prot & PROT_WRITE)
    mm_flag = PTE_W|PTE_U;
  else
    mm_flag = PTE_U;

 
  if(!(mmentry->flags & MAP_ANONYMOUS)){ // if it is not anonymous mapping
    cprintf("pgfault handler is calling file readi\n");
    f = mmentry->f;
    offset = mmentry->offset + pg_loc - mmentry->addr;
    cprintf("offset %d\n", offset);
    ilock(f->ip);
    begin_op();
    readi(f->ip, mem, offset, PGSIZE);
    end_op();
    iunlock(f->ip);
    cprintf("read i is done\n");
  } // else, do nothing, 
    //leave memory with 0's

  // make page table, and fill it properly
  mappages(p->pgdir, (char *) pg_loc, PGSIZE, V2P(mem), mm_flag);
  return 1;
}

int munmap(uint addr)
{
  struct mmap_area *mmentry;
  int in_mmlist = 0;
  int i, l;
  int numpgs; // number of pages to free
  struct proc * p;
  pte_t *pte;

  cprintf("calling munmap\n");
  // find according mapping region in mmlist
  for(i = 0; i < mmlen; i++){
    if(pagebelongs(addr, mmlist[i].addr, mmlist[i].length)){
      cprintf("addr in mmlist!\n");
      in_mmlist = 1;
      mmentry = &mmlist[i];
      break;
    }
  }

  cprintf("unmap idx : %d\n", i);
  // if not in list, return -1
  if(!in_mmlist) return -1;

  // Is physical pages allocated?
  // iterate through
  l = mmentry->length;
  numpgs = (l % PGSIZE == 0) ? l / PGSIZE : l / PGSIZE + 1;
  p = mmentry->p;

  cprintf("page length: %d, number of pages: %d, proc : %d\n", l, numpgs, p);
  
  for(int pg = 0; pg < numpgs; pg++){
    int va = addr + PGSIZE * pg;
    pte = walkpgdir(p->pgdir, (char *) va, 0);
    cprintf("%dth page, at %x\n", pg+1, va);
    if(*pte & PTE_P){
      int pa = PTE_ADDR(*pte);
      char * v = P2V(pa);

      // before return, write back
      // just for the file && write case
      if(mmentry->prot & PROT_WRITE && !(mmentry->flags & MAP_ANONYMOUS)) {
        ilock(mmentry->f->ip);
        begin_op();
        //cprintf("offset : %d\n", mmentry->offset + pg * PGSIZE);  
        writei(mmentry->f->ip, (char *)va, mmentry->offset + pg * PGSIZE, PGSIZE);
        end_op();
        iunlock(mmentry->f->ip);
      }

      // free memory here
      kfree(v);
      *pte = 0;
      cprintf("freed mem. status %d\n", *pte & PTE_P);
    }
  } 
  
  if(mmentry->prot & PROT_WRITE && !(mmentry->flags & MAP_ANONYMOUS))
    iput(mmentry->f->ip);
  // delete mmap_area entry
  deleteEntry(i);

  cprintf("\n");
  return 1;
}

// There is one page table per process, plus one that's used when
// a CPU is not running any process (kpgdir). The kernel uses the
// current process's page table during system calls and interrupts;
// page protection bits prevent user code from using the kernel's
// mappings.
//
// setupkvm() and exec() set up every page table like this:
//
//   0..KERNBASE: user memory (text+data+stack+heap), mapped to
//                phys memory allocated by the kernel
//   KERNBASE..KERNBASE+EXTMEM: mapped to 0..EXTMEM (for I/O space)
//   KERNBASE+EXTMEM..data: mapped to EXTMEM..V2P(data)
//                for the kernel's instructions and r/o data
//   data..KERNBASE+PHYSTOP: mapped to V2P(data)..PHYSTOP,
//                                  rw data + free physical memory
//   0xfe000000..0: mapped direct (devices such as ioapic)
//
// The kernel allocates physical memory for its heap and for user memory
// between V2P(end) and the end of physical memory (PHYSTOP)
// (directly addressable from end..P2V(PHYSTOP)).

// This table defines the kernel's mappings, which are present in
// every process's page table.
static struct kmap {
  void *virt;
  uint phys_start;
  uint phys_end;
  int perm;
} kmap[] = {
 { (void*)KERNBASE, 0,             EXTMEM,    PTE_W}, // I/O space
 { (void*)KERNLINK, V2P(KERNLINK), V2P(data), 0},     // kern text+rodata
 { (void*)data,     V2P(data),     PHYSTOP,   PTE_W}, // kern data+memory
 { (void*)DEVSPACE, DEVSPACE,      0,         PTE_W}, // more devices
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0) {
      freevm(pgdir);
      return 0;
    }
  return pgdir;
}

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
  kpgdir = setupkvm();
  switchkvm();
}

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  if(p == 0)
    panic("switchuvm: no process");
  if(p->kstack == 0)
    panic("switchuvm: no kstack");
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");

  pushcli();
  mycpu()->gdt[SEG_TSS] = SEG16(STS_T32A, &mycpu()->ts,
                                sizeof(mycpu()->ts)-1, 0);
  mycpu()->gdt[SEG_TSS].s = 0;
  mycpu()->ts.ss0 = SEG_KDATA << 3;
  mycpu()->ts.esp0 = (uint)p->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  mycpu()->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
}

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
}

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}

// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a = PGADDR(PDX(a) + 1, 0, 0) - PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
}

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
  *pte &= ~PTE_U;
}

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0) {
      kfree(mem);
      goto bad;
    }
  }
  return d;

bad:
  freevm(d);
  return 0;
}

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
}

// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}

//PAGEBREAK!
// Blank page.
//PAGEBREAK!
// Blank page.
//PAGEBREAK!
// Blank page.

