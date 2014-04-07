#Программа получает на вход два целых положительных числа. На выход подается "1", если хотя бы одно из них нечетное, и "0" в обратном случае.
	.data
a:
	.space 4
b:
	.space 4
in:
	.string "%d %d"
out:
	.string "%d\n"
	.text
	.globl 	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$b
	pushl	$a
	pushl	$in
	call	scanf
	addl	$12,	%esp

	movl	a,	%eax
	movl	b,	%ebx

	orl	%ebx,	%eax

	shrl	$1,	%eax	
	movl	$0,	%ebx
	jnc 	print
	movl	$1,	%ebx
print:
	pushl	%ebx
	pushl	$out
	call	printf
	addl	$8,	%esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax
	ret
