.section .rodata
   .align 1
   str1: .string "Diferença em %d/%d: %ld\n"

.data
   .align 8
   .globl prods
   prods: .zero 48

.text
   .globl media
   media:
      pushq %rbp
      movq %rsp, %rbp
      subq $16, %rsp

      movq %r12, -8(%rbp)
      movq %r13, -16(%rbp)

      movl $0, %r12d
      movq $0, %r13

      for:
         movslq %r12d, %rax
         cmp %rsi, %rax
         jge end_for

         imulq $24, %rax

         addq 8(%rdi, %rax), %r13

         incl %r12d

         jmp for
      end_for:

      movq %r13, %rax
      cqto
      idivq %rsi

      movq -8(%rbp), %r12
      movq -16(%rbp), %r13

      leave
      ret

   .globl main
   main: 
      pushq %rbp
      movq %rsp, %rbp
      subq $32, %rsp

      movl $0, -4(%rbp)
      movq %rbx, -12(%rbp)

      movq $prods, %rbx
      movb $1, 0(%rbx)
      movq $100, 8(%rbx) 
      movl $2020, 16(%rbx)
      movb $2, 24(%rbx)
      movq $120, 32(%rbx)
      movl $2020, 40(%rbx)

      movq $prods, %rdi
      movq $2, %rsi
      call media
      movq %rax, -20(%rbp)

      movl -4(%rbp), %r8d # recupera a variável i

      while:
         cmp $2, %r8d
         jge end_while

         movq -20(%rbp), %r9 # recupera a variavel m

         movslq %r8d, %r8
         imulq $24, %r8

         movq $str1, %rdi
         movl 0(%rbx, %r8), %esi
         movl 16(%rbx, %r8), %edx
         movq 8(%rbx, %r8), %rcx
         subq %r9, %rcx
         movq $0, %rax
         call printf

         movl -4(%rbp), %r8d # recupera a variável i
         incl %r8d
         movl %r8d, -4(%rbp) # salva a variável i

         jmp while
      end_while:

      movq -12(%rbp), %rbx
      movl $0, %eax
      leave
      ret