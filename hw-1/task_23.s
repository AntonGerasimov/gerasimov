	.data
float:
	.space 4
int:
	.space 4
char:
	.space 4
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
	.text
	.globl	main
main:
	pushl	%ebp #Prolog
	movl	%esp, 	%ebp

	pushl	$int #scan int
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	pushl	$char #scan char
	pushl	$in_char
	call	scanf
	addl	$8,	%esp

	pushl	$float #scan float
	pushl	$in_float
	call	scanf
	addl	$8,	%esp

	movl	char,	%eax #push char, float and int to stack
	pushl	%eax
	movl 	float, 	%eax
	pushl	%eax
	movl	int,	%eax
	pushl	%eax
	
	movl	int,	%eax #print int
	pushl	%eax
	pushl	$out_int
	call  	printf
	addl	$8,	%esp

	andl	$-4,	%esp #print float
	subl	$4,	%esp
	flds	float
	fstpl	(%esp)
	pushl	$out_float
	call 	printf
	addl	$8,	%esp

	movl	char,	%eax #print char
	pushl	%eax
	pushl	$out_char
	call 	printf
	addl	$8,	%esp


	movl	%ebp,	%esp #Epilog
	popl	%ebp

	movl	$0,	%eax #return 0

	ret









