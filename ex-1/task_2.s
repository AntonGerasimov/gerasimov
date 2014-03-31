	.data
in:
	.string "%u %u"
out:
	.string "%d + "
out_1:
	.string "%d\n"
a:
	.space 4
b:
	.space 4
c:
	.long 2147483647
count:
	.space 4
	.text
	.globl main
main:
	pushl	%ebp
	movl	%esp,	%ebp

	pushl	$b
	pushl	$a
	pushl	$in
	call	scanf
	addl	$8,	%esp

	movl	$0,	%eax
	movl	%eax,	count
	movl	a,	%eax
	movl	b,	%ebx

	addl	%ebx,	%eax	
	cmpl	$0,	%eax
	jl	over
	jmp 	print
over:
	movl	a,	%eax
	movl	b,	%ebx
over_1:
	pushl	%eax
	pushl	%ebx

	pushl	c
	pushl	$out
	call	printf
	addl	$8,	%esp	

	popl	%eax
	popl	%ebx

	movl	c,	%ecx
razn:
	cmpl 	$1,	%eax
	jl	razn_b
	jmp	razn_a
razn_a:
	addl	$-1,	%eax
	jmp 	next
razn_b:
	addl	$-1,	%ebx
	jmp 	next
next:
	loop	razn
	pushl	%eax

	addl	%ebx,	%eax

	cmpl	$0,	%eax
	jl	over_2

	popl	%ebx
	jmp	print

over_2:
	popl	%eax
	jmp 	over_1	

	

print:
	pushl	%eax
	pushl	$out_1
	call	printf
	addl	$8,	%esp

finish:
	movl	%ebp,	%esp
	popl 	%ebp
	movl	$0,	%eax
	ret
