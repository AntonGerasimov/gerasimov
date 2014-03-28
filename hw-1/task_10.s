#Программа принимает на вход 3 числа. Первое - целое. Второе - код символа. Третье - вещественное.
#На выход подается 3 строчки. В первой записано целое. Во второй - вещественное. В третьей - символ. 
	.data
in_int:
	.string "%d"
in_char:
	.string "%d" #Вводится код символа
in_float:
	.string "%f"
out_int:
	.string "%d\n"
out_char:
	.string "%c\n"
out_float:
	.string "%f\n"
	.comm	a,4,4
	.comm	c,1,1
	.comm	b,4,4
	.text
	.globl	main

main:
	pushl	%ebp #Prolog
	movl	%esp, %ebp

	pushl	$a #Scan int
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	pushl	$c #Scan char
	pushl	$in_char
	call	scanf
	addl	$8,	%esp

	pushl	$b #Scan float
	pushl	$in_float
	call	scanf
	addl	$8,	%esp

	movl	a,	%eax #print int
	pushl	%eax
	pushl	$out_int
	call  	printf
	addl	$8,	%esp

	andl	$-4,	%esp #print float
	subl	$4,	%esp
	flds	b
	fstpl	(%esp)
	pushl	$out_float
	call 	printf
	addl	$8,	%esp

	movl	c,	%eax #print char
	pushl	%eax
	pushl	$out_char
	call 	printf
	addl	$8,	%esp

	movl 	%ebp,	%esp #Epilog
	popl 	%ebp
	movl	$0, 	%eax #return 0
	ret
