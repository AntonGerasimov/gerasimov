#Программа получает на вход вещественное число типа long double. На выход подается его двоичное представление.
	.data
in:
	.string "%Le"	#Le means long double
int_print:
	.string "%d"
long_double:
	.space 10
out:
	.string "\n"
	.text
	.globl main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$long_double	#Scan
	pushl	$in
	call	scanf
	addl	$8,	%esp

	pushl %ebx
	movl 	$6, 	%eax
	addl 	$long_double,	%eax 	#first part of our number is in eax now
	movl 	(%eax), %ebx
	movl 	%ebx, 	%eax
	popl 	%ebx
	movl	$80,	%ecx 	#set counter to 80

shift:
	cmpl 	$48,	%ecx
	jne	go_next	#if ecx=48, go to second part
	movl 	$2,	%eax
	addl 	$long_double,	%eax
	movl	(%eax), %ebx
	movl	%ebx,	%eax #second part of our number is in eax now
	popl	%ebx
go_next:
	cmpl	$16,	%ecx	#if ecx = 16, go to third part
	jne 	go_next_again
	movl 	$long_double, 	%eax
	pushl	%ebx
	movl	(%eax), %ebx
	movl	%ebx,	%eax #third part of our number is in eax now
	popl	%ebx
go_next_again:
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
	addl	$4, 	%esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax	#return 0
	ret
