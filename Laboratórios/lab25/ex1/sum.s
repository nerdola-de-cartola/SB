.section .rodata
   .align 8
   double1: .double 0.0

   .align 1
   str1: .string "Soma %f maior que o limite %f (%d)\n"

.text
.globl sum
sum:
   pushq %rbp
   movq %rsp, %rbp
   subq $80, %rsp

   # salva registradores calle saved
   movq %rbx, -56(%rbp)

   # salva os parâmetros na pilha
   movsd %xmm0, -72(%rbp)

   # i = 4
   movl $4, %ebx

   # s = 0
   movsd double1, %xmm0

   # vi[4] = {5,6,7,8};
   movl $5, -48(%rbp)
   movl $6, -44(%rbp)
   movl $7, -40(%rbp)
   movl $8, -36(%rbp)

   # salva registradores caller saved
   movsd %xmm0, -64(%rbp)

   leaq -48(%rbp), %rdi # passa vi
   leaq -32(%rbp), %rsi # passa vd
   movl %ebx, %edx # passa i
   call mult
   
   # recupera registradores caller saved
   movsd -64(%rbp), %xmm0
   movsd -72(%rbp), %xmm1

   while:
      cmpl $0, %ebx
      jle end_while

      decl %ebx # i--

      # vd[i]
      leaq -32(%rbp), %rcx
      movslq %ebx, %rax
      imulq $8, %rax
      addq %rcx, %rax

      addsd (%rax), %xmm0

      ucomisd %xmm1, %xmm0
      jbe end_if
      
      # salva registradores caller saved
      movsd %xmm0, -64(%rbp)         
      movsd %xmm1, -72(%rbp) 

      # passa parâmetros
      movq $str1, %rdi
      # movsd %xmm0, %xmm0
      # movsd %xmm1, %xmm1
      movl %ebx, %esi # passa i     
      movl $2, %eax

      call printf

      # recupera registradores caller saved
      movsd -64(%rbp), %xmm0         
      movsd -72(%rbp), %xmm1 


      end_if:

      jmp while
   end_while:

   # recupera registradores calle
   movq -56(%rbp), %rbx

   # return
   # movsd %xmm0, %xmm0

   leave
   ret