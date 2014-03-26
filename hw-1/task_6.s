#Программа получает на вход вещественное число типа double  в формате х.у . На выход подается его двоичное представление.
	.data
in:
	.string "%lf"	#lf means double
int_print:
	.string "%d"
double:
	.space 8
out:
	.string "\n"
	.text
	.globl main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$double	#Scan
	pushl	$in
	call	scanf
	addl	$8,	%esp


	pushl %ebx
	movl 	$4, %eax
	addl 	$double,%eax #first part of our number is in eax now
	movl (%eax), %ebx
	movl %ebx, %eax
	popl %ebx
	movl	$64,	%ecx 	#set counter to 64

shift:
	cmpl 	$32,	%ecx
	jne	go_next
	movl 	$double, %eax
	pushl	%ebx
	movl	(%eax), %ebx
	movl	%ebx,	%eax #second part of our number is in eax now
	popl	%ebx
go_next:
	shll	$1,	%eax
	movl	$0,	%ebx
	jnc	print	#проверяем carry flag
	movl	$1,	%ebx
print:
	pushl	%edx	#сохраняем значения edx, ecx, eax перед печатью, кладя их на стек
	pushl	%ecx
	pushl	%eax
	
	pushl	%ebx	#печать очередной цифры числа
	pushl	$int_print
	call	printf
	addl	$8,	%esp

	popl	%eax	#забираем значения edx, ecx, eax со стека
	popl	%ecx
	popl	%edx

	loop	shift

	pushl	$out
	call	printf
	addl	$4, %esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax	#return 0
ret
