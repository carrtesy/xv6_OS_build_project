#include "types.h"
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
	int before, after;
	int pid;

	printf(1, "TEST1: ");
	
	before = freemem();

  printf(1, "before: %d\n", before);
	pid = fork();
	if(pid == 0){
		after = freemem();
    printf(1, "after: %d\n", after);
		if(before - after == 68)
			printf(1, "OK\n");
		else
			printf(1, "WRONG\n");
		exit();
	}
	else{
		wait();
	}

	exit();
}
