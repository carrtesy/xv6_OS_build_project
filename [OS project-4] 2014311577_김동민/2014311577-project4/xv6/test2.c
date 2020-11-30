#include "types.h"
#include "stat.h"
#include "user.h"
#define N 10

int main(void){

  int pids[N];
  int i;
  int n = N;


  // Start children. 
  for (i = 0; i < n; i++) {

    if((pids[i] = fork()) < 0) {
      printf(1, "forkerror\n");
      exit();
    }
    else if (pids[i] == 0) {
      // child
      printf(1, "fork: child %d. \n", i+1);

      int *page = malloc(0x1d00000);
      int data;

      page[0] = 0;
      page[1024] = 1024;

      printf(1, "data before loop: [%d %d]\n", page[0], page[1024]);

      for(int i = 0; i < 2048; i++){
        data = (int)(i * 3.14 - 10);
        page[i] = data;
      }

      printf(1, "data after loop: [%d %d]\n", page[0], page[1024]);
      printf(1, "exit: child %d.\n", i+1);

      exit();
    }
  }


  // Wait for children to exit. 
  int pid;
  while (n > 0) {
    pid = wait();

    int sr, sw;
    swapstat(&sr, &sw);
    printf(1, "swapstat: sr: %d, sw: %d\n", sr, sw);
    printf(1, "Child with PID %d exits \n", pid);
    n--;
  }

  exit();
}

