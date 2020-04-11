#include "types.h"
#include "stat.h"
#include "user.h"


void testcfs()
{
	int parent = getpid();
	int child;
	int i;
	double x = 0, z;
	
	if((child = fork()) == 0) { // child
    printf(1, "child process init\n");
    setnice(parent, 5);		// if you set parent's priority lower than child, 
								// 2nd ps will only printout parent process,
								// since child finished its job earlier & exit
    printf(1, "child process: parent has low priority. 5. \n");
		for(i = 0; i < 3000; i++){
			for ( z = 0; z < 30000.0; z += 0.1 )
				x =  x + 3.14 * 89.64;
		}
    printf(1, "child calc done.\n");
		ps(0);
		exit();
	} else {	
    printf(1, "parent process init\n");
		setnice(child, 0); // parent
    printf(1, "child has high priority.0.\n");//parent
		for(i = 0; i < 3000; i++){
			for ( z = 0; z < 30000.0; z += 0.1 )
				x =  x + 3.14 * 89.64;
		}
    printf(1, "parent process: parent calc done.\n");
		ps(0);
		wait();
	}
}
int main(int argc, char **argv)
{
		printf(1, "=== TEST START ===\n");
		testcfs();
		printf(1, "=== TEST   END ===\n");
		exit();

}
