.section .rodata
   .align 1
   str1: .string "sum = %ld\n"

.text
.globl main
main:
   pushq %rbp
   movq %rsp, %rbp
   subq $112, %rsp

   leaq -112(%rbp), %rdi
   call init

   movq -112(%rbp), %rdi
   movl $2, %esi
   call sum

   movq $str1, %rdi
   movq %rax, %rsi
   movl $0, %eax
   call printf

   movl $0, %eax

   leave
   ret

.globl sum
sum:
   pushq %rbp
   movq %rsp, %rbp
   subq $48, %rsp

   # salvando registradores
   movq %r12, -8(%rbp)
   movq %r13, -16(%rbp)
   movq %r14, -24(%rbp)
   # r12 representa i
   # r13 representa j
   # r14 representa h

   movq %rdi, -32(%rbp) # salva o node na pilha
   movl %esi, -36(%rbp) # salva o size na pilha

   call new_sum
   movq %rax, %r14

   movl $0, %r12d
   for1:
      cmp -36(%rbp), %r12d
      jge end_for1

      movl $0, %r13d
      for2:
         movslq %r12d, %rax
         imulq $56, %rax
         addq -32(%rbp), %rax
         cmp %r13d, 48(%rax)
         jge end_for2

         movq %r14, %rdi
         movslq %r13d, %r8
         imulq $8, %r8
         addq 8(%rax), %r8
         movq (%r8), %rsi
         call add_sum

         incl %r13d
         jmp for2
      end_for2:

      incl %r12d
      jmp for1
   end_for1:

   movq %r14, %rdi
   call get_sum

   # recuperando registradores
   movq -8(%rbp), %r12
   movq -16(%rbp), %r13
   movq -24(%rbp), %r14

   leave
   ret