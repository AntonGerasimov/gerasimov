#Программа получает на вход 2 целых числа и выводит "Yes", если первое число больше или равно, чем второе, и "No" в обратном случае. 
#Вывод производится без кавычек.
	.data
yes_string:
	.string "Yes\n"
no_string:
	.string "No\n"
int_string:
	.string "%d %d"
int_space_a:
	.space 4
int_space_b:
	.space 4
	.text
	.globl main
main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp

	pushl 	$int_space_b 	#Scan
	pushl 	$int_space_a
	pushl 	$int_string
	call 	scanf
	addl 	$8, 	%esp

	pushl 	%ebx 	#Save ebx and eax
	pushl 	%eax

	movl 	int_space_a, 	%eax
	movl 	int_space_b, 	%ebx
	
	cmp 	%ebx, 	%eax
	jge 	more 	#If the first is more then the second or equal go to more
	pushl 	$no_string 	#Print if second is more then the first
	call 	printf
	addl 	$4, 	%esp
	jmp 	next

more:
	pushl 	$yes_string 	#Print
	call 	printf
	addl 	$4, 	%esp

next: 	#Continue program	
	popl 	%eax
	popl 	%ebx

	movl 	%ebp, 	%esp 	#Epilog
	popl 	%ebp

	movl 	$0, 	%eax 	#return 0
	ret
