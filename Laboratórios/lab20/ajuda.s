.data

.text
.globl  calc
calc:
    pushq   %rbp
    movq    %rsp,   %rbp
    subq    $64,    %rsp

    movq    %r12,   -8(%rbp)
    movq    %r13,   -16(%rbp)

    // int i = 0;       // Deve ser registrador
    // int j = 4;       // Deve ser registrador
    // Usaremos %r12d e %r13d
    movl    $0,     %r12d   // i
    movl    $4,     %r13d   // j

    // int sum; -> Usaremos -20(%rbp)
    // int vet1[5]; -> Usaremos -40(%rbp)
    // short vet2[5]; -> Usaremos -50(%rbp)

    // filli(vet1, 5, i);
    leaq    -40(%rbp),  %rdi
    movl    $5,         %esi
    movl    %r12d,      %edx
    call    filli

    // fills(vet2, 5, j);
    leaq    -50(%rbp),  %rdi
    movl    $5,         %esi
    movl    %r13d,      %edx
    call    fills
    
    // sum = 0;
    movl    $0,     -20(%rbp)

loop:
    // for ( ; i < 5; i++, j--)
    cmpl    $5,     %r12d
    jge     end_loop
    
    //    sum += vet1[i] + vet2[j];
    leaq    -40(%rbp),  %r8
    movslq  %r12d,      %r9
    imulq   $4,         %r9
    addq    %r9,        %r8
    movl    (%r8),      %r9d
    addl    %r9d,        -20(%rbp)
    // sum += vet1[i]

    
    leaq    -50(%rbp),  %r8
    movslq  %r13d,      %r9
    imulq   $2,         %r9
    addq    %r9,        %r8
    movswl  (%r8),      %r9d
    addl    %r9d,       -20(%rbp)
    // sum += vet2[j]

    // end for
    incl    %r12d           // i++
    subl    $1,     %r13d   // j--
    jmp     loop

end_loop:
    movl    -20(%rbp),  %eax

    movq    -8(%rbp),    %r12
    movq    -16(%rbp),   %r13

    leave
    ret
