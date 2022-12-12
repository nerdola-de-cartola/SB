.data
   .globl last
   .align 8
   last: .quad 0

   .globl values
   .align 8
   values: .quad 50, -10, 60, -20, 70

.text


.globl swap

swap:

    pushq %rbp

    movq  %rsp, %rbp


	# i = 0
    movl $0, %r8d

	# j = 4
    movl $4, %r9d

	for:
	# if(i >= j) goto end_for
    cmpl %r9d, %r8d
    jge end_for

		# (long) i * sizeof(long)
		movl %r8d, %r10d
		movslq %r10d, %r10
		imulq $8, %r10
		addq $values, %r10

		# (long) j * sizeof(long)
		movl %r9d, %r11d
		movslq %r11d, %r11
		imulq $8, %r11
		addq $values, %r11

		# tmp = values[i]
		movq (%r10), %rax

		# values[i] = values[j]
		movq (%r11), %rcx
		movq %rcx, (%r10)

		# values[j] = tmp
		movq %rax, (%r11)

		# i++
		incl %r8d

		# j++
		decl %r9d
		
	jmp for
    end_for:

	movq $4, %r8
	imulq $8, %r8
	addq $values, %r8

	movq (%r8), %r9
	movq %r9, last

    leave

    ret