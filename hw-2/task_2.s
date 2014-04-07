	.data
a:
	.space 	32

b:
	.space 	32

in:
	.string	"%s"

out:
	.string	"%s\n"

str_in:
	.string "abc"
	.set str_in_length,	.-str_in


str_out:
	.space	str_in_length

	.text
	.globl	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

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
