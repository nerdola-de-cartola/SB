.data
   .globl i
   .align 4
   i: .int 0

   .globl bias
   .align 8
   bias: .quad 256

   .globl vet
   .align 1
   vet: .byte 12, 3, 20, 8

.text


.globl main

main:

   pushq %rbp

   movq  %rsp, %rbp

   movl $0, i
   for:
      movl i, %eax
      cmp $4, %eax
      jge end_for

      # rax = &(vet[i])
      movslq i, %rax
      imulq $1, %rax
      addq $vet, %rax

      # bias = filtro(vet[i], LIM, bias)
      movb (%rax), %dil
      movl $10, %eax
      movw %ax, %si
      movq bias, %rdx
      call filtro
      movq %rax, bias

      # i++
      incl i

      jmp for
   end_for:
   
   # return 0
   movl $0, %eax

   leave

   ret