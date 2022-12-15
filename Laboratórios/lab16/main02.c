#include <stdio.h>


long aux(int i, long *ptr);


int main() {

  long v = 10;

  long r = aux(15, &v);

  printf("main: %ld\n", r);

  return 0;

}