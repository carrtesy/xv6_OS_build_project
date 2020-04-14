#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
	int pid;
	int pid2;

	setnice(1, 40);
	setnice(getpid(), 20);
	pid = fork();

	if(pid == 0) {
		printf(1, "4th\n");
	} else {
		setnice(pid, 30);
		printf(1, "1st\n");
		pid2 = fork();
		if (pid2 == 0) {
			printf(1, "3rd\n");
		} else {
			setnice(pid2, 25);
			printf(1, "2nd\n");
		}
	}
  ps(0);
	wait();
	wait();
	exit();
}
