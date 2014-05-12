	.data
	.comm str,101,32 
	.comm str_new, 101,32 
number:			
	.space 4
value:
	.space 4
str_in:
	.string "%s %d %d"
str_out:
	.string "%s\n"
	.text
	.globl main
main:
        pushl 	%ebp	#Prolog
        movl 	%esp, 	%ebp  

	pushl	$number	#Scan
	pushl	$value
	pushl	$str
	pushl	$str_in
	call	scanf
	addl	$16,	%esp

	movl 	$str_new, 	%edi
	movl 	$str, 	%esi
	movl 	value, 	%ecx
	subl 	$1, 	%ecx
	cmp 	$0, 	%ecx
	je 	zero

first:
	pushl 	%ecx
	movsb
	popl 	%ecx
	loop 	first

zero:
	addl 	number, %esi
second:
	lodsb
	stosb
	cmp 	$0, 	%al
	je 	finish
	jmp 	second

finish:
	pushl 	$str_new	#Print	
	pushl 	$str_out
	call 	printf
	addl 	$12, 	%esp

        movl 	%ebp, 	%esp   	#Epilog
        popl 	%ebp
        movl 	$0, 	%eax	#return 0
        ret
