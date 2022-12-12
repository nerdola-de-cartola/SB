.section .rodata
   .align 1
   str1: .string "'a' maior do que 'b'\n"

   .align 1
   str2: .string "Valor de 'b': %d\n"

.data
   .globl a
   .align 1
   a: .byte 106

   .globl b
   .align 1
   b: .byte 105

.text


.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   movb a, %dil
   movb b, %sil
   call maximo

   movsbl a, %ecx
   cmp %ecx, %eax
   jne else
      movq $str1, %rdi
      movl $0, %eax
      call printf

      jmp end_if
   else:
      movq $str2, %rdi
      movsbl b, %esi
      movl $0, %eax
      call printf
   end_if:

   movl $0, %eax

   leave

   ret