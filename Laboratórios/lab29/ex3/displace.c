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

   // Sum
   0x55,        
   0x48, 0x89, 0xe5,       
   0x89, 0x7d, 0xfc,             
   0x8b, 0x45, 0xfc,             
   0x83, 0xc0, 0x02,       
   0x5d,        
   0xc3,                      
   0x90,

   // Mul
   0x55,          
   0x48, 0x89, 0xe5,         
   0x89, 0x7d, 0xfc,               
   0x8b, 0x45, 0xfc,               
   0xc1, 0xe0, 0x01,         
   0x5d,          
   0xc3,                      
   0x90,                      

   // Process
   0x55,                    
   0x48, 0x89, 0xe5,              
   0x48, 0x83, 0xec, 0x10,           
   0x89, 0x7d, 0xfc,              
   0x8b, 0x7d, 0xfc,              
   0xe8, 0x00, 0x00, 0x00, 0x00,        
   0x48, 0x83, 0xc4, 0x10,           
   0x5d,                    
   0xc3,

};


int main()
{

   int i;

   FuncPtr f;


   build_exec();

   unsigned long addr = (unsigned long) &exec_code[0];
   unsigned long pc = (unsigned long) &exec_code[51];

   int displacement = (int) (addr - pc);

   int *addr_to_modify = (int *) &exec_code[47];

   *addr_to_modify = displacement;

   printf("%d\n", displacement);

   printf("%x\n", exec_code[58]);
   printf("%x\n", exec_code[59]);
   printf("%x\n", exec_code[60]);
   printf("%x\n", exec_code[61]);

   // Chama a função "process"
   f = (FuncPtr) &exec_code[32];

   i = f(10);

   printf("%d\n", i);


   //---------------------------------------


   // Alterar "process" para chamar a função "mul"


   //---------------------------------------


   // Chama a função "process"

   //f = (FuncPtr)exec_code;

   //i = f(10);

   //printf("%d\n", i);

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