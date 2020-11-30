#include "types.h"
#include "x86.h"
#include "intpack.h"

// add normal unsigned integer to intpack type
void ipadd(struct intpack * a, uint b){
  // unsigned int covers up to 4,294,967,295
  // newly made overflow condition is 1,000,000,000
  a->lower += b;
  if( a->lower >= INTPACKMAX) {
    a->upper++;
    a->lower = a->lower - INTPACKMAX;
  }
}

void ipsub(struct intpack * a, uint b){
  if(a->lower > b){
    a->lower -= b;
  } else {
    a->upper--; // borrow from upper digit.
    a->lower = INTPACKMAX + a->lower - b;
  }
}

int ipcompare(struct intpack * a, struct intpack * b){
  // if value is same, return 0
  // a is bigger, return 1
  // b is bigger, return 2
  if(a->upper > b->upper)
    return 1;
  else if(a->upper < b->upper)
    return 2;
  else
  {
    if(a->lower > b->lower)
      return 1;
    else if(a->lower < b->lower)
      return 2;
    else
      return 0;
  }
}
