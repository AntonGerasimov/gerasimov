#Программа выводит 0, если отработала правильно, то есть значение, которое вывела функция, совпадает со значением адреса переменной.
#В случае неправильной работы выводится 0.
	.data
	.globl a
a:
	.space 4
out:
	.string "%d\n"
	.text
	.globl	pointer, main
pointer:
	pushl	%ebp	#Prolog
	movl	%esp, 	%ebp

	movl	$a, 	%eax 	#return address of a
	
	movl 	%ebp, 	%esp	#Epilog
	popl	%ebp
	ret
main:
	pushl	%ebp
	movl	%esp, 	%ebp

	call 	pointer	

	cmpl	$a,	%eax
	jne 	set_1
	movl	$0,	%eax
	jmp 	print
set_1:
	movl	$1,	%eax
print:	
	pushl 	%eax	#Print
	pushl 	$out
	call 	printf
	addl 	$8, 	%esp

	movl	$0, 	%eax	#return 0
	
	movl 	%ebp, 	%esp	#Epilog
	popl	%ebp
	ret
