#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>

typedef int (*FuncPtr)(int x);

void build_exec();

// Ponteiro para uma área de memória executável
unsigned char *exec_code;

// Código executável
unsigned char codigo[] = {
   0x55,
   0x48,
   0x89,
   0xe5,
   0x89,
   0x7d,
   0xfc,
   0x8b,
   0x45,
   0xfc,
   0x83,
   0xc0,
   0x01,
   0x5d,
   0xc3
};

int main()
{

  int i;


  build_exec();


  // Faz um cast da memória para uma função 
  FuncPtr f = (FuncPtr)exec_code;


  i = f(10);

  printf("%d\n", i);


  return 0;
}


// Cria uma área de memória executável para o código
void build_exec()
{

  // Pede ao SO uma área de memória para código executável
  exec_code = mmap(NULL,

                   getpagesize(),

                   PROT_EXEC | PROT_READ | PROT_WRITE,

                   MAP_PRIVATE | MAP_ANONYMOUS,

                   -1, 0);


  if (exec_code == MAP_FAILED)
  {

    printf("[ERRO] Não foi possível alocar memória executável\n");

    exit(1);

  }


  // Copia o código binário para a área executável
  memcpy(exec_code, codigo, sizeof(codigo));

}