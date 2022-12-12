#include <stdio.h>

struct X {
  int   a;
  short b;
  int   c;
};

//       campos: a           b       c
struct X varx = {0xA1A2A3A4, 0xB1B2, 0xC1C2C3C4};

void dump(void *p, int n) {

  unsigned char *p1 = p;

  while (n--) {
    printf("%p - 0x%02X\n", p1, *p1);
    p1++;
  }
}


int main() {

   dump(&varx, sizeof(varx));
   return 0;
}