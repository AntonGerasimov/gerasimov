	.data
in_int:
	.string "%d"
in_string:
	.string "%s"
out_int:
	.string "%d\n"
	.comm	chelovek,24,4
	.text
	.globl	main
main:
	pushl	%ebp 	#Prolog
	movl	%esp, 	%ebp

	pushl	$chelovek	#scan family
	pushl	$in_string
	call	scanf
	addl	$8,	%esp

	movl 	$chelovek,	%eax	#scan name
	addl	$10,	%eax
	pushl	%eax
	pushl	$in_string
	call	scanf
	addl	$8,	%esp

	movl 	$chelovek,	%eax 	#scan age
	addl	$20,	%eax
	pushl	%eax
	pushl 	$in_int
	call	scanf
	addl	$8,	%esp

	pushl	$chelovek	#print family
	call 	puts
	
	pushl	$chelovek+10	#print name
	call	puts

	movl	chelovek+20,	%eax 	#print age
	pushl	%eax
	pushl	$out_int
	call 	printf
	addl	$8,	%esp

	movl	$0, %eax #return 0

	movl	%ebp,	%esp #Epilog
	popl	%ebp

	ret





