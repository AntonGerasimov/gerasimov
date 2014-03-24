        .data
int:
        .space 4
in:
        .string "%d"
yes:
        .string "yes\n"
no:
        .string "no\n"
        .text
        .globl main
main:
        pushl %ebp
        movl %esp, %ebp

        pushl $int
        pushl $in
        call scanf
        addl $8, %esp

        movl int, %eax
        cmp $1,%eax
        je one
        pushl $no
        call printf
        addl $4, %esp
        jmp finish
one:
        pushl $yes
        call printf
        addl $4, %esp
finish:
        movl %ebp, %esp
        popl %ebp
	movl $0, %eax
        ret

