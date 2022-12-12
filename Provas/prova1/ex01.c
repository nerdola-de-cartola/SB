#include <stdio.h>

struct A {
   short a;
   int b;
   char c[10];
};

struct B {
   char x;
   char y;
   int z;
   long w;
   short k;
};

struct B varB = {
   .x = 1, .y = 'h', .z = 150, .w = 0x8182838485868788, .k = 256
};

void dump(void *ptr, int size) {
   unsigned char *p = (unsigned char*) ptr;

   while(size--) {
      printf("Endereço: %p - Valor: %02x\n", p, *p);
      p++;
   }
}

int main(void) {
   struct A *ptrA = (struct A*) &varB; 

   varB.k = ptrA->a * -1;

   ptrA->c[9] = 0;
   ptrA->c[8] = ptrA->c[8] ^ 192;

   varB.z = (varB.z & 25) << 1;
   varB.w = varB.w >> ptrA->b;

   dump(&varB, sizeof(struct B));

   return 0;
}
