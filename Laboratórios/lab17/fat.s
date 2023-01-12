.text
.globl fat
fat:
   pushq %rbp
   movq %rsp, %rbp
   subq $16, %rsp

   movl %edi, -4(%rbp)

   cmp $0, %edi
   jle end_if
      decl %edi
      call fat
      imull -4(%rbp), %eax
      leave
      ret
      
   end_if:

   movl $1, %eax

   leave
   ret 