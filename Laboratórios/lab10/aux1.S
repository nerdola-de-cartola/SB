.data
   # char str[] = "BEBAMUITOCAFE" 
   .globl str
   str: .string "ASSEMBLYEMUITODIVERTIDO"



.text

.globl process

process:

   pushq %rbp

   movq  %rsp, %rbp


   # ptr = str
   movq $str, %r8


beginwhile:

   cmpb $0, (%r8)

   je endwhile            # while() {

   # *ptr += 32
   addb $32, (%r8)

   # ptr++
   incq %r8


   jmp beginwhile         # }

endwhile:


   leave

   ret