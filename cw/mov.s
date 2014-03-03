	.file	"mov.c"
	.section	.rodata
.LC0:
	.string	"Initial Y = %d\n"
.LC1:
	.string	"Changed Y = %d\n"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	movl	$0, 28(%esp)
	movl	$1, 24(%esp)
	movl	24(%esp), %edx
	movl	$.LC0, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	28(%esp), %edx
#APP
# 6 "mov.c" 1
	movl %edx, 24(%esp)
# 0 "" 2
#NO_APP
	movl	24(%esp), %edx
	movl	$.LC1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	printf
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-3)"
	.section	.note.GNU-stack,"",@progbits
