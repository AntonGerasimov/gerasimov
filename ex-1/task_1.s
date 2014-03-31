#Максимальная длина строки - 10. Предполагается, что длина строки >0, т.е. вводится хотя бы один символ
	.data
a:
	.space 20	#Максимальная длина строки - 10
read:
	.string "%s"
print:
	.string "%d\n"
count:
	.space 4
prov:
	.space 4
	.text
	.globl main
main:
	pushl	%ebp	#Prolog
	movl	%esp,	%ebp

	pushl	$a	#Scan
	pushl	$read
	call	scanf
	addl	$8,	%esp
	
	movl	$0,	%eax
	movl	%eax,	count
	movl	%eax,	prov

	movl	$20,	%ecx
find:
	movl	$a,	%eax
	subl	%ecx,	%eax
	addl	$20,	%eax

	pushl	%ecx

	cmpl	$0,	(%eax)
	jne 	not_zero_char
	jmp end
not_zero_char:
	movl	prov,	%edx
	cmpl	$0,	%edx
	je	next
	jmp 	end_1
next:
	movl	count,	%edx
	addl	$1,	%edx
	movl	%edx,	count
	jmp	end_1

end:
	movl	$1,	%edx
	movl	%edx,	prov
end_1:
	popl	%ecx
	loop 	find

	pushl   count	#print
        pushl   $print
	call    printf
	addl    $8,     %esp

	movl	%ebp,	%esp	#Epilog
	popl	%ebp
	movl	$0,	%eax	#return 0
	ret
