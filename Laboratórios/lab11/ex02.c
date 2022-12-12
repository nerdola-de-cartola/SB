int  a = 0;

long b = 2;


void ex02()

{

  if (a) {


   /*
   
   if(b >= 5) goto else
      Bloco if
      goto end
   else:
      Bloco else

   */


    if (b < 5) {

       b = (a << 1) + (a * b);

    }

    else {

       a = b ^ 0x1FL;

    }

  }

}