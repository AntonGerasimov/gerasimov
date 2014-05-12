	.data
	.comm str_1,101,32  #first string
	.comm str_2,101,32  #second string
length_1:				
	.space 4
length_2:
	.space 4
value:
	.space 4
str_in:
	.string "%s %s"
str_out:
	.string "%d\n"

	.text
	.globl main
main:
        pushl 	%ebp
        movl 	%esp, 	%ebp  	#prolog

	pushl 	$str_2
	pushl 	$str_1
	pushl 	$str_in
	call 	scanf
	addl 	$12, 	%esp
	movl 	$-1, 	value

	movl 	$str_1, %esi
	movl 	$0, 	%ecx
first:  #finding lengthes
	lodsb
	cmp 	$0, 	%al
	je 	next_1
	addl 	$1, 	%ecx
	jmp	first
next_1:
	movl 	%ecx, 	length_1

        movl 	$str_2, %esi
        movl 	$0, 	%ecx
second:   
        lodsb
        cmp 	$0, 	%al
        je 	next_2
        addl 	$1, 	%ecx
        jmp 	second
next_2:
        movl 	%ecx, 	length_2

	movl 	length_2, 	%ecx
	movl 	length_1, 	%eax
	cmpl	%eax,	%ecx   	#if length_2<length_1
	jl 	finish      	#goto end of program
	addl 	$1, 	%ecx  	

loop_label:	
	subl 	$1, 	%ecx  
	pushl 	%ecx
	movl 	$str_2, %esi
	movl 	$str_1, %edi
	addl 	%ecx,	%esi
	movl 	length_1, 	%ecx
	loop_in:
		pushl 	%ecx  
		cmpsb    
		popl 	%ecx
		jne 	break_in   
		loop 	loop_in
	popl 	%ecx
	movl 	%ecx, 	value  
	pushl 	value
break_in:
	popl 	%ecx
	addl 	$1, 	%ecx 
	loop 	loop_label

finish:
	addl 	$1, 	value   #value=value+1
	pushl 	value
	pushl 	$str_out
	call 	printf     #print
	addl 	$8, 	%esp

        movl 	%ebp, 	%esp   #epilog
        popl 	%ebp
        movl 	$0, 	%eax
        ret
