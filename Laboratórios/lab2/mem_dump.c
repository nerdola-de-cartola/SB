#include <stdio.h>


void dump(void *addr, int n) {

  unsigned char *p = (unsigned char *)addr;

  while (n--) {

    printf("%p - %02X\n", p, *p);

    p++;

  }

}

int main() {
   int i = 10000;
   short int si = 10000;
   long int li = 10000;
   char c = 100;
   char s[] = "1000";

   dump(&i, sizeof(i));
   printf("\n");
   
   dump(&si, sizeof(si));
   printf("\n");

   dump(&li, sizeof(li));
   printf("\n");

   dump(&c, sizeof(c));
   printf("\n");

   dump(&s, sizeof(s));
   printf("\n");
   

   /*
   É esperado a impressão do número na notação little endian

   Para 1000 em decimal

   Binário
   0000 0000 0000 0000 0000 0011 1110 1000 - Big endian
   1000 1110 0011 0000 0000 0000 0000 0000 - Little endian

   Hexadecimal
   00 00 03 E8 - Big endian
   E8 03 00 00 - Little endian

   Para 10000 em decimal

   Binário
   0000 0000 0000 0000 0010 0111 0001 0000 - Big endian
   0000 0001 0111 0010 0000 0000 0000 0000 - Little endian

   Hexadecimal
   00 00 27 10 - Big endian
   10 27 00 00 - Little endian
   */

   return 0;
}