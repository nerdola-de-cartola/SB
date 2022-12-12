#include <stdio.h>

struct Dados {
   struct Dados *prox;
   unsigned char flags;
   int vall;
   int vall2;
};

void dump(void *ptr, int size) {
   unsigned char *p = (unsigned char*) ptr;

   while(size--) {
      printf("Endereço: %p - Valor: %02x\n", p, *p);
      p++;
   }
}

struct Dados dados[4];

int main(void) {
   dados[0].prox = &dados[1];
   dados[0].flags = (5 << 3) & 160;
   dados[0].vall = -1027;
   dados[0].vall2 = 133;

   dump(dados, sizeof(struct Dados));

   return 0;
}