.section .rodata
   .align 1
   str1: .string "Valor: x = %ld, i = %d\n"

.data
   .globl x
   .align 8
   x: .quad 10

.text
   .globl aux
   aux:
      pushq  %rbp
      movq %rsp, %rbp

      subq $16, %rsp

      movq $5, x

      movl %edi, -4(%rbp)
      movq %rsi, -12(%rbp)

      # printf
      movq $str1, %rdi
      movq x, %rsi
      movl -4(%rbp), %edx
      movl $0, %eax
      call printf

      movl -4(%rbp), %edi
      movq -12(%rbp), %rsi

      movslq %edi, %rax
      addq x, %rax
      addq (%rsi), %rax

      leave
      ret