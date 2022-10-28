.section .data
niz: .long 10, 2, 5, 6, 4, 22, 7
novi_niz: .long 0, 0, 0, 0, 0, 0, 0
deljenik: .long 2
rezultat: .long 0
.section .text
.global _main

#Dat je niz: [10, 2, 5, 6, 4, 22, 7]
#Podeliti svaki broj u datom nizu sa 2, i rezultate zapisati u novi niz

_main:

    movl $0, %eax    #indeks

ponovo:
    movl niz(, %eax, 4), %ecx          #u ecx cuvam broj iz niza koji se obradjuje
    movl $0, %edx                      #u edx je u stvari rezultat deljenja koji stavljam u novi niz

petlja:
    subl deljenik, %ecx
    incl %edx
    cmpl $1, %ecx         #poredim sa 1(broj minimum moze biti 2) jer nisu svi brojevi parni, ima brojeva koji imaju ostaak deljenja sa 2
    ja petlja           #mozda bi razumljivije bilo da sam stavio ae petlja, a gore cmpl $2, %ecx


    movl %edx, novi_niz(, %eax, 4)
    incl %eax

    cmpl $6, %eax
    jbe ponovo


    xorl %eax, %eax
    ret

