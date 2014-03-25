#Программа принимает на вход два целых числа. На выход подается 4 строки. В первой - сумма чисел. Во второй - разность первого и второго.
#В третьей - произведение чисел. В четвертой - целая часть от деления первого на второе.
	.data
my_sum:
	pushl %ebp #Prolog
	movl %esp, %ebp

	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	addl %eax, %ebx
	movl %ebx, %eax
	popl %ebx


	movl %ebp, %esp #Epilog
	popl %ebp
	ret

my_rasn:
        pushl %ebp #Prolog
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%ebx
        movl 12(%ebp),%eax
        subl %eax, %ebx
        movl %ebx, %eax
        popl %ebx


        movl %ebp, %esp #Epilog
        popl %ebp
        ret

my_umn:
        pushl %ebp #Prolog
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
        imul %ebx
        popl %ebx


        movl %ebp, %esp #Epilog
        popl %ebp
        ret

my_del:
        pushl %ebp #Prolog
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
	movl %eax,%edx
	sarl $31, %edx
        idivl %ebx
        popl %ebx


        movl %ebp, %esp #Epilog
        popl %ebp
        ret
int_1:
	.space 4
int_2:
	.space 4
in:
	.string "%d %d"
out:
	.string "%d\n"
	.text
	.globl my_sum, my_rasn, my_umn, my_del, main
main:
	pushl %ebp #Prolog
	movl %esp, %ebp

	pushl $int_2 #Scan
	pushl $int_1
	pushl $in
	call scanf
	addl $12, %esp

	pushl int_1 #my_sum
	pushl int_2
	call my_sum
	addl $8, %esp
	
	pushl %eax #print sum
	pushl $out
	call printf
	addl $8, %esp

	pushl int_2 #my_rasn
	pushl int_1
	call my_rasn
	addl $8, %esp
	
	pushl %eax #print rasn
	pushl $out
	call printf
	addl $8, %esp	

	pushl int_1 #my_umn
	pushl int_2
	call my_umn
	addl $8, %esp

	pushl %eax #print umn
	pushl $out
	call printf
	addl $8,%esp
	
	pushl int_2 #my del
	pushl int_1
	call my_del
	addl $8, %esp

	pushl %eax #print del
	pushl $out
	call printf
	addl $8, %esp

	movl %ebp, %esp #Epilog
	popl %ebp

	movl $0, %eax #return 0
	ret

	
