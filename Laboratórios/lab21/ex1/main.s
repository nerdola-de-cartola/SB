.section .rodata
   .align 1
   str1: .string "Person ID: %ld\n"

   .align 1
   str2: .string "tipo = %d, ID = %ld, nome = '%s', idade = %d\n"

.text
   .globl main
   main:
      pushq %rbp
      movq %rsp, %rbp
      subq $128, %rsp

      leaq -40(%rbp), %rdi
      call readPerson

      leaq -120(%rbp), %rdi
      call readCar

      leaq -80(%rbp), %rdi
      call readCar

      movq $str1, %rdi
      movq -32(%rbp), %rsi
      movl $0, %eax
      call printf

      leaq -40(%rbp), %rdi
      call showPerson

      leaq -120(%rbp), %rdi
      call showCar

      leaq -80(%rbp), %rdi
      call showCar

      movl $0, %eax
      leave
      ret

   .globl showPerson
   showPerson:
      pushq %rbp
      movq %rsp, %rbp

      movq %rdi, %rax # salva o parâmetro

      movq $str2, %rdi # string
      movl 0(%rax), %esi # type
      movq 8(%rax), %rdx # id
      movq 16(%rax), %rcx # name
      movl 32(%rax), %r8d # age
      call printf

      leave
      ret

   .globl showCar
   showCar:
      pushq %rbp
      movq %rsp, %rbp

      movq %rdi, %rax # salva o parâmetro

      movq $str3, %rdi # string
      movl 0(%rax), %esi # type
      movq 8(%rax), %rdx # id
      movq 16(%rax), %rcx # name
      movl 32(%rax), %r8d # color
      call printf

      leave
      ret