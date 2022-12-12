#include <stdio.h>


char process(char x) {

  return ~x + 1;

}


int main(void) {

   // Imprime -1
   printf("%d\n", process(1));

   // Imprime 5
   printf("%d\n", process(-5));

   // Imprime -35
   printf("%d\n", process(35));

   // Imprime 42
   printf("%d\n", process(-42));

   // Imprime -127
   printf("%d\n", process(127));

   // Imprime -128
   printf("%d\n", process(-128));

   return 0;

}