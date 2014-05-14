//Программа возводит вещественное число x в произвольную степень y.
	.data
y:
	.space 8
x:
	.space 8
str_in:
	.string "%lf %lf"
str_out:
	.string "%lf\n"
	.text
	.globl main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp
	
	pushl	$y	#Scan
	pushl	$x
	pushl	$str_in
	call 	scanf
	addl	$12,	%esp
	
	finit
#Разобьем log2(x^y) на целую и дробную части z1 и z2
#(2^z1)*(2^z2) = x^y
	fldl   	y	#load y
	fldl   	x	#load x
	fyl2x		#y*log2(x) на вершине стека
	frndint		#округление 

	fld1		#load 1	
	fscale		#1*2^z1 на вершине стека

	fldl   	y	#load y	
        fldl   	x	#load x
        fyl2x		#y*log2(x)
        frndint		#округление

        fldl   y	#load y
        fldl   x	#load x
        fyl2x		#y*log2(x)
        fsubp		#на вершине стека - дробная часть y*log2(x)
        f2xm1		#на вершине стека - 2^z2 - 1

        fld1		#load 1
        faddp		#на вершине стека 2^z2-1+1=2^z2

        fmulp		#x^y на вершине стека		

	pushl	%eax	#выделяем место на стеке для x^y
        fstpl   (%esp)	#Print
        pushl   $str_out
        call 	printf
        addl    $12,    %esp

	movl	$0,	%eax	#return 0
	movl	%ebp,	%esp	#Epilog
	popl	%ebp
	ret
