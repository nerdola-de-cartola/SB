#include <stdio.h>

#include <math.h>

#include <limits.h>


#define getsig(x)        ((x)>>31 & 1)

#define getexp(x)        ((x)>>23 & 0xff)

#define getfrac(x)       ((x) & 0x7fffff)

#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))


typedef union {

  float f;

  unsigned int i;

} U; 


int float2int(float f)
{
   U u;
   unsigned int s = 0, m = 0;
   int e = 0;
   int i = 0;

   u.f = f; 
   s = getsig(u.i);
   m = getfrac(u.i);
   e = getexp(u.i);
   e -= 127;

   if(f != 0) {

      if(e >= 31)
      {
         if(s)
            return INT_MIN;
         else  
            return INT_MAX;
      }

      i = m >> (23 - e);

      if(e >= 0) 
         i = (i | (1 << e));

      if(s)
         i = -i;
   }

   return i;
}


int main()

{

   float f;

   printf("\n******** float2int ****************\n");

   f = 0.0;  

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 1.0;  

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = -1.0;  

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 12345.0;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = -12345.0;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 1.5;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 2.5;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 2.4;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = 0.5;

   printf(" %+10.4f -> %d\n", f, float2int(f));

   f = (float)pow(2,31);

   printf(" %+10.4f (2^31) = overflow -> %d\n", f, float2int(f));

   f = -f;

   printf(" %+10.4f (-2^31) -> %d\n", f, float2int(f));

   f = (float)pow(2,32);

   f = -f;

   printf(" %+10.4f (-2^32) = overflow -> %d\n", f, float2int(f));

   return 0;

}