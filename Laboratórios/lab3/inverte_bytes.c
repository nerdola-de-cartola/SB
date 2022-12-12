#include <stdio.h>


unsigned int convertB2L(unsigned int x) {
   unsigned int little = 0x00;
   unsigned int mask = 0x000000FF;
  
   for(int i = 0; i < 4; i++) {
      little = little | (x & mask);
      x = x >> 8;

      if(i < 3) little = little << 8;
   }

   return little;
}


int main() {
   unsigned int big = 0x12AB34CD;
   unsigned int little = convertB2L(big); // 0xCD34AB12

   printf("big = 0x%08X\n", big);
   printf("little = 0x%08X\n", little);

   return 0;
}