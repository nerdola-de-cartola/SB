#include <stdio.h>


#include "aux1.h"


void t_init(struct Temperatura *t);


float collect(struct Data *ptr, float limit, int count) {

   float sum = 0.0;

   struct Temperatura t;

   int i = 0;


   t_init(&t);


   while (i < count) {

      if (ptr[i].sum < limit)

         sum = sum + (t.repeated * ptr[i].sum);

      else {

         printf("Fail: sum = %f, limit = %f, count = %d\n", ptr[i].sum, (double)limit, count);

         ptr[i].fail++;

      }

      i++;

   }

   return sum;

}