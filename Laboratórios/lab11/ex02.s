.section .rodata


.data
   .globl a
   .align 4
   a: .int 7

   .globl b
   .align 8
   b: .quad 5


.text

.globl ex02
ex02:

   pushq %rbp

   movq  %rsp, %rbp

   cmpl $0, a
   je .L2

   cmpq $5, b
   jge .L1
      # Bloco if (b < 5)

      # (a << 1)
      movl a, %r8d
      shll $1, %r8d

      # (a * b)
      movslq a, %r9
      imulq b, %r9

      movslq %r8d, %r8

      addq %r9, %r8
      movq %r8, b

      jmp .L2
   .L1:
      # Bloco else
      movq b, %r8
      xorq $0x1F, %r8
      movl %r8d, a

   .L2:
   # Bloco normal

   leave

   ret