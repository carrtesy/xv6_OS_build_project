#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
	int pid;
	int pid2;

  // only for parent
 // printf(1, "setnice 1 to 39\n");
	setnice(1, 39);
//  ps(1);
 // printf(1, "setnice getpid():%d to 20\n", getpid());
	setnice(getpid(), 20);
 // ps(getpid());

  // fork
	pid = fork();
 // printf(1, "pid:%d \n", pid);
 
	if(pid == 0) {
		printf(1, "4th\n");
	} else {
   // printf(1, "setnice pid: %d to 30\n", pid);
		setnice(pid, 30);
		printf(1, "1st\n");
		pid2 = fork();
   // printf(1, "pid2:%d \n", pid2);
		if (pid2 == 0) {
			printf(1, "3rd\n");
		} else {
     // printf(1, "setnice pid2:%d to 25\n", pid2);
			setnice(pid2, 25);
			printf(1, "2nd\n");
		}
	}

	wait();
	wait();
	exit();
}
