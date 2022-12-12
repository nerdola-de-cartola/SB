.data
	.globl letters
	.align 1
	letters: .string "abcdefghij"

    .globl even
    .align 4
	even: .int 0

	.globl odd
    .align 4
	odd: .int 0

.text


.globl ex02
ex02:

    pushq %rbp

    movq  %rsp, %rbp

   	# unsigned int count = 0;
	movl $0, %r8d
	
	while:
	movl %r8d, %r9d
	imulq $1, %r9
	addq $letters, %r9
	cmpb $0, (%r9)
	jz end_while

		movb (%r9), %r10b
		andb $1, %r10b
		incl %r8d
		cmpb $0, %r10b
		jz else

			incl odd

			jmp end_if
		else:

			incl even

		end_if:

		jmp while
	end_while:
	
    leave

    ret