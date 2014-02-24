	.data
string_label:
	.string "Hello"
	.text
	.globl main
format_string:
        .string "%s %d\n"
        .text
        .globl  main
main: 
	pushl %ebp
	movl %esp, %ebp

	pushl $321
	pushl $string_label
	pushl $format_string
	call printf
	addl $8, %esp

	movl %ebp, %esp
	popl %ebp
	ret
