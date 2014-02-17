	.data
msg_string:
	.string "Call 1\n"
msg_string_2:
	.string "Call 2\n"
	.text
	.globl main
my_printf:
	pushl %ebp
        movl %esp, %ebp
			
	pushl $msg_string_2
	pushl $msg_string
	
	call printf
	
	addl $4, %esp

	call printf

	addl $4, %esp	

	movl %ebp, %esp
        popl %ebp

        ret

main:
	pushl %ebp
        movl %esp, %ebp

	call my_printf
	
        movl %ebp, %esp
        popl %ebp

	ret
