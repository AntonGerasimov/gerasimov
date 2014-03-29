#Программа сначала устанавливает значение всех флагов на 0
#Затем она присваивает поочередно флагам значение единицы. 0000->1000->1100->1010->1011, печатая соответствующие четверки чисел
	.data
string:
	.string "%d"
a:
	.space 4
cf:
	.space 4
zf:
	.space 4
sf:
	.space 4
of:
	.space 4
int:
	.string	"%d"
out_n:
	.string "\n"
	.text
	.globl print_flags, main
print_flags:

c_flag:
	jc	c_1
	jmp	c_0
z_flag:
	jz	z_1
	jmp	z_0
s_flag:
	js	s_1
	jmp	s_0
o_flag:
	jo	o_1
	jmp	o_0

c_1:
	movl	$1,	cf
	jmp	z_flag
c_0:
	movl	$0,	cf
	jmp	z_flag
z_1:
	movl	$1,	zf
	jmp	s_flag
z_0:
	movl	$0,	zf
	jmp	s_flag	
s_1:
	movl	$1,	sf
	jmp	o_flag
s_0:
	movl	$0,	sf
	jmp	o_flag
o_1:
	movl	$1,	of
	jmp 	print
o_0:
	movl	$0,	of
	jmp 	print

print:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp	
	pushl	cf	#Print cf value
	pushl	$int
	call	printf
	addl	$8,	%esp

	pushl	zf	#Print zf value
	pushl	$int
	call	printf
	addl	$8,	%esp

	pushl 	sf	#Print sf value
	pushl	$int
	call 	printf
	addl	$8,	%esp
	
	pushl	of	#Print of value
	pushl	$int
	call	printf
	addl	$8,	%esp

	pushl	$out_n
	call	printf
	addl	$4,	%esp

	movl 	%ebp, 	%esp  	#Epilog
	popl 	%ebp

	movl	$0,	%eax	#return 0
	ret
main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp

	pushl	$a
	pushl	$int
	call	scanf	
	addl	$8,	%esp

	movl	$10,	%eax	
	cmpl	$0,	%eax	#cs=zf=sf=of=0
	call 	print_flags	

	movl	$10,	%eax
	cmpl	$0,	%eax
	stc	#set carry flag to 1
	call	print_flags 	#cf=1 zf=sf=of=0

	movl	$0,	%eax
	cmpl	$0,	%eax
	stc	
	call print_flags	#cf=zf=1 sf=of=0
	
	movl	$-10,	%eax
	cmpl	$10,	%eax
	stc
	call	print_flags	#3*1

	movl	$1,	%eax
	addl	%eax,	%ebx
	imul	%ebx
	imul	%ebx
	call 	print_flags	#4*1
	
	movl 	%ebp, 	%esp  	#Epilog
	popl 	%ebp

	movl	$0,	%eax	#return 0
	ret
