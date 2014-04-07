	.data
a:
	.space 	32

b:
	.space 	32

in:
	.string	"%s"

out:
	.string	"%s\n"
	.set str_in_length,	3
str_in:
	.space str_in_length
str_in_2:
	.space str_in_length


str_out:
	.space	str_in_length

	.text
	.globl	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$str_in
	pushl	$in
	call	scanf
	addl	$8,	%esp

	pushl	$str_in_2
	pushl	$in
	call	scanf
	addl	$8,	%esp	

	movl	$str_in,	%esi
	movl	$str_out,	%edi

	movl	$str_in_length -1,	%ecx
1:
	lodsb
	stosb
	loop	1b

	movsb
	
	pushl	$str_out
	pushl	$out
	call	printf
	addl	$8,	%esp
	

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax
	ret
