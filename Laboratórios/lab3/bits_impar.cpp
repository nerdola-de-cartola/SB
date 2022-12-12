#include <stdio.h>

template <typename T>
bool odd_ones(T x) {
   bool odd = false;
   x = (unsigned) x;

   for(T mask = 1; x != 0; x = x >> 1) {
      bool bit = x & mask;
      if(bit) odd = !odd;
   }

   return odd;
}


int main() {
   unsigned int i;

   i = 0x01010101;
   printf("%X tem número %s de bits\n", i, odd_ones(i) ? "impar" : "par");

   i = 0x01030101;
   printf("%X tem número %s de bits\n", i, odd_ones(i) ? "impar" : "par");

   i = 0xFFFFFFFE;
   printf("%X tem número %s de bits\n", i, odd_ones(i) ? "impar" : "par");

   unsigned char c = 0xFF;
   printf("%X tem número %s de bits\n", c, odd_ones(c) ? "impar" : "par");

   long int li = 0xFFFFFFFFFFFFFFFE;
   printf("%lX tem número %s de bits\n", li, odd_ones(li) ? "impar" : "par");

   return 0;
}