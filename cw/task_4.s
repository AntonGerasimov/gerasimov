.text
.globl my_sum, my_rasn, my_umn, my_del, my_i, my_d
my_sum:
	pushl %ebp
	movl %esp, %ebp

	pushl %ebx
	movl 8(%ebp),%eax
	movl 12(%ebp),%ebx
	addl %eax, %ebx
	movl %ebx, %eax
	popl %ebx


	movl %ebp, %esp
	popl %ebp
	ret

my_rasn:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%ebx
        movl 12(%ebp),%eax
        subl %eax, %ebx
        movl %ebx, %eax
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret

my_umn:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
        imul %ebx
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret

my_del:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
	movl %eax,%edx
	sarl $31, %edx
        idivl %ebx
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret

my_i:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
        addl $1,%eax
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret

my_d:
        pushl %ebp
        movl %esp, %ebp

        pushl %ebx
        movl 8(%ebp),%eax
        movl 12(%ebp),%ebx
        addl $-1, %eax
        popl %ebx


        movl %ebp, %esp
        popl %ebp
        ret


	
