#Программа получает на вход целое число в двоичной записи. На выход подается его запись в шестнадцатеричной системе счисления.
#Максимальное число - 1111111111
	.data
int_label:
	.space 4
input:
	.string "%d"
count_count:
	.space 4
int:
	.space 4
x:
	.string "%x\n"
	.text
	.globl main

main:
	pushl %ebp	#Prolog
	movl %esp, %ebp

	pushl	$int_label 	#Scan
	pushl	$input
	call	scanf
	addl $8, %esp

	movl $0, %eax
	movl %eax, int #Put int to zero. int - десятичная запись числа. Обнулим ее перед переводом.  
	
	movl	int_label, %eax	#Put our number to eax
	movl $32, %ecx #Set loop counter to 32
perevod_2_10:
	movl	$32,	%ebx
	subl	%ecx,	%ebx #ebx = 32 - ecx. ebx показывает n - степень двойки цифры, с которой мы работаем
	movl	%ebx,	count_count
	movl	$10,	%ebx #отбрасываем от числа последнюю цифру, она записывается в edx, целая часть  от деления идет в eax
	idiv	%ebx
	pushl	%eax
	cmpl	$1,	%edx
	je umn #Если остаток единица, то к десятичной записи числа нужно прибавить 2^n
	movl $0, %eax 
	movl	$0,	%edx
	pushl %ecx
	jmp next
umn:
	movl	$0,	%edx
	movl $1, %eax
	pushl %ecx

	movl count_count, %ecx
	cmpl $0, %ecx
	jne umn_2
	jmp next
umn_2: #*2^n
	pushl %ecx
	movl $2, %ebx
	imul %ebx
	movl $0, %edx
	popl %ecx
	loop umn_2
next:
	movl int, %ebx #int = int + 2^n
	addl %eax, %ebx
	movl %ebx, int
	
	popl %ecx
	popl %eax
	loop perevod_2_10

	movl int, %eax #Print
	pushl %eax
	pushl $x
	call printf
	addl $8, %esp

	movl %ebp, %esp		#Epilog
	popl %ebp
	ret
