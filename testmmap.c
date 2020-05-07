#include "types.h"
#include "user.h"
#include "param.h"
#include "fcntl.h"

int main(int argc, char** argv) {
	printf(1, "mmap test \n");
	int i;
	int size = 8192;
	int fd = open("README", O_RDWR);
	char* text  = mmap(0, size, PROT_WRITE|PROT_READ, MAP_PRIVATE, fd, 0);							  //File example
	char* text2 = mmap(0, size, PROT_WRITE|PROT_READ, MAP_POPULATE|MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);  //ANONYMOUS example
	//char* text =  mmap(4096, size, PROT_WRITE|PROT_READ, MAP_PRIVATE|MAP_POPULATE|MAP_FIXED, fd, 0); // FIXED example

	for (i = 0; i < size; i++) 
		printf(1, "%c", text[i]);
	printf(1,"\n============file mmap end==========\n\n\n\n");

	text[0] = '$';
	text[4096] = '$';

  printf(1, "TEXT1\n");
  for (i = 0; i < size; i++)
    text[i] = '$';
    //printf(1, "%c", text[i]);
  printf(1, "\n");
  

  printf(1, "\n");
	for (i = 0; i < size; i++) 
		printf(1, "%c", text[i]);

  printf(1, "\n");

  printf(1, "TEXT2\n");
	for (i = 0; i < size; i++) 
		printf(1, "%c", text2[i]);
  printf(1, "\n");
	printf(1,"\n============anonymous mmap end==========\n");

	munmap(text);
	munmap(text2);

	exit();
}
