.section .data
.section .text
.global _main

#napisati program za racunanje (A+B)-(C+D)-(E+F)

_main:
    #prvi deo A+B

    movl $10, %eax
    movl $20, %ebx
    addl %eax, %ebx   #bitno je da ne uprljamo ebx jer se u njemu nalazi rezultat A+B, eax je posle toga slobodan

    #drugi deo C+D

    movl $5, %eax
    movl $3, %ecx
    addl %eax, %ecx   #ovde ne diramo ecx jer je tu rezultat C+D

    #treci deo E+F

    movl $2, %eax
    movl $1, %edx
    addl %eax, %edx   #rezultat u edx

    #poslednji deo sve oduzimamo

    subl %ecx, %ebx
    subl %edx, %ebx

    xorl %eax, %eax




    ret
