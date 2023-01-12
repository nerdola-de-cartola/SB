.section .rodata
   .align 1
   str1: .string "%ld\n"

.text
   .globl show
   show:
      pushq %rbp
      movq %rsp, %rbp
      subq $48, %rsp

      movq %rdi, -8(%rbp) # d
      movq %rbx, -16(%rbp) # Salvamento do rbx
      movq %rdi, %rbx # Salvando d em rbx
      movq 8(%rbx), %rax
      movq %rax, -24(%rbp) # ptr
      movl $0, -32(%rbp) # i

      movl -32(%rbp), %eax
      for:
         cmp (%rbx), %eax
         jge end_for

         movl %eax, -32(%rbp)
         
         

         movq $str1, %rdi
         movslq %eax, %rax
         movq 8(%rbx, %rax, 8), %rsi
         call printf

         movl -32(%rbp), %eax
         incl %eax

         jmp for
      end_for:
      
      

      movq -16(%rbp), %rbx

      leave
      ret