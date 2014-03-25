#Программа принимает на вход одномерный массив из трех целых чисел.
#На выход подается наименьшее из них. Если таких чисел несколько, то на выход подается одно из них.
	.globl	a
	.data
a:
	.space 12
in:
	.string	"%d"
out:
	.string "%d\n"
min:
	.space 4
count:
	.space 4
	.text
	.globl	main
main:
	pushl	%ebp #Prolog
	movl	%esp, %ebp

	movl $0,%eax
	movl %eax, count

	jmp	next_1
read:
	movl	count, %eax
	sall	$2, %eax
	addl	$a, %eax
	pushl	 %eax
	pushl	$in
	call	scanf
	addl 	$8, %esp
	movl count, %eax
	addl	$1, %eax
	movl %eax, count
next_1:
	movl count, %eax
	cmpl	$2, %eax #for (i=0, i<=2;i++)
	jle	read

	movl a, %eax #min = a[0]
	movl %eax, min

	movl $1, %eax
	movl %eax, count
	jmp next_2
minimum:
	movl count, %eax
	sall $2, %eax 
	addl $a, %eax
	
	movl (%eax), %edx
	movl %edx, %eax

	movl min, %ebx
	cmpl %ebx, %eax
	js yes
	jmp no
yes: #Если меньше минимального известного
	movl %eax, min
no: #Если не меньше минимального известного
	movl count, %eax
	addl $1, %eax
	movl %eax, count
next_2:
	movl count, %eax
	cmpl $2, %eax
	jle minimum

	
	movl min, %eax
	pushl %eax
	pushl $out
	call printf
	addl $8, %esp

	movl %ebp, %esp #Epilog
	popl %ebp

	movl	$0, %eax #return 0
	ret

