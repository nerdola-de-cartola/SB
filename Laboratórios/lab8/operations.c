#include <stdio.h>


struct S { 

   int a;

   short b[2][2];

   long c;

};


union U { 

   char r[20];

   struct S s;

   int t[4];

};


union U var;


int main() {

   char *ptr = (char*)&var.s.b;


   var.r[3] = 0xFF;


   var.s.b[0][0] = 0x6548;

   var.s.b[0][1] = 0x6C6C;


   var.t[2] = 0xFFFF216F;


   ptr = ptr + (1 * 2 * sizeof(short)) + (1 * sizeof(short));

   *ptr = 0;


   ptr = ptr - 6;

   var.s.a = var.s.a >> 24; 


   printf("ptr = %s\n", ptr);

   printf("a = %X\n", var.s.a);


   return 0;

}