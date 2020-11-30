#include "types.h"
#include "stat.h"
#include "user.h"

int main(void){

  int sr, sw;
  for(int i = 0 ; i < 13 ; i++){
    sbrk(0x1000000);
    swapstat(&sr, &sw);
    printf(1, "swapstat: sr: %d, sw: %d\n", sr, sw);
  }

  sbrk(0xD00000);
  swapstat(&sr, &sw);
  printf(1, "swapstat: sr: %d, sw: %d\n", sr, sw);

  exit();
}
