.section .rodata
   .align 1
   str1: .string "color: %ld, filled: %d\n"

.data
   .globl c1
   .align 8
   c1:
      .zero 24

.text
   .globl main
   main:
      pushq %rbp
      movq %rsp, %rbp

      movq $c1, %rax

      movl $10, (%rax)

      movl (%rax), %r8d
      imull $2, %r8d
      movl %r8d, 4(%rax)

      movb $1, 8(%rax)

      cmpl $30, 4(%rax)
      jle if
      cmpb $1, 8(%rax)
      je if
      jmp else
      if: 
         movq $2, 16(%rax)

         jmp end_if
      else:
         movq $1, 16(%rax)

      end_if:

      movq $str1, %rdi
      movq 16(%rax), %rsi
      movsbl 8(%rax), %edx
      call printf

      leave
      ret

