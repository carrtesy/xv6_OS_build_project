#include "types.h"
#include "user.h"
#include "stat.h"

int main()
{
  double sum;
  int pid;
  printf(1, "foo.c\n");
  sum = 0;
 
  setnice(1, 5);
  setnice(2, 5);
  pid = getpid();
  setnice(pid, 5);
  pid = fork();

  printf(1, "%d\n", pid);
  for(int i=1; i <= 10000000; i++)
  {
    sum += i;
    sum += 3.1415;
    sum = i / sum;
  }
  printf(1, "%d\n", sum);
  
  ps(0);
  return 0;
}
