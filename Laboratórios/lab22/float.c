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


float float2(float f)
{
   U float_int;
   float_int.f = f;

   unsigned int s = getsig(float_int.i);
   unsigned int e = getexp(float_int.i);
   unsigned int m = getfrac(float_int.i);

   e++;

   printf("Sinal: %u\n", s);
   printf("Expoente: %u\n", e);
   printf("Mantissa: 0x%X\n", m);

   float_int.i = makefloat(s, e, m);
  

   return float_int.f;
}


int main(void) {

   float f = 0.125;

   printf("%f\n", float2(f));

}