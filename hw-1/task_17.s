#На вход подается два целых числа. Второе из них положительное. Программа возводит первое число в степень второго.
	.data
out_string:
	.string "%d\n"
in_string:
	.string "%d %d"
int_space_a:
	.space 4
counter:
	.space 4
	.text
	.globl main
main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp

	pushl 	$counter 	#Scan
	pushl 	$int_space_a
	pushl 	$in_string
	call 	scanf

	movl 	int_space_a, 	%eax
	movl 	%eax, 	4(%esp)
	movl 	$1, 	8(%esp) #for (i=1;
	
umn:	#Умножение на первоначальное число
	movl 	4(%esp),%ebx
	imull 	%ebx
	addl 	$1, 	8(%esp) 	#i++
proverka:
	movl 	8(%esp),%ebx
	cmpl 	%ebx, 	counter 	#i<n
	jne 	umn

	pushl 	%eax
	pushl	$out_string
	call 	printf
	addl 	$16, 	%esp	
	jmp 	next

next: 	#Continue program	
	movl 	%ebp, 	%esp	#Epilog
	popl 	%ebp
	
	movl 	$0, 	%eax #return 0
	ret
