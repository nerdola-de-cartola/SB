#include <stdio.h>


int main() {

   signed char sc = -1;
   unsigned int ui = sc;

   // a-) Porque ficaria a critério do programador como ele iria completar os bytes extras que ui possui
   // resposta do professor a-) Porque o resultado muda dependendo de qual processo o compilador executa primeiro, a extensão ou o casting, os compiladores C decidiram executar a extensão primeiro

   // b-) Imprime 0xFFFFFFFF
   printf("0x%08X\n", ui);

   return 0;

}