#Программа принимает на вход целое число и сравнивает его с нулем. На выход подается значение флагов cf, zf, sf, of после выполнения операции сравнения.
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
	
	.macro	outf

c_flag:
	jc	c_1
	jmp	c_0
z_flag:
        jz      z_1
        jmp     z_0
s_flag:
        js      s_1
        jmp     s_0
o_flag:
        jo      o_1
        jmp     o_0

c_1:
        movl    $1,     cf
        jmp     z_flag
c_0:
        movl    $0,     cf
        jmp     z_flag
z_1:
        movl    $1,     zf
        jmp     s_flag
z_0:
        movl    $0,     zf
        jmp     s_flag
s_1:
        movl    $1,     sf
        jmp     o_flag
s_0:
        movl    $0,     sf
        jmp     o_flag
o_1:
        movl    $1,     of
        jmp     print
o_0:
        movl    $0,     of
        jmp     print

print:
        pushl   cf      #Print cf value
        pushl   $int
        call    printf
        addl    $8,     %esp

        pushl   zf      #Print zf value
        pushl   $int
        call    printf
        addl    $8,     %esp

        pushl   sf      #Print sf value
        pushl   $int
        call    printf
        addl    $8,     %esp

        pushl   of      #Print of value
        pushl   $int
        call    printf
        addl    $8,     %esp

        pushl   $out_n
        call    printf
        addl    $4,     %esp
	.endm

	.globl main
main:
	pushl 	%ebp 	#Prolog
	movl 	%esp, 	%ebp

	pushl	$a
	pushl	$int
	call	scanf
	addl	$8,	%esp
	
	cmpl	$0,	a		
	outf

	movl 	%ebp, 	%esp  	#Epilog
	popl 	%ebp

	movl	$0,	%eax	#return 0
	ret
