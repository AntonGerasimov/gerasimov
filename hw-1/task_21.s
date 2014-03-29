#Программа принимает на вход массив 2х3. На выход подается минимальное число из массива. Если таких чисел несколько, то подается любое из них.
	.data
	.globl a
a:
	.space 24
in:
	.string	"%d"
out:
	.string	"%d\n"
count_i: #Счетчик i для цикла for
	.space 4
count_j: #Счетчик j для цикла for
	.space 4
min:
	.space 4

	.text
	.globl	main

main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp
	
	movl 	$0, 	%eax
	movl 	%eax, 	count_i
	jmp 	proverka_1

zero_j_1: 	#Обнуляет счетчик j
	movl 	$0, 	%eax
	movl 	%eax, 	count_j
	jmp 	proverka_2

read: 	#Чтение числа
	movl 	count_i, 	%edx
	movl 	%edx, 	%eax
	addl 	%eax, 	%eax
	addl 	%edx, 	%eax
	movl 	count_j, 	%edx
	addl 	%edx, 	%eax
	sall 	$2, 	%eax
	addl 	$a, 	%eax
	pushl 	%eax
	pushl 	$in
	call 	scanf
	addl 	$8, 	%esp
	movl 	count_j, 	%eax
	addl 	$1, 	%eax
	movl 	%eax, 	count_j

proverka_2: 
	movl 	count_j, 	%eax
	cmpl 	$2, 	%eax
	jle 	read
	movl 	count_i, 	%eax
	addl 	$1, 	%eax
	movl 	%eax, 	count_i

proverka_1:
	movl 	count_i,	%eax
	cmpl 	$1, 	%eax
	jle 	zero_j_1
	movl 	a, 	%eax
	movl 	%eax, 	min
	movl 	$0, 	%eax
	movl 	%eax, 	count_i
	jmp	proverka_4

zero_j_2: 	#Обнуляем j
	movl 	$0, 	%eax
	movl 	%eax, 	count_j
	jmp 	proverka_3

minimum:
	movl 	count_i,	%edx
	movl 	%edx, 	%eax
	addl 	%eax, 	%eax
	addl 	%edx, 	%eax
	movl 	count_j,%edx
	addl 	%edx, 	%eax
	movl 	a(,%eax,4), 	%eax
	movl 	min, 	%ebx
	cmpl 	%ebx, 	%eax
	jge 	j_plus_plus
	movl 	count_i, 	%edx
	movl 	%edx, 	%eax
	addl 	%eax, 	%eax
	addl 	%edx, 	%eax
	movl 	count_j, 	%edx
	addl	%edx, 	%eax
	movl 	a(,%eax,4), 	%eax
	movl 	%eax, 	min

j_plus_plus: 	#j++
	movl 	count_j, 	%eax
	addl 	$1, 	%eax
	movl 	%eax, 	count_j

proverka_3:
	movl 	count_j, 	%eax
	cmpl 	$2, 	%eax
	jle 	minimum
	movl 	count_i, 	%eax
	addl 	$1, 	%eax
	movl 	%eax, 	count_i

proverka_4:
	movl 	count_i,%eax
	cmpl 	$1, 	%eax
	jle 	zero_j_2

	movl 	min, 	%eax 	#Print
	pushl 	%eax
	pushl 	$out
	call 	printf
	addl 	$8, 	%esp
	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp
	movl 	$0, 	%eax 	#return 0	
	ret
