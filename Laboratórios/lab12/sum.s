.data
   .globl s
   .align 4
   s: .int 0

   .globl nums
   .align 4
   nums: .int 65, -105, 111, 34

.text


.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp

	movl $0, %r8d

    # while (i < 4) {
	while:
	cmpl $4, %r8d
	jge end_while

		# r9 = &nums
		movq $nums, %r9

		# (long) (i * sizeof(int))
		movl %r8d, %r10d
		imull $4, %r10d
		movslq %r10d, %r10

		# nums[i]
		addq %r10, %r9

		# s += nums[i]
		movl (%r9), %r9d
		addl %r9d, s

		# i++
		incl %r8d
	
	jmp while
	end_while:
	# }

    leave

    ret