#Программа принимает на вход целое число. На выход подается "Zero", если число оказалось нулем, "Diablo" - 666, "Right number" - 23, 
#"2^10" - 1024.
#Во всех остальных случаях выводится "Not right number"
	.data
yes_string:
	.string "Right number\n"
no_string:
	.string "Not right number\n"
in_string:
	.string "%d"
int_space_a:
	.space 4
zero_string:
	.string "Zero\n"
diablo_string:
	.string "Diablo\n"
power:
	.string "2^10\n"
	.text
	.globl main
main:
	pushl %ebp #Prolog
	movl %esp, %ebp

	pushl $int_space_a #Scan
	pushl $in_string
	call scanf
	addl $8, %esp

	pushl %eax

	movl int_space_a, %eax
	
	cmpl $23, %eax
	je right

	cmpl $0, %eax
	je zero

	cmpl $666, %eax
	je diablo

	cmpl $1024, %eax
	je power_string

	pushl $no_string
	call printf
	addl $4, %esp
	
	jmp next
right:
	pushl $yes_string
	call printf
	addl $4, %esp

	jmp next
zero:
	pushl $zero_string
	call printf
	addl $4, %esp	
	jmp next

diablo:
	pushl $diablo_string
	call printf
	addl $4, %esp
	jmp next

power_string:
	pushl $power
	call printf
	addl $4, %esp
	jmp next

next: #Continue program	
	popl %eax

	movl %ebp, %esp #Epilog
	popl %ebp
	
	movl $0, %eax #return 0
	ret

