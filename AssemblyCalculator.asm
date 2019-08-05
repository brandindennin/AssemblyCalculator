# Brandin Dennin assembly assignment!!!
	# Start .text segment (program code)
	.text
	
	.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4 (same as: addi $v0, $zero, 4)
	la	$a0, msg1	# load the address of msg
	syscall

	# Get input A from user and save
	li	$v0,5		# read_int syscall code = 5 (same as: addi $v0, $zero, 5)
	syscall	
	move	$t0,$v0		# syscall results returned in $v0: move $v0 to $t0 (A)

	# Print string msg2
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg2
	syscall

	# Get input B from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0: move $v0 to $t1 (B)

	# Print string msg3
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg3	# load the address of msg2
	syscall
	
	# Get operator sign from user and save
	li	$v0,12		# read_int syscall code = 5
	syscall	
	move	$t2,$v0		# syscall results returned in $v0: move $v0 to $t1 (B)
	
	# Print \n
	li	$v0,4		# print_string syscall code = 4
	la	$a0, newline
	syscall
	
	# If character is = to +,-,*,/,%, then do that op
	beq	$t2, '+', op1
	beq	$t2, '-', op2
	beq	$t2, '*', op3
	beq	$t2, '/', op4
	beq	$t2, '%', op5
	
	#else exit
	j badsymbol
	
	# Math!
	#add	$t0, $t0, $t1	# A = A + B

	# Print sum
	#li	$v0,1		# print_int syscall code = 1
	#move	$a0, $t0	# int to print must be loaded into $a0
	#syscall

	# Print \n
	#li	$v0,4		# print_string syscall code = 4
	#la	$a0, newline
	#syscall

	# Exit
	#li	$v0,10		# exit call
	#syscall
	
	#add the numbers
	op1:
	#---Print message for semantics for add
	li	$v0, 4
	la	$a0, msg4
	syscall
	
	# Print \n
	li	$v0,4		
	la	$a0, newline
	syscall

	# perform the addition and store result into $t3
	add	$t3, $t0, $t1
	
	#print A
	li	$v0, 1		
	move	$a0, $t0	
	syscall
	
	#print sign
	li	$v0, 11		
	move	$a0, $t2	
	syscall
	
	#print B
	li	$v0, 1		
	move	$a0, $t1	
	syscall
	
	#print =
	li	$v0, 4
	la	$a0, equals
	syscall
	
	#print sum
	li	$v0,1		
	move	$a0, $t3	
	syscall
	j exit

	#subtract the numbers
	op2:
	#---Print message for semantics for subtract
	li	$v0, 4
	la	$a0, msg5
	syscall
	
	# Print \n
	li	$v0,4		
	la	$a0, newline
	syscall

	# perform the subtraction and store result into $t3
	sub	$t3, $t0, $t1
	
	#print A
	li	$v0, 1		
	move	$a0, $t0	
	syscall
	
	#print sign
	li	$v0, 11		
	move	$a0, $t2	
	syscall
	
	#print B
	li	$v0, 1		
	move	$a0, $t1	
	syscall
	
	#print =
	li	$v0, 4
	la	$a0, equals
	syscall
	
	#print difference
	li	$v0,1		
	move	$a0, $t3	
	syscall
	j exit

	#multiply the numbers
	op3:
	#---Print message for semantics for multiply
	li	$v0, 4
	la	$a0, msg6
	syscall
	
	# Print \n
	li	$v0,4		
	la	$a0, newline
	syscall

	#multiply the numbers and store result into $t3
	mult	$t0, $t1
	mflo	$t3
	
	#print A
	li	$v0, 1		
	move	$a0, $t0	
	syscall
	
	#print sign
	li	$v0, 11		
	move	$a0, $t2	
	syscall
	
	#print B
	li	$v0, 1		
	move	$a0, $t1	
	syscall
	
	#print =
	li	$v0, 4
	la	$a0, equals
	syscall
	
	#print product
	li	$v0,1		
	move	$a0, $t3	
	syscall
	j exit

	#divide the numbers
	op4:
	beq	$t1, $zero, error
	#---Print message for semantics for div
	li	$v0, 4
	la	$a0, msg7
	syscall
	# Print \n
	li	$v0,4		
	la	$a0, newline
	syscall

	#divide the numbers and store result into $t3
	div	$t0, $t1
	mflo	$t3
	
	#print A
	li	$v0, 1		
	move	$a0, $t0	
	syscall
	
	#print sign
	li	$v0, 11		
	move	$a0, $t2	
	syscall
	
	#print B
	li	$v0, 1		
	move	$a0, $t1	
	syscall
	
	#print =
	li	$v0, 4
	la	$a0, equals
	syscall
	
	#print dividend
	li	$v0,1		
	move	$a0, $t3	
	syscall
	j exit

	
	#modulus the numbers
	op5:
	beq	$t1, $zero, error
	#---Print message for semantics for mod
	li	$v0, 4
	la	$a0, msg8
	syscall
	# Print \n
	li	$v0,4		
	la	$a0, newline
	syscall

	#mod the numbers and store result into $t3
	div	$t0, $t1
	mfhi	$t3
	
	#print A
	li	$v0, 1		
	move	$a0, $t0	
	syscall
	
	#print sign
	li	$v0, 11		
	move	$a0, $t2	
	syscall
	
	#print B
	li	$v0, 1		
	move	$a0, $t1	
	syscall
	
	#print =
	li	$v0, 4
	la	$a0, equals
	syscall
	
	#print modulus
	li	$v0,1		
	move	$a0, $t3	
	syscall
	j exit


	#exit the program
	error:
	# Print string msg3
	li	$v0,4		# print_string syscall code = 4
	la	$a0, errormsgdiv0	# load the address of msg2
	syscall
	j exit
	
	badsymbol:
	li	$v0,4		# print_string syscall code = 4
	la	$a0, errormsgbadsymbol	# load the address of msg2
	syscall
	j exit
	
	exit:
	li	$v0,10		# exit call
	syscall
	

	# Start .data segment (data!)
	.data
msg1:	.asciiz	"Enter the 1st integer: "
msg2:	.asciiz	"Enter the 2nd integer: "
msg3:	.asciiz	"Enter an operator: "
msg4:	.asciiz	"The semantics of the operator + is addition:"
msg5:	.asciiz	"The semantics of the operator - is subtraction:"
msg6:	.asciiz	"The semantics of the operator * is multiplication:"
msg7:	.asciiz	"The semantics of the operator / is division:"
msg8:	.asciiz	"The semantics of the operator % is modulus"
errormsgdiv0:	.asciiz "Division/Modulus by zero not allowed"
errormsgbadsymbol: .asciiz "Error - Invalid operator!!"
equals: .asciiz " = "
newline:   .asciiz	"\n"