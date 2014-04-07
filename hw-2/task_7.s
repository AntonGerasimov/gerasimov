	.data
a:
	.space 	32

b:
	.space 	32

in:
	.string	"%s"

out:
	.string	"%s\n"

	.set str_in_length,	3
str_in:
	.space str_in_length
str_out:
	.space	str_in_length
error_string:
	.string	"error\n"
n:
	.string	"\n"
	.text
svoistvo:
	cmpl	$str_in_length,	%ecx
	je 	proverka_zagl
	cmpl	$1,	%ecx
	je 	proverka_str
	jmp	next
proverka_zagl:
	jmp 	next
proverka_str:
	cmpb	$96,	%al
	jl	error
	cmpb	$122,	%al
	jg 	error	
	jmp	next

pravilo_1:
//Строчные буквы имеют код от 97 до 122
//Сравниваем %al и 97, если меньше, то save
        cmpb    $97,    %al
        jl      save
//Сравниваем %al и 122, если больше, то save
        cmpb    $122,   %al
        jg      save
add:
        addb    $-32,   %al
	jmp	save

	.globl	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$str_in
	pushl	$in
	call	scanf
	addl	$8,	%esp	

	movl	$str_in,	%esi
	movl	$str_out,	%edi

	movl	$str_in_length,	%ecx
1:
	lodsb
	
	call	pravilo_1
	
save:
	stosb
	loop	1b


	pushl	$str_in
	pushl	$out
	call 	printf
	addl	$8,	%esp

	pushl	$n
	call	printf
	addl	$4,	%esp

	pushl	$str_out
	pushl	$out
	call	printf
	addl	$8,	%esp

	jmp	epilog
//error:
//	pushl	$error_string
//	call	printf
//	addl	$4,	%esp
epilog:
	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax
	ret
