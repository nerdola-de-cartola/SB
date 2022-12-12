.section .rodata
   .align 1
   tmp: .string "Hello"

.data
   .globl val
   .align 4
   val: .int 432

   .globl age
   .align 2
   age: .word 4

   .globl r
   .align 4
   r: .int 0

   .globl err
   .align 8
   err: .quad 2048

.text


.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   # val = sum("Hello", val, age, &r);
   movq $tmp, %rdi
   movl val, %esi
   movw age, %dx
   movq $r, %rcx
   call sum
   movl %eax, val

   # show(err, val, r);
   movq err, %rdi
   movl val, %esi
   movl r, %edx
   call show

   # return 0
   movl $0, %eax

   leave

   ret