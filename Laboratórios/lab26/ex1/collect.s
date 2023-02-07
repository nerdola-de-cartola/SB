.section .rodata
   .align 8
   float1: .float 0.0

   .align 1
   str1: .string "Fail: sum = %f, limit = %f, count = %d\n"

.text
.globl collect
collect:
   push %rbp
   movq %rsp, %rbp
   subq $64, %rsp

   # salva registradores callee
   movq %rbx, -40(%rbp)

   # sum = 0.0
   # sum é representado pelo registrador xmm1
   movss float1, %xmm1

   # i = 0
   # i é representado pelo registrador ebx
   movl $0, %ebx

   # salvar os parâmetros
   movq %rdi, -48(%rbp)
   movss %xmm0, -52(%rbp)
   movss %xmm1, -4(%rbp)
   movl %esi, -56(%rbp)

   # passa parâmetros
   leaq -32(%rbp), %rdi

   call t_init

   # recupera parâmetros
   movq -48(%rbp), %rdi
   movss -52(%rbp), %xmm0
   movss -4(%rbp), %xmm1
   movl -56(%rbp), %esi

   while:
      # i < count
      cmpl %esi, %ebx
      jge end_while

      # ptr[i]
      movslq %ebx, %rax
      imulq $8, %rax
      addq %rdi, %rax

      # ptr[i].sum < limit
      movss (%rax), %xmm2
      ucomiss %xmm0, %xmm2
      jae else

         leaq -32(%rbp), %rcx # rcx = &t
         cvtsi2ss -32(%rcx), %xmm2 # xmm2 = t.repeated
         mulss (%rax), %xmm2 # rcx = t.reapeted * ptr[i].sum

         # sum = sum + (t.repeated * ptr[i].sum)
         addss %xmm2, %xmm1

         jmp end_if
      else:

         # salvar os parâmetros
         movq %rdi, -48(%rbp)
         movss %xmm0, -52(%rbp)
         movss %xmm1, -4(%rbp)
         movl %esi, -56(%rbp)

         # passa parâmetros pro printf
         movq $str1, %rdi
         cvtss2sd (%rax), %xmm0
         cvtss2sd -52(%rbp), %xmm1
         movl -56(%rbp), %esi
         movl $2, %eax
         call printf

         # recupera parâmetros
         movq -48(%rbp), %rdi
         movss -52(%rbp), %xmm0
         movss -4(%rbp), %xmm1
         movl -56(%rbp), %esi
            
         # ptr[i]
         movslq %ebx, %rax
         imulq $8, %rax
         addq %rdi, %rax

         incl 4(%rax) # ptr[i].fail++

      end_if:

      incl %ebx # i++

      jmp while
   end_while:
   
   # recupera registradores callee
   movq -40(%rbp), %rbx

   movss %xmm1, %xmm0

   leave
   ret