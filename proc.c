#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "spinlock.h"

struct {
  struct spinlock lock;
  struct proc proc[NPROC];
} ptable;

static struct proc *initproc;

int nextpid = 1;
extern void forkret(void);
extern void trapret(void);

static void wakeup1(void *chan);

static int weights[40] = 
{
  88761, 71755, 56483, 46273, 36291,
  29154, 23254, 18705, 14949, 11916,
   9548,  7620,  6100,  4904,  3906,
   3121,  2501,  1991,  1586,  1277,
   1024,   820,   655,   526,   423,
    335,   272,   215,   172,   137,
    110,    87,    70,    56,    45,
     36,    29,    23,    18,    15,
};


static char *states[] = 
{
  [UNUSED]    "UNUSED  ",
  [EMBRYO]    "EMBRYO  ",
  [SLEEPING]  "SLEEPING",
  [RUNNABLE]  "RUNNABLE",
  [RUNNING]   "RUNNING ",
  [ZOMBIE]    "ZOMBIE  "
};

/*
vruntime utility.
*/
// uint covers up to 4,294,967,295
// newly made overflow condition is 1,000,000,000
// (can express up to 999,999,999)

#define VINT_MAX 1000000000
void vadd(uint vr[], uint x){
  vr[0] += x;
  if(vr[0] >= VINT_MAX){
    vr[1]++;
    vr[0] = vr[0]- VINT_MAX;
  }
}

void vsub(uint vr[], uint x){
  if(vr[0] > x){
    vr[0] -= x;
  } else {
    vr[1]--; // borrow from upper digit.
    vr[0] = VINT_MAX + vr[0] - x;
  }
}

int vcompare(uint vra[], uint vrb[]){
  /*
    value is same, return 0
    a is bigger, return 1
    b is bigger, return 2
  */
  // compare upper digit first
  if(vra[1] > vrb[1])
    return 1;
  else if(vra[1] < vrb[1])
    return 2;
  else // if no overflow occured
  {
    if(vra[0] > vrb[0])
      return 1;
    else if(vra[0] < vrb[0])
      return 2;
    else
      return 0;
  }
  
}

void printvr(uint vr[])
{
  if(vr[1])
    cprintf("%d", vr[1]);

  cprintf("%d", vr[0]);
}

// end vr

void
pinit(void)
{
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
}

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
  c = mycpu();
  p = c->proc;
  popcli();
  return p;
}

//PAGEBREAK: 32
// Look in the process table for an UNUSED proc.
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
  return 0;

found:
  p->state    = EMBRYO;
  p->pid      = nextpid++;
  p->priority = 20;
  p->weight   = weights[p->priority];

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  cprintf("%p %p\n", _binary_initcode_start, _binary_initcode_size);
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
  p->tf->es = p->tf->ds;
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
  p->cwd = namei("/");

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);

  p->state = RUNNABLE;

  release(&ptable.lock);
}

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
  uint sz;
  struct proc *curproc = myproc();

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  curproc->sz = sz;
  switchuvm(curproc);
  return 0;
}

// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
  int i, pid;
  struct proc *np;
  struct proc *curproc = myproc();

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));

  pid = np->pid;

  acquire(&ptable.lock);

  // inherits parent process's priority, weight, vruntime
  np->priority = curproc->priority;
  np->weight   = curproc->weight;
  np->vruntime[0] = curproc->vruntime[0];
  np->vruntime[1] = curproc->vruntime[1];

  // set to RUNNABLE.
  np->state = RUNNABLE;

  release(&ptable.lock);

  return pid;
}

// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
  struct proc *curproc = myproc();
  struct proc *p;
  int fd;

  if(curproc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }

  begin_op();
  iput(curproc->cwd);
  end_op();
  curproc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
      if(p->state == ZOMBIE)
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
  sched();
  panic("zombie exit");
}

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
        freevm(p->pgdir);
        p->pid = 0;
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}

//PAGEBREAK: 42
// Per-CPU process scheduler.
// Each CPU calls scheduler() after setting itself up.
// Scheduler never returns.  It loops, doing:
//  - choose a process to run
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
  struct proc *p, *p_minvrun, *_p1, *_p2;
  struct cpu *c = mycpu();
  int sum_weights;
  c->proc = 0;
  
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
      if(p->state != RUNNABLE)
        continue;

      p_minvrun = p;
      for(_p1 = ptable.proc; _p1 < &ptable.proc[NPROC]; _p1++){
        if(_p1->state != RUNNABLE)
          continue;
        
        // Select minimum vruntime RUNNABLE process
        if(vcompare(_p1->vruntime, p_minvrun->vruntime) == 2)
          p_minvrun = _p1;

      }

      p = p_minvrun;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
      switchuvm(p); // HW setups.

      // Sum of weights: Helper loop to get sum of weights
      sum_weights = 0;
      for(_p2 = ptable.proc; _p2 < &ptable.proc[NPROC]; _p2++){       
        if(_p2->state != RUNNABLE && _p2->state != RUNNING)
          continue;
        sum_weights += _p2->weight;
      }
      
      p->time_slice = (10000 * p->weight)/sum_weights;
      p->state      = RUNNING;
      
      swtch(&(c->scheduler), p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);

  }
}

