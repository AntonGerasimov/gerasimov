//3 4 4
//На вход подается трехсимвольный текст
	.data
symbol:
	.space 1
in:
	.string	"%s"
out:
	.string	"%s\n"
pr_1:
	.string "Правило 1. Заменить каждую строчную латинскую букву соответствующей заглавной буквой."
pr_2:
	.string "Правило 2. Удалить из текста все повторные вхождения его первого символа."

	.set str_in_length,	3
str_in:
	.space str_in_length
rule:	
	.space 4
//rule = 1 if pr_1,	else rule=2
enter:
	.string "\n"
out_d:
	.string "%d\n"
str_out:
	.space str_in_length

	.text	
rule_1:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	movl    $1,     rule
        movl    $str_in,        %esi
        movl    $str_out,       %edi
        movl    $str_in_length, %ecx
1:
        lodsb
        cmpb    $65,    %al
        jl      next
        cmpb    $90,    %al
        jle     next
        cmpb    $97,    %al
        jge     change
        cmpb    $122,   %al
        jle     change
        jmp     next
change:
        subb    $32,    %al
next:
        stosb
        loop    1b

	movl	$0,	%eax	#return 0
	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	ret	

rule_2:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	movl    $2,     rule
        movl    $str_in,        %esi
        movl    $str_out,       %edi

        movl    $str_in_length, %ecx

        lodsb
        movb    %al,    symbol
        stosb

        subl    $1,     %ecx
delete:
        lodsb
        cmpb    symbol, %al
        je      dont_write
        stosb
dont_write:
        loop    delete

	movl	$0,	%eax	#return 0
	movl	%ebp,	%esp	#Epilog
	popl	%ebp
	ret
	.globl	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$str_in	#Scan
	pushl	$in
	call	scanf
	addl	$8,	%esp	

	pushl	$str_in
	pushl	$out
	call	printf
	addl	$8,	%esp

	pushl	$enter
	call	printf
	addl	$4,	%esp

	movl	$str_in,	%esi
	movl	$str_out,	%edi

	lodsb
	cmpb	$65,	%al
	jl	pravilo_2
	cmpb	$90,	%al
	jle	next_sv
	cmpb	$97,	%al
	jl	pravilo_2
	cmpb	$122,	%al
	jg	pravilo_2
next_sv:
	movl	$1,	%ecx
svoistvo:
	lodsb
	addl	$1,	%ecx
	cmpl	$str_in_length,	%ecx
	je 	proverka
	jmp	svoistvo
proverka:
	cmpb	$65,	%al
	jl	pravilo_2
	cmpb	$90,	%al
	jle	pravilo_1
	cmpb	$97,	%al
	jl	pravilo_2
	cmpb	$122,	%al
	jg	pravilo_2

	jmp	pravilo_1
	
pravilo_1:
	call	rule_1
	jmp	print

pravilo_2:
	call	rule_2

print:
	cmpl	$2,	rule
	je 	print_pravilo_2
print_pravilo_1:
	pushl	$pr_1
	pushl	$out
	call	printf
	addl	$8,	%esp
	jmp	next_print
print_pravilo_2:
	pushl	$pr_2
	pushl	$out
	call	printf
	addl	$8,	%esp
	
next_print:
	pushl	$enter
	call	printf
	addl	$4,	%esp

	pushl	$str_out	#Print
	pushl	$out
	call	printf
	addl	$8,	%esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax	#return 0
	ret
