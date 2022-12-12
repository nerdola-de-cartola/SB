.data
   .globl c
   c: .byte -20

   .globl i
   .align 4
   i: .int -256

   .globl j
   .align 4
   j: .int 512

   .globl l
   .align 8
   l: .quad 128

   .globl us
   .align 2
   us: .short 111

   .globl ui
   .align 4
   ui: .int 1024

   .globl ul
   .align 8
   ul: .quad 2048


.text


.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp


    # Se necessário, usar apenas os registradores (ou suas variações) abaixo:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11


    # Seu código aqui...
	movl $68000, j

	movq $4096, l

	movl j, %eax

    movl %eax, i

    movl $10, %eax
    addl i, %eax
    subl $5, %eax
    movl %eax, j

    movl i, %eax
    imull $2, %eax
    movl j, %ebx
    addl $5, %ebx
    subl %ebx, %eax
    movl %eax, i

    movl i, %eax
    movl %eax, ui

    movsbl c, %eax
    movl %eax, j

    movl ui, %eax
    movq %rax, ul

    movq ul, %rax
    movw %ax, us

    movl i, %eax
    addl j, %eax
    movb %al , c

    movq $l, %rax

    movq $128, (%rax)

    movq $i, %rax

    movl (%rax), %eax
    addl %eax, j

    leave

    ret