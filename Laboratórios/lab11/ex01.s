.section .rodata


.data
   .globl a
   .align 4
   a: .int 30

   .globl b
   .align 4
   b: .int 45

   .globl c
   .align 4
   c: .int -60

   .globl d
   .align 4
   d: .int 25


.text

.globl ex01

ex01:

   pushq %rbp

   movq  %rsp, %rbp


   movl a, %ecx
   cmpl b, %ecx
   jle .end_if1 # Bloco do if
      # c = -c
      negl c 

      # d = c / 3
      movl c, %eax
      cltd
      movl $3, %ecx
      idivl %ecx
      movl %eax, d


   .end_if1:

   movl a, %ecx
   cmpl %ecx, b
   jl .end_if2 # Bloco if
      # c = (a + b) * c
      movl a, %ecx
      addl b, %ecx
      imull c, %ecx
      movl %ecx, c

      movl $1024, d

   .end_if2:

   leave

   ret