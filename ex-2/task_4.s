	.data
	.comm str_1,101,32  #first string
	.comm str_2,101,32  #second string
	.comm str_new, 201,32 #new string
length_1:
	.space 4
value:
	.space 4
str_in:
	.string "%s %s %d"
str_out:
	.string "%s \n"
	.text
	.globl main
main:
        pushl 	%ebp	#Prolog
        movl 	%esp, 	%ebp 

	pushl 	$value	#Scan
	pushl 	$str_2
	pushl	$str_1
	pushl 	$str_in
	call 	scanf
 	addl 	$16, 	%esp

	movl 	$str_1, %esi
	movl 	$0, 	%ecx
first: 
	lodsb
	cmp 	$0, 	%al
	je 	next_1
	addl 	$1, 	%ecx
	jmp 	first
next_1:
	movl 	%ecx, 	length_1  

	movl 	$str_new, 	%edi
	movl 	value, 		%ecx
	subl 	$1, 		%ecx
	movl 	$str_2, 	%esi 
	movl 	%esi, 		value 	
	cmp 	$0, 		%ecx     
	je 	easy_way 	#p=1

second:	          
	pushl 	%ecx
	movsb
	popl 	%ecx
	loop 	second
	movl 	%esi, 	value 

easy_way:
	movl 	length_1, 	%ecx  
	movl 	$str_1, 	%esi
third:
	pushl 	%ecx
	movsb
	popl 	%ecx
	loop 	third

	movl 	value,	%esi  
label_4:
	lodsb
	stosb
	cmp 	$0, 	%al  
	je 	finish	#go to the end
	jmp 	label_4

finish:
	pushl 	$str_new	#Print	
	pushl 	$str_out
	call 	printf    
	addl 	$8, %esp

        movl 	%ebp, 	%esp   #Epilog
        popl 	%ebp
        movl 	$0, 	%eax
        ret
