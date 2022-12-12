#include <stdio.h>

struct X1 {
   char c1;
   int i;
   char c2;
};

struct X2 {
   long l;
   char c;
};

struct X3 {
   int i;
   char c1;
   char c2;
};

struct X4 {
  struct X2 x;
  char c;
};

struct X5 {
   short s1;
   int i;
   int c[2][3];
   short s2;
};

union U1 {
   int i;
   char c[5];
};

union U2 {
   short s;
   char c[5];
};

union U3 {
   struct X3 x;
   union U2 u;
};

void dump(void *p, int n) {

  unsigned char *p1 = p;

  while (n--) {
    printf("%p - 0x%02X\n", p1, *p1);
    p1++;
  }
}

int main() {
   union U3 varx;

   varx.x.i = 0xAAAAAAAA;
   varx.x.c1 = 0xBB;
   varx.x.c2 = 0xCC;
   varx.u.c[1] = 0xBB;
   varx.u.c[2] = 0xCC;
   varx.u.c[3] = 0xDD;
   varx.u.c[4] = 0xFF;
   varx.u.s = 0x1111;

   dump(&varx, sizeof(varx));
   return 0;
}