#Программа получает на вход целое число. На выход подается его целая часть от логарифма по основанию 2.
	.data
int_1:
	.space 4
int_2:
	.space 4
int_string:
	.string "%d"
out_string:
	.string "%d\n"
	.text
	.globl main
main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp
	
	pushl 	$int_1 	#Scan
	pushl 	$int_string
	call 	scanf
	addl 	$8, 	%esp

	pushl 	$int_2
	movl 	$-1, 	%eax
	movl 	%eax, 	int_2
	movl 	int_1, 	%eax

	cmpl	$0, 	%eax
	je 	done
del:
	movl 	$2, 	%ebx
	idiv 	%ebx
	pushl 	%eax	
	movl 	int_2, 	%eax
	addl  	$1, 	%eax
	movl 	%eax, 	int_2
	popl 	%eax
	movl 	$0, 	%edx	
	cmpl 	$0, 	%eax 
	jne del
done:
	movl 	int_2, 	%eax

	pushl 	%eax 	#Print
	pushl 	$out_string
	call 	printf
	addl 	$12, 	%esp
	
	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp
	
	movl 	$0, 	%eax 	#return 0
	ret
