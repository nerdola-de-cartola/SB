#include <stdio.h>
#include <stdlib.h>

int main(void) {

   int v[3] = {0, 1, 9};
   int *v2 = malloc(3 * sizeof(int));

   // Erro, array is not assignable
   // v = 0x13be2a0;

   printf("%p\n", v);
   printf("%p\n", &v);
   printf("%p\n", &v[0]);

   printf("\n");
   
   // OK
   // v2 = (int *) 0x7ffc6fd48600;
   
   printf("%p\n", v2);
   printf("%p\n", &v2);
   printf("%p\n", &v2[0]);

   return 0;
}