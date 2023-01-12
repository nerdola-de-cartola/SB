.section .rodata
   .align 1
   str1: .string "Soma: %ld\n"

.text
   .globl main
   main:
      # aloca a pilha
      pushq %rbp
      movq %rsp, %rbp
      subq $32, %rsp

      movq %rbx, -24(%rbp) # salva o registrador rbx

      call constante # constante()
      movsbw %al, %bx # casting da variável s

      movw %bx, %di # passa s como primeiro parâmetro
      leaq -8(%rbp), %rsi # passa o endereço de l como segundo parâmetro
      leaq -12(%rbp), %rdx # passa o endereço de i como terceiro parâmetro
      call init # init()

      movq $str1, %rdi # passa a string de formato como primeiro parâmetro

      movq -8(%rbp), %rsi # soma l

      # soma i
      movslq -12(%rbp), %rax
      addq %rax, %rsi

      # soma s
      movswq %bx, %rax
      addq %rax, %rsi

      movl $0, %eax # zera o eax

      call printf # printf()

      movq -24(%rbp), %rbx # recupera o registrador rbx

      movl $0, %eax # return 0

      leave
      ret