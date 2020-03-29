#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
  int pid;

  if(argc != 2)
  {
    printf(2, "WRONG USAGE!\n USAGE: ps (pid)\n");
    exit();
  }

  pid = atoi(argv[1]);

  ps(pid);

  exit();
}
