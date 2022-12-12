#include <stdio.h>
#include <math.h>

unsigned char rotate_left(unsigned char x, int n);
unsigned char rotate_left_recursive(unsigned char x, int n);
unsigned char rotate_left_teacher(unsigned char x, int n);

int main(void) {

   unsigned char test = 0x61;

   printf("0x%02X\n", rotate_left(test, 1));
   printf("0x%02X\n", rotate_left(test, 2));
   printf("0x%02X\n", rotate_left(test, 7));

   printf("\n");

   printf("0x%02X\n", rotate_left_recursive(test, 1));
   printf("0x%02X\n", rotate_left_recursive(test, 2));
   printf("0x%02X\n", rotate_left_recursive(test, 7));

   return 0;
}

unsigned char rotate_left(unsigned char x, int n) {
   unsigned char mask;
   unsigned char end;
   int i;


   mask = 0x01;
   for(i = 0; i < n - 1; i++) {
      mask = mask << 1;
      mask = mask | 0x01;
      // printf("mask ==> 0x%02X\n", mask);
   }
   mask = mask << (8 - n);

   end = x & mask;
   end = end >> (8 - n);
   // printf("end ==> 0x%02X\n", end);
   
   x = x << n;
   
   return (x | end);
}

unsigned char rotate_left_recursive(unsigned char x, int n) {
   unsigned int end;

   if(n == 0) return x;

   end = x & 0x80;
   end = end >> 7;
   // printf("end ==> 0x%02X\n", end);

   x = x << 1;
   x = x | end;

   return rotate_left_recursive(x, n-1);
}

unsigned char rotate_left_teacher(unsigned char x, int n) {
   return (x >> (8 - n) | (x << n));
}