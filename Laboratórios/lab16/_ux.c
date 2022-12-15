#include <stdio.h>


long x = 10;


long aux(int i, long *ptr) {

   x = 5;

   printf("Valor: x = %ld, i = %d\n", x, i);

   return x + i + *ptr;

}