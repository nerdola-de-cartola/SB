.data
   .globl max
   .align 2
   max: .word 0

   .globl vet
   .align 2
   vet: .word 50, 10, 67, 42

.text


.globl ex01
ex01:

    pushq %rbp

    movq  %rsp, %rbp

	# i = 0
	movb $0, %r8b

	# if(i >= 4) goto end_for
	for:
	cmpb $4, %r8b
	jge end_for

			
		# r9 = (long) i
		movsbq %r8b, %r9

		# r9 *= 2
		imulq $2, %r9	

		# r9 += &vet
		addq $vet, %r9

		# r10 = (long) max
		movswq max, %r10

		; # if(vet[i] <= max) goto end_if
		cmpq %r10, (%r9)
		jle end_if

			# max = vet[i]
			movq (%r9), %r10
			movw %r10w, max

		end_if:

	incb %r8b
	jmp for
	end_for:

    leave

    ret