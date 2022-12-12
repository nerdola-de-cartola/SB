#include <stdio.h>


int odd_ones(unsigned int x) {
   unsigned char qtd = 0;
   unsigned int mask;

   for(mask = 0x01; x != 0x00; x = x >> 1) {
      if(x & mask) qtd++;
   }

   return qtd & 0x01;
}


int main() {
   unsigned int v;

   v = 0x01010101;
   printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");

   v = 0x01030101;
   printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");

   v = 0xFFFFFFFE;
   printf("%X tem número %s de bits\n", v, odd_ones(v) ? "impar" : "par");


   return 0;
}