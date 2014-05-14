//Программа принимает на вход две строки. Первая содержит заглавные латинские буквы. Вторая - строчные. Если обе строки - одинаковые слова, содержащие букву "a", то программа выводит YES, иначе - NO.
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
str_in_2:
	.space str_in_length


str_out:
	.space	str_in_length
yes_string:
	.string "YES"
no_string:
	.string "NO"
	.text
	.globl	main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$str_in
	pushl	$in
	call	scanf
	addl	$8,	%esp

	pushl	$str_in_2
	pushl	$in
	call	scanf
	addl	$8,	%esp	

	movl	$str_in,	%esi
	movl	$str_out,	%edi

	movl	$str_in_length,	%ecx
1:
	lodsb
	addb	$32, %al
	stosb
	loop	1b

	movl	$str_in_length, %ecx
	movl	$str_out, 	%esi
	movl	$str_in_2,	%edi
	repne 	cmpsb

	jnz	no_str

	movl	$str_in_length,	%ecx
	movb	$97,	%al
	movl	$str_in_2,	%esi
	repne	scasb
	jnz	no_str	
	
	
	pushl	$yes_string
	jmp	out_place
no_str:
	pushl	$no_string
out_place:
	pushl	$out
	call	printf
	addl	$8,	%esp
	

	movl	%ebp,	%esp	#Epilog
	popl	%ebp

	movl	$0,	%eax
	ret
