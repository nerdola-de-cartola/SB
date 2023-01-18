.section .rodata
fmt: .string "sum = %ld\n"
.text
#  node_t: alinhamento 8x, tamanho 56
#
#  0      4      8      16     24     32     40     48     52     56
#  +------+------+------+------+------+------+------+------+------+
#  | size |??????| v[0] | v[1] | v[2] | v[3] | v[4] | used |??????|
#  +------+------+------+------+------+------+------+------+------+
#
.globl sum
sum:
   pushq %rbp
   movq %rsp, %rbp

   # i -> r12d
   # j -> r13d
   # h -> r14

   # Pilha
   # r12 ->  -8
   # r13 -> -16
   # r14 -> -24
   # rdi -> -32
   # rsi -> -40
   subq $48, %rsp

   movq %r12,  -8(%rbp) # callee saved
   movq %r13, -16(%rbp)
   movq %r14, -24(%rbp)

   # void *h = new_sum()
   movq %rdi, -32(%rbp) # salva node
   movq %rsi, -40(%rbp) # salva size
   call new_sum
   movq %rax, %r14 # h = new_sum()

   movq -32(%rbp), %rdi # recupera node
   movq -40(%rbp), %rsi # recupera size

   movl $0, %r12d # i = 0
   begin_for01:
      cmpl %esi, %r12d # if (i >= size) -> end_for
      jge end_for01
      movl $0, %r13d # j = 0

      begin_for02:
         movslq %r12d, %r8 # r8 = (long)i
         imulq $56, %r8 # r8 = r8 * sizeof(node_t)
         addq %rdi, %r8 # r8 = &node[i]
         cmpl 48(%r8), %r13d # if (j >= node[i].used) -> end_for02
         jge end_for02

         leaq 8(%r8), %r9 # r9 = &node[i].values
         movslq %r13d, %r10 # r10 = (long)j
         imulq $8, %r10 # r10 = r10 * sizeof(long)
         addq %r9, %r10 # r10 = &node[i].values[j]

         movq %rdi, -32(%rbp) # salva node
         movq %rsi, -40(%rbp) # salva size

         movq %r14, %rdi # 1o. param
         movq (%r10), %rsi # 2o. param
         call add_sum

         movq -32(%rbp), %rdi
         movq -40(%rbp), %rsi

         incl %r13d # j++
         jmp begin_for02
      end_for02:
      
      incl %r12d # i++
      jmp begin_for01

   end_for01:

   movq %r14, %rdi
   call get_sum # returno já em %rax

   movq  -8(%rbp), %r12
   movq -16(%rbp), %r13
   movq -24(%rbp), %r14
   
   leave
   ret

.globl main
main:
   pushq %rbp
   movq %rsp, %rbp
   # Pilha
   # nodes[1] ->  -56(%rbp)
   # nodes[0] -> -112(%rbp)
   subq $112, %rsp
   leaq -112(%rbp), %rdi # 1o. param
   call init
   leaq -112(%rbp), %rdi # 1o. param
   movl $2, %esi # 2o. param
   call sum
   movq $fmt, %rdi # 1o. param
   movq %rax, %rsi # 2o. param
   movl $0, %eax
   call printf
   movl $0, %eax
   leave
   ret
