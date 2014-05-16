#Программа принимает на вход одномерный массив из трех целых чисел.
#Затем одномерный массив из трех вещественных чисел в формате double
#На выход подается сначала сумма элементов первого, затем - второго.
	.data
sum_d:
	.space 4
sum_f:
	.space 8
count:
	.space 4
	.text
	.globl	sum1
sum1:	
	pushl 	%ebp	#Prolog
	movl 	%esp, 	%ebp

	movl	$0, 	%eax	#Sum = 0

	movl 	8(%ebp),%ebx	#now address of the beginning of array in ebx
	movl 	$3, 	%ecx	

sum:
	movl 	(%ebx), %edx	#mov a[i] to edx
	addl 	%edx, 	%eax	#Sum = Sum + a[i]
	addl 	$4, 	%ebx	#4 because 4 bytes per number
	loop 	sum


	movl %ebp, %esp	#Epilog
	popl %ebp
	ret


	.globl	sum2
sum2:
	pushl 	%ebp	#Prolog
	movl 	%esp, 	%ebp

	subl 	$8, 	%esp
	movl	$0,	%eax	#Sum = 0	
	movl 	%eax, 	-4(%ebp)
	movl 	$3, 	%ecx	#i=3
	movl 	8(%ebp), 	%ebx	#move address of the beginning to ebx

summ:
	movl 	%ebx, %eax
	flds 	(%eax)
	flds 	-4(%ebp)
	faddp
	fstps 	-4(%ebp)
	addl 	$4, %ebx
	loop 	summ

	flds 	-4(%ebp)
	movl 	-4(%ebp), 	%eax

	movl 	%ebp,	%esp	#Epilog
	popl %ebp
	ret
