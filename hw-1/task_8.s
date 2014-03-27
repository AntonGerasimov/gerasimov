#Программа принимает на вход положительное целое десятичное число.
#На выход подается его запись в BCD неупакованной кодировке в форме "10000000 10000000 10000000"
#Последним символом выводится пробел
	.data
int:
	.space 4
input:
	.string "%d"
output:
	.string "%d"
out:
	.string "\n"
space:
	.string " "
count:
	.space 4
	.text
	.globl main
main:
	pushl 	%ebp	#Prolog
	movl 	%esp, 	%ebp

	pushl	$int 	#Scan
	pushl	$input
	call	scanf
	addl 	$8,	%esp

	movl 	count, 	%eax #Set count to zero
	movl 	$0, 	%eax
	movl 	%eax, 	count

del:
	movl	int,	%eax
	movl	$10,	%ebx
	idiv	%ebx

	pushl 	%edx
	movl	$0,	%edx
	movl 	%eax,	int

	movl 	count, 	%ebx
	addl	$1,	%ebx
	movl 	%ebx,	count

	cmpl	$0,	%eax
	je 	end_del
	jmp 	del
end_del:
	movl 	count,	%ecx
perevod:
	popl	%eax
	pushl	%ecx
		
	movl 	$24, 	%ecx
zero_minus:
	shll 	$1, 	%eax
	loop 	zero_minus
	movl 	$8,	%ecx
bcd:
	shll	$1,	%eax
	movl	$0,	%ebx
	jnc	print	#проверяем carry flag
	movl	$1,	%ebx
print:
	pushl	%edx	#сохраняем значения edx, ecx, eax перед печатью, кладя их на стек
	pushl	%ecx
	pushl	%eax
	
	pushl	%ebx	#печать очередной цифры числа
	pushl	$output
	call	printf
	addl	$8,	%esp

	popl	%eax	#забираем значения edx, ecx, eax со стека
	popl	%ecx
	popl	%edx

	loop	bcd
	

	pushl 	$space
	call 	printf
	addl 	$4, 	%esp


	popl 	%ecx
	loop	perevod

	pushl	$out
	call 	printf
	addl	$4,	%esp

	movl 	%ebp, 	%esp	#Epilog
	popl 	%ebp
	
	movl 	$0, 	%eax 	#return 0
	ret
