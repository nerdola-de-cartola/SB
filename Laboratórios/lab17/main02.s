.data
   .globl v1
   .align 2
   v1: .word 1, 2

   .globl v2
   .align 2
   v2: .quad 1, 2, 3

.text
   .globl aux
   aux:
      pushq %rbp
      movq %rsp, %rbp
      subq $32, %rsp

      movq %rdi, -8(%rbp)
      movl %esi, -12(%rbp)
      movq %rbx, -20(%rbp)

      movl $2, %ebx
      for:
         cmp $0, %ebx
         jl end_for

         movq -8(%rbp), %rdi
         movl -12(%rbp), %esi
         movq $v2, %rdx
         movl %ebx, %ecx
         call sum

         decl %ebx

         jmp for
      end_for:

      movq -20(%rbp), %rbx

      leave
      ret

   .globl main
   main:
      pushq %rbp
      movq %rsp, %rbp
      subq $16, %rsp

      movq %rbx, -8(%rbp)

      movl $0, %ebx
      while:
         cmp $2, %ebx
         jge end_while

         movq $v1, %rdi
         movl %ebx, %esi
         call aux

         incl %ebx

         jmp while
      end_while:

      movq -8(%rbp), %rbx
      movl $0, %eax

      leave 
      ret

      