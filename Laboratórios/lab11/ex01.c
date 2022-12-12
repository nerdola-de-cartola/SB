int a = 30;

int b = 45;

int c = -60;

int d = 25;


void ex01()

{

   /*
   if(a <= b) goto end_if1;
      bloco

   if(b < a) goto end_if2
      bloco
   */

  if (a > b) {

    c = -c;

    d = c / 3;

  }


  if (b >= a) {

    c = (a + b) * c;

    d = 1024;

  }

}