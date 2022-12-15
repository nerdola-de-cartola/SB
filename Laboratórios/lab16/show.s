.section .rodata
   .align 1
   str1: .string "%d\n"

.data

.text
   .globl show
   show:
      pushq %rbp
      movq %rsp, %rbp
      subq $16, %rsp

      movq %rdi, -8(%rbp)
      movl %esi, -12(%rbp)
      movl $0, -16(%rbp)

      movl -16(%rbp), %eax
      for:
         cmp %esi, %eax
         jge end_for
         
         movslq %eax, %rax
         imulq $4, %rax
         addq %rdi, %rax
         movq $str1, %rdi
         movl (%rax), %esi
         movl $0, %eax
         call printf

         movq -8(%rbp), %rdi
         movl -12(%rbp), %esi
         movl -16(%rbp), %eax

         incl %eax
         movl %eax, -16(%rbp)

         jmp for
      end_for:



      leave
      ret
