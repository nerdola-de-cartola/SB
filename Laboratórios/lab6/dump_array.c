#include <stdio.h>

void dump(void *p, int n) {

  unsigned char *p1 = p;

  while (n--) {
    printf("%p - 0x%02X\n", p1, *p1);
    p1++;
  }

}

int a[2] = {0xA1A2A3A4, 0xB1B2B3B4};

short b[2][3] = {
  {0xA1A2, 0xB1B2, 0xC1C2},
  {0xD1D2, 0xE1E2, 0xF1F2}
};


int main() {

  printf("size(a): %lu\n", sizeof(a));
  printf("size(b): %lu\n", sizeof(b));

  printf("---\n");

  printf("a: \n");
  dump(a, sizeof(a));

  printf("---\n");

  printf("b: \n");
  dump(b, sizeof(b));


  return 0;

}