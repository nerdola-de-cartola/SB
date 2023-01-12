.text
   .globl calc
   calc:
      pushq %rbp
      movq %rsp, %rbp
      subq $64 , %rsp

      movq %r12, -40(%rbp) # salva o registrador r12
      movq %r13, -48(%rbp) # salva o registrar r13

      movl $0, %r12d # usa r12 como i
      movl $4, %r13d # usa r13 como j

      leaq -20(%rbp), %rdi # passa o vet1 como primeiro parâmetro
      movl $5, %esi # passa 5 como segundo parâmetro
      movl %r12d, %edx # passa i como terceiro parâmetro 
      call filli

      leaq -30(%rbp), %rdi # passa o vet2 como primeiro parâmetro
      movl $5, %esi # passa 5 como segundo parâmetro
      movl %r13d, %edx # passa j como terceiro parâmetro 
      call fills

      movl $0, -52(%rbp) # sum = 0
      movl -52(%rbp), %eax # usa eax como sum

      for:
         # while(i < 5)
         cmp $5, %r12d
         jge end_for

         leaq -20(%rbp), %rdx # salva o endereço do vet1 no rdx

         # salva o endereço de vet1[i] em rcx
         movslq %r12d, %rcx
         imulq $4, %rcx
         addq %rdx, %rcx

         # sum += vet1[i]
         addl (%rcx), %eax

         leaq -30(%rbp), %rdx # salva o endereço de vet2 no rdx

         # salva o endereço de vet2[j] em rcx
         movslq %r13d, %rcx
         imulq $2, %rcx
         addq %rdx, %rcx

         # sum += vet2[j]
         movswl (%rcx), %edx
         addl %edx, %eax

         incl %r12d # i++
         decl %r13d # j--

         jmp for
      end_for:


      movq -40(%rbp), %r12 # recupera o registrador r12
      movq -48(%rbp), %r13 # recupera o registrador r13

      movl %eax, -52(%rbp) # salva a variável sum na pilha

      leave
      ret