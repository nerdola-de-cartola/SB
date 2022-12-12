.section .rodata


fmt: .string "Soma: %ld\n"


.data
   # long sum = 0;
   .globl sum
   .align 8
   sum: .quad 0

   # long vet[5] = {10, 20, 30, 40, 50};
   .globl vet
   .align 8
   vet: .quad 10, 20, 30, 40, 50


.text


.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # int i = 0;
   movl $0, %ecx

   # long *ptr = vet;
   movq $vet, %r8


beginwhile:

   cmpl $5, %ecx

   jge  endwhile      # while() {

   # sum = sum + *ptr;
   movq (%r8), %rax
   addq %rax, sum

   # ptr++;
   addq $8, %r8

   # i++;
   incl %ecx

   jmp beginwhile     # }

endwhile:


   movq $fmt, %rdi    # printf()

   movq sum, %rsi

   movl $0, %eax

   call printf


   movl $0, %eax      # return 0

   leave

   ret