#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
	int pid;

	setnice(1, 40);
	setnice(getpid(), 20);
	pid = fork();

	if (pid == 0) {
		printf(1, "2nd\n");
	//	yield();
		printf(1, "4th\n");
	} else {
		printf(1, "1st\n");
	//	yield();
		printf(1, "3rd\n");
	}

	wait();
	exit();
}
