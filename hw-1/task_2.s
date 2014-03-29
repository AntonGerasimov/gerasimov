#Программа принимает на вход отрицательное десятичное число. На выход подается его двоичная запись в дополнительном коде.
	.data
in:
	.string "%d"
int:
	.space 4
out:
	.string "\n"
	.text
	.globl main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$int	#Scan
	pushl	$in
	call	scanf
	addl	$8,	%esp

	movl	int,	%eax	#our number is in eax now
	movl	$32,	%ecx 	#set counter to 32
	movl	$0,	%edx 	#edx становится равно 1, когда в числе появляется первая единица. Так отбрасываются незначащие нули.

shift:
	shll	$1,	%eax
	movl	$0,	%ebx
	jnc	print	#проверяем carry flag
	movl	$1,	%ebx
	movl	$1,	%edx 
print:
	cmpl	$1,	%edx
	jne	finish

	pushl	%edx	#сохраняем значения edx, ecx, eax перед печатью, кладя их на стек
	pushl	%ecx
	pushl	%eax
	
	pushl	%ebx	#печать очередной цифры числа
	pushl	$in
	call	printf
	addl	$8,	%esp

	popl	%eax	#забираем значения edx, ecx, eax со стека
	popl	%ecx
	popl	%edx
finish:
	loop	shift

	pushl	$out
	call	printf
	addl	$4, 	%esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax	#return 0
	ret
