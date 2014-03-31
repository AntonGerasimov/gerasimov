#Программа принимает на вход одномерный массив из трех целых чисел. Каждое < 1023 по модулю
#Каждое число - это один байт.
#Программа инвертирует каждый байт и печатает их в обратном порядке через пробел
#Последний символ в строке - пробел
	.data
	.globl a
a:
	.space 12
in:
	.string	"%d"
out:
	.string "%d"
n:
	.string "\n"
probel:
	.string " "
number:
	.space 4
new_number:
	.space 4
count:
	.space 4
	.text
	.globl	main
main:
	pushl	%ebp #Prolog
	movl	%esp, %ebp
	movl $0,	%eax
	movl %eax, count
	jmp	next_1
read:
	movl	count,	%eax
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
	movl count, %eax
	cmpl	$2, %eax #for (i=0, i<=2;i++)
	jle	read

	movl	$3,	%ecx
mass:
	pushl	%ecx

	movl	%ecx,	%eax
	sall	$2,	%eax
	addl	$a,	%eax
	subl	$4,	%eax
	movl	(%eax),	%ebx
	movl	%ebx,	number
	movl	$0,	%ebx
	movl	%ebx,	new_number
	movl	number,	%eax
	movl	$8,	%ecx
invert:
	pushl	%ecx

	shrl	$1,	%eax
	movl	$0,	%ebx
	jnc	next
	movl	$1,	%ebx	
next:
	pushl	%eax
	
	pushl	%ebx
	pushl	$out
	call	printf
	addl	$8,	%esp

	popl	%eax

	popl	%ecx
	loop	invert
	
	pushl	$probel
	call 	printf
	addl	$4,	%esp

	popl	%ecx
	loop	mass

	pushl	$n
	call 	printf
	addl	$4,	%esp

	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp

	movl	$0, 	%eax 	#return 0
	ret
