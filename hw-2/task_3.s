#Программа принимает на вход одномерный массив из трех вещественных чисел формата double
#На выход подается их сумма.
	.data
	.globl a
a:
	.space 24
b:
	.space 8
in:
	.string	"%lf"
out:
	.string "%lf\n"
summ:
	.space 8
count:
	.space 4
	.text
	.globl	main
main:
	pushl	%ebp 	#Prolog
	movl	%esp, 	%ebp

	movl 	$0,	%eax 	#Обнуляем счетчик i
	movl 	%eax, 	count

read:
	movl	count, 	%eax
	sall	$3, 	%eax
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

	finit
	movl	$a,	%eax
	fldl	(%eax)	#load a[0] to stack
        movl    $1,     %eax    #i=0
        movl    %eax,   count
        jmp     next_2
summa:
        movl    count,  %eax    #for (i=1;i<=2;i++)
        sall    $3,     %eax
        addl    $a,     %eax

	fldl	(%eax)	#load a[i] to stack
	faddp	#a[0]+a[i] on the top of stack

        movl    count,  %eax	#i++
        addl    $1,     %eax
        movl    %eax,   count
next_2:
        movl    count,  %eax    #Проверка
        cmpl    $2,     %eax
        jle     summa

	pushl	%eax	#Print
	fstpl	(%esp)	
	popl	%eax
	movl	%eax,	summ

	pushl	summ
	pushl	$out
	call	printf
	addl	$8,	%esp

	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp

	movl 	$0, 	%eax 	#return 0
	ret
