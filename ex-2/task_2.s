	.data
x:
	.space 8
y:
	.space 8
str_in:
	.string "%lf %lf"
str_out:
	.string "%.10lf \n"
	.text
	.global main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$y	#Scan
	pushl	$x
	pushl	$str_in
	call 	scanf
	addl	$12,	%esp
	
	finit	#init

	 fld1

	 fldl	y
	 fldl	x
	 fsubp	#x-y
	 fyl2x	#log2(x-y)	
	fldl2t
	fld1
	fldl	y
	fldl	x
	faddp	#(x+y)
	fyl2x	
	 fdivp
	 faddp	#last sum

	sub	$8,	%esp
	fstpl	(%esp)	#save
	popl	%eax

	pushl	%eax	
	pushl	$str_out
	call printf
	addl	$8,	%esp

	movl	$0,	%eax	#return 0
	movl	%ebp,	%esp	#Epilog
	popl	%ebp
	ret
