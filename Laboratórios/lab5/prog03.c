#include <stdio.h>


int main (void) {

   int x = 0xffffffff;
   unsigned int y = 2;

   // Imprime -1 e 2
   printf("x = %d, y = %d\n", x, y);

   // Realiza o casting implícito de int para unsigned int
   // Imprime não
   printf("x é menor do que y? %s\n", (x<y) ? "sim" : "não");

   return 0;

}