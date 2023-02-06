.text
.globl calc1
calc1:
   pushq %rbp
   movq %rsp, %rbp

   # xmm0 representa a

   cvtss2sd %xmm1, %xmm2 # xmmm2 representa a variavel b extendida para double

   # usa xmm3 como registrador temporário
   movsd %xmm0, %xmm3
   addsd %xmm2, %xmm3

   # usa xmm4 como registrador temporário
   movsd %xmm0, %xmm4
   subsd %xmm2, %xmm4 

   mulsd %xmm3, %xmm4

   movsd %xmm4, %xmm0 # return
   leave
   ret