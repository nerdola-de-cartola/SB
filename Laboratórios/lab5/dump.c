#include <stdio.h>


void dump(void *p, int n) {

   unsigned char *p1 = p;

   while (n--) {

      printf("%p - 0x%02X\n", p1, *p1);

      p1++;

   }

}


int main(void) {

   // s: 1111 1111 1111 1101
   // Complemento de s: 0000 0000 0000 0011 = 3
   short s = -3;

   // i: 1111 1111 1111 1111 1111 1111 0110 1001
   // Complemento de i: 0000 0000 0000 0000 0000 0000 1001 0111
   int i = -151;

   // c : 1001 0110
   char c = 150;



   // Imprime 0xFDFF
   printf("dump de s: %d\n", s);
   dump(&s, sizeof(s));

   //Imprime 0x69FFFFFF
   printf("\ndump de i: %d\n", i);
   dump(&i, sizeof(i));

   //Imprime 0x96
   printf("\ndump de c: %d\n", c);
   dump(&c, sizeof(c));


   return 0;

}