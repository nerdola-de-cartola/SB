#include <stdio.h>


extern int  a;

extern long b;


void ex02();


int main()

{

  ex02();


  printf("a = %d (0x%.8X)\n", a, a);

  printf("b = %ld (0x%.16lX)\n", b, b);


  return 0;

}