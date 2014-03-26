#Программа принимает на вход положительное целое десятичное число от 1 до 1023. На выход подается его двоичная запись.
//Исправить баг с нулем
	.data
int_label:
	.space 4
format_string_input:
	.string "%d"
format_string_output:
	.string "%d\n"
	.text
	.globl main
perevod:
	movl $2, %ebx
	idiv %ebx
	pushl %edx
	movl $0, %edx
	addl $1, %ecx
	cmp $0, %eax
	jne perevod
	movl $0, %eax
	jmp next	
main:
	pushl %ebp	#Prolog
	movl %esp, %ebp

	pushl	$int_label 	#Scan
	pushl	$format_string_input
	call	scanf
	addl $8, %esp

	movl	int_label, %eax	
	movl $0, %ecx

	cmp $0, %eax
	jne perevod
	pushl %eax
	movl $0, %ecx
	jmp next
next:
	popl %ebx #записываем текущую цифру для числа в ebx
	movl $10, %edx 
	imul %edx #eax=eax*10 
	addl %ebx, %eax #eax = eax+ebx
	loop next
	
	pushl	%eax #Print
	pushl	$format_string_output
	call	printf
	addl	$8, %esp

	movl %ebp, %esp		#Epilog
	popl %ebp
	ret
