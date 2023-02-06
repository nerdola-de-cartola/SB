#include <stdio.h>
#include <math.h>

#define getsig(x)        ((x)>>63 & 1)

#define getexp(x)        ((x)>>52 & 0x7FF)

#define getfrac(x)       ((x) & 0xFFFFFFFFFFFFF)

#define makedouble(s, e, f) ((s & 1)<<63 | (((e) & 0x7FF) << 52) | ((f) & 0xFFFFFFFFFFFFF))


typedef union {

  double d;

  long int l;

} U; 

double maxdouble(double a, double b)
{

   U u1, u2;
   long int s1, m1, e1;
   long int s2, m2, e2;

   u1.d = a;
   u2.d = b;

   s1 = getsig(u1.l);
   s2 = getsig(u2.l);

   m1 = getfrac(u1.l);
   m2 = getfrac(u2.l);

   e1 = getexp(u1.l);
   e2 = getexp(u2.l);

   if(s1 == 1 && s2 == 0)
      return u2.d;
   else if(s1 == 0 && s2 == 1)
      return u1.d;
   else if(s1 == 0 && s2 == 0)
   {
      if(e1 > e2)
         return u1.d;
      else if(e2 > e1)
         return u2.d;
      else
      {
         if(m1 > m2)
            return u1.d;
         else if(m2 >= m1)
            return u2.d;
      }
   }
   else 
   {
      if(e1 < e2)
         return u1.d;
      else if(e2 < e1)
         return u2.d;
      else
      {
         if(m1 < m2)
            return u1.d;
         else if(m2 <= m1)
            return u2.d;
      }
   }

   return NAN;
}


int main()

{

   double a,b;


   a = 1.0;

   b = 2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a, b));


   a = -1.0;

   b = -2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.0;

   b = -2.0;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.5;

   b = 1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = -1.5;

   b = -1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = -1.5;

   b = -2.5;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   a = 1.5;

   b = -1.75;

   printf("maior de %f %f = %f\n", a,b, maxdouble(a,b));


   return 0;

}