#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"


int main () {
    int *a, *b;

    a = malloc(0x40000000);
    b = malloc(0x40000000);


    swapstat(a, b);
    exit();
}
