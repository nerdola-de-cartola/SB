.section .rodata
   .align 1
   str1: .string "a = %f, b = %f, e = %f\n"


.text
.globl calc2
calc2:
   pushq %rbp
   movq %rsp, %rbp
   subq $16, %rsp

   # pilha
   # -4 -> a
   # -8 -> b

   # salva a e b
   movss %xmm0, -4(%rbp)
   movss %xmm1, -8(%rbp)

   cvtss2sd %xmm1, %xmm0
   call cos # retorno salvo no xmm0

   movss -4(%rbp), %xmm1 # salva a no xmm1
   cvtss2sd %xmm1, %xmm2 # salva o a convertido para double no xmm2

   addsd %xmm2, %xmm0 # a + cos(b)
   movsd %xmm0, %xmm15 # xmm15 representa a variavel e

   # salva a
   movss %xmm1, -4(%rbp)

   movq $str1, %rdi # passa a string
   movsd %xmm2, %xmm0 # passa o a convertido em double
   movss -8(%rbp), %xmm1 # recupera o b
   cvtss2sd %xmm1, %xmm1 # converte o b para double
   movsd %xmm15, %xmm2 # passa o e
   movl $3, %eax # seta o eax
   call printf

   movss -8(%rbp), %xmm0 # return b 

   leave
   ret