// Enter scheduler.  Must hold only ptable.lock
// and have changed proc->state. Saves and restores
// intena because intena is a property of this
// kernel thread, not this CPU. It should
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
  sched();
  release(&ptable.lock);
}

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");

  // Must acquire ptable.lock in order to
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
  p->state = SLEEPING;

  sched();

  // Tidy up.
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}

//PAGEBREAK!
// Wake up all processes sleeping on chan.
// The ptable lock must be held.
static void
wakeup1(void *chan)
{

  struct proc *p, *p_minvrun, *_p;
  uint min_vruntime[2] = {0,0};
  uint wtick;
  int flag;
  
  flag = 0;
  // get minimum vruntime here
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state != RUNNABLE)
      continue;

    flag         = 1; // some RUNNABLE exists.
    p_minvrun    = p;
    min_vruntime[1] = p_minvrun->vruntime[1];
    min_vruntime[0] = p_minvrun->vruntime[0];

    for(_p = ptable.proc; _p<&ptable.proc[NPROC]; _p++){
      if(_p->state != RUNNABLE)
        continue;

      if(_p->vruntime < p_minvrun->vruntime){
        p_minvrun = _p;
        min_vruntime[1] = p_minvrun->vruntime[1];
        min_vruntime[0] = p_minvrun->vruntime[0];
      }
    }
  }

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == SLEEPING && p->chan == chan){
      p->state = RUNNABLE;
      wtick    = ((1000 * 1024)/p->weight);
      if(flag){
        uint wtick_vector[2] = {0, wtick};
        int underflow = 0;
        underflow = vcompare(min_vruntime, wtick_vector);
        vsub(min_vruntime, wtick);
        p->vruntime[0] = min_vruntime[0];
        p->vruntime[1] = min_vruntime[1];

        if(underflow == 2){ 
          p->vruntime[0] = 0;
          p->vruntime[1] = 0;
        }
      } 
    }

}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
}

// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
  return -1;
}

//PAGEBREAK: 36
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
  static char *states[] = {
  [UNUSED]    "unused",
  [EMBRYO]    "embryo",
  [SLEEPING]  "sleep ",
  [RUNNABLE]  "runble",
  [RUNNING]   "run   ",
  [ZOMBIE]    "zombie"
  };
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
      state = states[p->state];
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}

int
getnice(int pid)
{

  struct proc *p;
  int niceValue = -1;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->pid == pid && p->state)
    {
      niceValue = p->priority;
      break;
    }
  }
  
  release(&ptable.lock);

  return niceValue;
}

int
setnice(int pid, int value)
{
  struct proc *p;
  int flag = 0;

  if(value < 0 || value >= 40) return -1;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
  {
    if(p->pid == pid && p->state)
    {
      p->priority = value;
      p->weight   = weights[p->priority];
      flag = 1;
      break;
    }
  }

  release(&ptable.lock);

  if(flag)
    return 0;
  else 
    return -1;
}

void printSpace(int times){
  for(int i = 0; i < times; i++)
    cprintf(" ");                              
}

void printTab(int times){
  for(int i = 0; i < times; i++)
    cprintf("\t");
}

int getdigits(int num){
  int digits = 0;
  int n      = num;

  if(num == 0) return 1;
  
  while(n != 0){
    n = n/10;
    digits++;
  }
  return digits;
}

void printLable()
{
  // p->name : 16 chars
  cprintf("%s", "name");
  printSpace(12);

  // p->pid  : 6 chars
  cprintf("%s", "pid");
  printSpace(3);

  // p->state: 10
  cprintf("%s", "state");
  printSpace(5);

  // p->priority: 8
  cprintf("%s", "priority");
  printTab(1);

  // runtime/weight: 14
  cprintf("%s", "runtime/weight");
  printTab(1);

  // runtime : 20
  cprintf("%s", "runtime");
  printSpace(13);

  // vruntime : no limit
  cprintf("%s", "vruntime");
  printSpace(12);
  
  cprintf("tick %d\n", ticks);
}

void printStatus(struct proc *p)
{
  int r, w;     // runtime, weight
  //>>
  uint * vr;    // vruntime
  //<<intov
  int _i, _c;   // helper variable to count p->name's length
  r  = p->runtime;
  vr = p->vruntime;
  w  = p->weight;

  // p->name : 16 chars
  for(_i = 0; (_c = p->name[_i] & 0xFF) != 0; _i++);
  _c = 16-_i;

  cprintf("%s", p->name);
  printSpace(_c);

  // p->pid  : 6 chars
  cprintf("%d", p->pid);
  _c = getdigits(p->pid);
  printSpace(6-_c);

  // p->state: 10
  cprintf("%s", states[p->state]);
  printSpace(2);

  // p->priority: 8
  cprintf("%d", p->priority);
  _c = getdigits(p->priority);
  printSpace(8-_c);
  printTab(1);
  
  // runtime/weight: 14
  cprintf("%d", r/w);
  _c = getdigits(r/w);
  printSpace(14-_c);
  printTab(1);
  
  // runtime : 20
  cprintf("%d", r);
  _c = getdigits(r);
  printSpace(20-_c);

  // vruntime : no limit
  printvr(vr);

  cprintf("\n");
}

void 
ps(int pid)
{
  struct proc *p;
 
  acquire(&ptable.lock);
  
  if(pid == 0)
  {
    printLable();
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
      if(p->state)
        printStatus(p);
  }
  else
  {
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
      if(p->pid == pid)
      {
        printLable();
        printStatus(p);
      }
  }
  
  release(&ptable.lock);

}


