#include <stdio.h>


struct X {

  int   a;

  short b;

  int   c;

};


// Cria a variável x e inicializa os campos da estrutura

struct X x = {

   .a = 2048,

   .b = 17,

   .c = 0xBebaCafe

};


int main() {

  char  *pChar;

  short *pShort;


  printf("x.a = %d\n", x.a); // 2048

  printf("x.b = %d\n", x.b); // 17

  printf("x.c = %x\n", x.c); //0xBebaCafe


  printf("---\n");


  pChar  = (char*)&x; // Aponta para o começo da estrutura
  pChar  = pChar + 4; // Anda 4 bytes para frente

  *pChar = *pChar | 0x20; //Liga o sexto bit


  printf("x.a = %d\n", x.a); // 2048

  printf("x.b = %d\n", x.b); // 49

  printf("x.c = %x\n", x.c); // 0xBebaCafe


  printf("---\n");


  pShort = (short*)&x;

  pShort[3] = 0xFFFF;


  printf("x.a = %d\n", x.a);

  printf("x.b = %d\n", x.b);

  printf("x.c = %x\n", x.c);


  return 0;

}