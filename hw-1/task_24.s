#Программа принимает на вход одномерный массив из трех целых чисел.
#На выход подается их сумма.
	.data
	.globl a
a:
	.space 12
in:
	.string	"%d"
out:
	.string "%d\n"
summ:
	.space 4
count:
	.space 4
	.text
	.globl	main
main:
	pushl	%ebp 	#Prolog
	movl	%esp, 	%ebp

	movl 	$0,	%eax 	#Обнуляем счетчик i
	movl 	%eax, 	count

	jmp	next_1
read:
	movl	count, 	%eax
	sall	$2, 	%eax
	addl	$a, 	%eax
	pushl	%eax
	pushl	$in
	call	scanf
	addl 	$8, 	%esp
	movl 	count, 	%eax
	addl	$1, 	%eax
	movl 	%eax, 	count
next_1:
	movl 	count, 	%eax
	cmpl	$2, 	%eax 	#for (i=0, i<=2;i++)
	jle	read

	movl 	a, 	%eax 	#summ = a[0]
	movl 	%eax, 	summ

	movl 	$1, 	%eax 	#i=1
	movl 	%eax, 	count
	jmp 	next_2
summa:
	movl 	count, 	%eax 	#for (i=1;i<=2;i++)
	sall 	$2, 	%eax
	addl 	$a, 	%eax 
	
	movl 	(%eax), %edx
	movl 	summ, 	%eax 	#summ = summ + a[i]
	addl 	%edx, 	%eax
	
	movl 	%eax, 	summ

	movl 	count, 	%eax
	addl 	$1, 	%eax
	movl 	%eax, 	count
next_2:
	movl 	count, 	%eax 	#Проверка
	cmpl 	$2, 	%eax
	jle 	summa
		
	movl 	summ, 	%eax 	#Print
	pushl 	%eax
	pushl 	$out
	call 	printf
	addl 	$8, 	%esp

	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp

	movl 	$0, 	%eax 	#return 0
	ret

