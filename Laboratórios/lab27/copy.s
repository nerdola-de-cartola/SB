.text
.globl myopen
myopen:
    pushq %rbp
    movq %rsp, %rbp
    # subq $16, %rsp

    # salva handler_t
    movq %rdi, %r8

    movq %rsi, %rdi
    movl %edx, %esi
    movq $2, %rax
    syscall

    movl %eax, 0(%r8)

    leave
    ret

.globl myread
myread:
    pushq %rbp
    movq %rsp, %rbp
    # subq $16, %rsp

    movq %rdi, %r8

    movl 0(%r8), %edi
    movq 16(%r8), %rsi
    movq 8(%r8), %rdx
    movq $0, %rax
    syscall

    leave
    ret

.globl mywrite
mywrite:
    pushq %rbp
    movq %rsp, %rbp
    # subq $16, %rsp

    movq %rdi, %r8

    movl (%r8), %edi
    movq %rsi, %rdx
    movq 16(%r8), %rsi
    movq $1, %rax
    syscall

    leave
    ret

.globl myclose
myclose:
    pushq %rbp
    movq %rsp, %rbp

    movl (%rdi), %edi
    movq $3, %rax
    syscall

    leave
    ret