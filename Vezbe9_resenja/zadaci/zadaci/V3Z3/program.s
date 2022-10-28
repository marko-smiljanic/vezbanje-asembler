.section .data
niz: .long 1, 3, 5, 7, 9, 11, 13
max_indeks = 6
zbir: .long 0
indeks: .long 0
.section .text
.global _main

_main:
    movl $niz, %eax
    movl indeks, %ebx

sabiranje:
    movl (%eax, %ebx, 4), %ecx
    addl %ecx, zbir
    incl %ebx
    cmpl $max_indeks, %ebx
    jbe sabiranje

    xorl %eax, %eax
    ret

