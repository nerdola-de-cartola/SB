#include <stdio.h>

struct Foo {
   char *ptr;
   short displace;
   int age;
};

void dump(void *ptr, int size) {
   unsigned char *p = (unsigned char*) ptr;

   while(size--) {
      printf("Endereço: %p - Valor: %02x\n", p, *p);
      p++;
   }
}

struct Foo foo;
char names[3][2] = {
   {'A', 'B'},
   {'F', 'G'},
   {'P', 'Q'}
};

int main(void) {
   foo.ptr = &names[1][1];

   foo.ptr[1] = foo.ptr[1] << 1;
   printf("%d\n", foo.ptr[1]);

   foo.age = foo.ptr[1] & names[2][0];
   printf("%d\n", foo.age);

   foo.displace = -24;
   foo.age = foo.age + foo.displace;
   printf("%d\n", foo.age);


   dump(&foo, sizeof(foo));

   return 0;
}
