#include <stdlib.h>
#include <stdio.h>
#include <map>

void initTable(std::map<char, int> &table) {
   table['0'] = 0;
   table['1'] = 1;
   table['2'] = 2;
   table['3'] = 3;
   table['4'] = 4;
   table['5'] = 5;
   table['6'] = 6;
   table['7'] = 7;
   table['8'] = 8;
   table['9'] = 9;

   table['a'] = 10;
   table['b'] = 11;
   table['c'] = 12;
   table['d'] = 13;
   table['e'] = 14;
   table['f'] = 15;
   table['g'] = 16;
   table['h'] = 17;
   table['i'] = 18;
   table['j'] = 19;
   table['k'] = 20;
   table['l'] = 21;
   table['m'] = 20;
   table['n'] = 23;
   table['o'] = 24;
   table['p'] = 25;
   table['q'] = 26;
   table['r'] = 27;
   table['s'] = 28;
   table['t'] = 29;
   table['u'] = 30;
   table['v'] = 31;
   table['w'] = 32;
   table['x'] = 33;
   table['y'] = 34;
   table['z'] = 35;

   table['A'] = 10;
   table['B'] = 11;
   table['C'] = 12;
   table['D'] = 13;
   table['E'] = 14;
   table['F'] = 15;
   table['G'] = 16;
   table['H'] = 17;
   table['I'] = 18;
   table['J'] = 19;
   table['K'] = 20;
   table['L'] = 21;
   table['M'] = 20;
   table['N'] = 23;
   table['O'] = 24;
   table['P'] = 25;
   table['Q'] = 26;
   table['R'] = 27;
   table['S'] = 28;
   table['T'] = 29;
   table['U'] = 30;
   table['V'] = 31;
   table['W'] = 32;
   table['X'] = 33;
   table['Y'] = 34;
   table['Z'] = 35;
}

int string2num(const char *str, int base) {
   std::map<char, int> table;
   initTable(table);
   
   if(base > 36) {
      printf("Erro - base inválida");
      exit(1);
   }

   int num = 0;
   int i = 0;
   while(str[i] != '\0') {
      if(table[str[i]] >= base) {
         printf("Erro - digito inválido\n");
         exit(1);
      }

      num = num*base +  table[str[i]];
      i++;
   }

   return num;
}


int main () {
   printf("Base decimal\n");
   printf("==> %d\n", string2num("1234", 10)); // 1234
   printf("==> %d\n", string2num("1234", 10) + 1); // 1235
   printf("==> %d\n", string2num("1234", 10) + string2num("1", 10)); // 1235

   printf("\n");

   printf("Base binária\n");
   printf("==> %d\n", string2num("1110", 2));
   printf("==> %d\n", string2num("101110", 2));
   printf("==> %d\n", string2num("111111110", 2));
   printf("==> %d\n", string2num("0101001", 2));

   printf("\n");

   printf("Base octal\n");
   printf("==> %d\n", string2num("72600", 8));
   printf("==> %d\n", string2num("2675", 8));
   printf("==> %d\n", string2num("777111", 8));
   printf("==> %d\n", string2num("03544723", 8));

   printf("\n");

   printf("Base hexadecimal\n");
   printf("==> %d\n", string2num("1efa0", 16));
   printf("==> %d\n", string2num("FFAADE", 16));
   printf("==> %d\n", string2num("7AAAA", 16));
   printf("==> %d\n", string2num("AAAAEEE", 16));

   return 0;
}