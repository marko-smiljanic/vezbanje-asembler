.section .data
niz: .long 10, 25, 33, 58, 64
prvi_broj: .long 0
drugi_broj: .long 0
treci_broj: .long 0
prvi_indeks: .long 1
drugi_indeks: .long 3
treci_indeks: .long 4
zbir: .long 0
.section .text
.global _main

_main:

    movl prvi_indeks, %eax
    movl niz(, %eax, 4), %ebx
    addl %ebx, zbir
    movl %ebx, prvi_broj

    movl drugi_indeks, %eax
    movl niz(, %eax, 4), %ebx
    addl %ebx, zbir
    movl %ebx, drugi_broj

    movl treci_indeks, %eax
    movl niz(, %eax, 4), %ebx
    addl %ebx, zbir
    movl %ebx, treci_broj



    xorl %eax, %eax
    ret
