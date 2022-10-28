.section .data
niz: .long 2, 15, 3, 6, 7, 19, 23, 16, 12, 9, 8
indeks: .long 0
max_indeks = 10
trenutni_broj: .long 0
broj_parnih: .long 0
.section .text
.global _main

_main:
    movl $niz, %eax
    movl indeks, %ebx

ponovo:
    movl (%eax, %ebx, 4), %ecx

parnost:
    cmpl $2, %ecx
    jb kraj_parnosti
    subl $2, %ecx
    jmp parnost

kraj_parnosti:
    cmpl $1, %ecx
    je neparan
    incl broj_parnih

neparan:            #ako je neparan, ne radimo nista
    incl %ebx
    cmpl $max_indeks, %ebx
    jbe ponovo

    xorl %eax, %eax
    ret
