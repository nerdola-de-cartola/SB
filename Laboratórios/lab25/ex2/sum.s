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

   # salva registradores callee
   movq %rbx, -64(%rbp)

   movl $4, %ebx # i = 4

   movsd double1, %xmm1 # s = 0.0

   # vi[4] = {5,6,7,8}
   movl $5, -16(%rbp)
   movl $6, -12(%rbp)
   movl $7, -8(%rbp)
   movl $8, -4(%rbp)

   # salva os registradores caller
   movsd %xmm0, -72(%rbp) # limit
   movsd %xmm1, -56(%rbp) # s

   leaq -16(%rbp), %rdi
   leaq -48(%rbp), %rsi
   movl %ebx, %edx
   call mult

   # recupera os registradores caller
   movsd -72(%rbp), %xmm0 # limit
   movsd -56(%rbp), %xmm1 # s

   while:
      # i > 0
      cmpl $0, %ebx
      jle end_while

      decl %ebx # i--

      leaq -48(%rbp), %rax
      movslq %ebx, %rcx
      imulq $8, %rcx
      addq %rax, %rcx

      addsd (%rcx), %xmm1

      # s > limit
      ucomisd %xmm0, %xmm1
      jbe end_if

         # salva os registradores caller
         movsd %xmm0, -72(%rbp) # limit
         movsd %xmm1, -56(%rbp) # s

         movq $str1, %rdi
         movsd -56(%rbp), %xmm0
         movsd -72(%rbp), %xmm1
         movl %ebx, %esi
         movl $2, %eax
         call printf

         # recupera os registradores caller
         movsd -72(%rbp), %xmm0 # limit
         movsd -56(%rbp), %xmm1 # s

      end_if:

      jmp while
   end_while:

   # recupera registradores callee
   movq -64(%rbp), %rbx

   # return s
   movsd %xmm1, %xmm0

   leave
   ret