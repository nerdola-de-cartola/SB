#include <stdio.h>

#include <math.h>


#define getsig(i)        ((i)>>31 & 1)

#define getexp(i)        ((i)>>23 & 0xff)

#define getfrac(i)       ((i) & 0x7fffff)

#define makefloat(s,e,f) ( (((s) & 1) << 31) | (((e) & 0xff) << 23) | ((f) & 0x7fffff) )


typedef union {

  float f;

  unsigned int i;

} U;


float int2float(int i)
{
   unsigned int s = 0, e = 0, m = 0;
   U u;

   if(i < 0) {
      s = 1;
      i = -i;
   }

   if(i != 0) {

      m = i;
      e = 0;

      while(m != 1) { // Usa m como valor temporário
         m = m >> 1;
         e++;
      }

      m = i << (23 - e);
      e += 127;   
   }

   printf("i: 0x%X\n", i);
   printf("Sinal: %u\n", s);
   printf("Expoente: %u\n", e);
   printf("Mantissa: 0x%X\n", m);
   printf("\n");

   u.i = makefloat(s, e, m);

   return u.f;
}


int main() {

   int i;


   printf("\n******** int2float ****************\n");


   i = 0;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");


   i = 1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");



   i = -1;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");



   i = 0x7fffffff;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");


   i = -i;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");


   i = 12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");


   i = -12345;

   printf(" %d -> %+10.4f, %+10.4f\n", i, (float)i, int2float(i));
   printf("\n");


   return 0;

}