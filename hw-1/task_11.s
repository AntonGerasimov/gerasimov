#На вход программе подается целое число. При правильной работе она выводит тоже самое число на экран, предварительно выполнив непосредственную, прямую и косвенную адресацию.
	.data
int:
	.space 8
space:
	.space 8
address:
	.int 	0x00110012
in_int:
	.string "%d"
out_int:
	.string "%d\n"
	.text
	.globl main
main:
	pushl	%ebp 	#Prolog
	movl	%esp,	%ebp

	pushl 	$int 	#Scan number
	pushl	$in_int
	call	scanf
	addl 	$8,	%esp

	movl	$space,	%ebx 	#move address of space to ebx
	movl	int,	%eax 	#move our scanned value to space
	movl	%eax,	space

	movl	$23,	%eax 	#Непосредственная адресация
	movl	(address),	%eax	#Прямая адресация (обычная)	
	movl	(%ebx),	%eax	#Косвенная адресация

	pushl	%eax 	#напечатать значение, которое находится по адресу, лежащему в ebx
	pushl	$out_int
	call	printf
	addl	$8,	%esp

	movl	%ebp,	%esp 	#Epilog
	popl	%ebp
	movl	$0,	%eax 	#return 0
	ret
