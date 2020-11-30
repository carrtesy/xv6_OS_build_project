#include "types.h"
#include "user.h"
#include "stat.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
  int pid, result;

  if (argc != 2)
  {
    printf(2, "WRONG USAGE!\n USAGE: getnice (pid)\n");
    exit();
  }

  pid = atoi(argv[1]);

  result = getnice(pid);

  if (result != -1)
    printf(1, "Priority for pid %d is: %d\n", pid, getnice(pid));
  else
    printf(1, "There is no process with pid %d\n", pid);

  exit();
}
