.text
.globl process
process:
    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp
    movl %edi, -4(%rbp) # a
    movl %esi, -8(%rbp) # b
    movl %edx, -12(%rbp) # c
    movl %ecx, -16(%rbp) # d
    movl %r8d, -20(%rbp) # e
    movl %r9d, -24(%rbp) # f

    movl -24(%rbp), %edi # i
    movl -20(%rbp), %esi # j
    movl -16(%rbp), %edx # k
    movl -12(%rbp), %ecx # l
    movl -8(%rbp), %r8d # m
    movl -4(%rbp), %r9d # n
    call calc # eax = r

    movl -4(%rbp), %r8d
    addl %r8d, %eax

    movl -8(%rbp), %r8d
    addl %r8d, %eax

    movl -12(%rbp), %r8d
    addl %r8d, %eax

    movl -16(%rbp), %r8d
    addl %r8d, %eax

    movl -20(%rbp), %r8d
    addl %r8d, %eax

    movl -24(%rbp), %r8d
    addl %r8d, %eax

    leave
    ret
