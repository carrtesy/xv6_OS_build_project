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
	} else {
		setnice(pid, 30);
		printf(1, "1st\n");
		sleep(100);
		printf(1, "3rd\n");
	}

	wait();
    ps(0);
	exit();
}
