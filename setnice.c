#include "types.h"
#include "user.h"
#include "stat.h"
#include "fcntl.h"

int main(int argc, char *argv[])
{
  int pid, value, result;

  if(argc !=  3)
  {
    printf(2, "WRONG USAGE!\nUSAGE: setnice (pid) (value)\n");
    exit();
  }

  pid = atoi(argv[1]);
  value = atoi(argv[2]);

  if( value < 0 || value >= 40)
  {
    printf(2, "INVALID PRIORITY VALUE. RANGE: (0~39). \n");
    exit();
  }

  result = setnice(pid, value);
  
  if(result == 0)
    printf(1, "Process with pid %d has been set to: %d\n", pid, value);
  else
    printf(1, "There is no process with pid %d\n", pid);

  exit();
}
