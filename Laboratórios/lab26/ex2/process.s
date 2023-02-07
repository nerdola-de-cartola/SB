.section .rodata
   .align 1
   str1: .string "copy[%d] = %f\n"

.data
   .align 8
   .globl factor
   factor: .double 15.0

   .align 4
   .globl vets
   vets: .float 1.0, 2.0, 3.0, 4.0, 5.0

.text
.globl main
main:
   pushq %rbp
   movq %rsp, %rbp
   subq $48, %rsp

   # i: r8d | -44(%rbp)
   # j: r9d | -48(%rbp)
   # drop: r10
   # tmp: xmm0
   # copy: -40(%rbp) 

   movl $0, %r9d
   movq $50, %r10

   movl $0, %r8d
   for1:
      cmpl $5, %r8d
      jge end_for1

      movslq %r8d, %rax
      imulq $4, %rax
      addq $vets, %rax

      cvtss2sd (%rax), %xmm1
      mulsd factor, %xmm1
      movsd %xmm1, %xmm0

      cvtsi2sdq %r10, %xmm1
      ucomisd %xmm1, %xmm0
      jae end_if

         leaq -40(%rbp), %rcx
         movslq %r9d, %rax
         imulq $8, %rax
         addq %rcx, %rax

         movsd %xmm0, (%rax)

         incl %r9d

      end_if:

      incl %r8d

      jmp for1
   end_for1:

   movl $0, %r8d
   for2:
      cmpl %r9d, %r8d
      jge end_for2

      movl %r8d, -44(%rbp)
      movl %r9d, -48(%rbp)

      movq $str1, %rdi
      movl %r8d, %esi

      leaq -40(%rbp), %rcx
      movslq %r8d, %rax
      imulq $8, %rax
      addq %rcx, %rax

      movsd (%rax), %xmm0
      movl $1, %eax

      call printf

      movl -44(%rbp), %r8d
      movl -48(%rbp), %r9d

      incl %r8d

      jmp for2
   end_for2:

   movl $0, %eax

   leave 
   ret
