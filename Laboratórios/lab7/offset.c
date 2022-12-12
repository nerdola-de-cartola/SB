#include <stdio.h>

typedef struct {
   unsigned long int adr;
   unsigned int size;
   char name;
} Offset;


struct S {

  long  a;

  char  b;  

  int   c;

  short d;

};

void sort(Offset *arr, int size) {
   int i, j;
   int menor;

   for(i = 0; i < size - 1; i++) {
      menor = i;

      for(j = i+1; j < size; j++) {
         if(arr[j].adr < arr[menor].adr) menor = j;
      }

      if(menor != i) {
         Offset tmp = arr[i];
         arr[i] = arr[menor];
         arr[menor] = tmp;
      }
   }
}

void offsets(struct S *ptr) {
   Offset arr[4];
   unsigned long dif;

   arr[0].adr = (unsigned long int) &ptr->a;
   arr[0].size = sizeof(ptr->a);
   arr[0].name = 'a';
   
   arr[1].adr = (unsigned long int) &ptr->b;
   arr[1].size = sizeof(ptr->b);
   arr[1].name = 'b';
   
   arr[2].adr = (unsigned long int) &ptr->c;
   arr[2].size = sizeof(ptr->c);
   arr[2].name = 'c';

   arr[3].adr = (unsigned long int) &ptr->d;
   arr[3].size = sizeof(ptr->d);
   arr[3].name = 'd';
   
   sort(arr, 4);

   printf("Offset de %c: 0\n", arr[0].name);

   dif = arr[1].adr - arr[0].adr - arr[0].size;
   printf("Offset de %c: %ld\n", arr[1].name, dif);

   dif = arr[2].adr - arr[1].adr - arr[1].size;
   printf("Offset de %c: %ld\n", arr[2].name, dif);

   dif = arr[3].adr - arr[2].adr - arr[2].size;
   printf("Offset de %c: %ld\n", arr[3].name, dif);
}


//----------------------------------------------

// Cria a variável varS
struct S varS;


int main() {

  offsets(&varS);

  return 0;

}