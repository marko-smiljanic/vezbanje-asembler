.section .data
niz1: .long 2, 4, 6, 8, 10, 12
niz2: .long 1, 3, 5, 7, 9, 11
rezultat: .long 0, 0, 0, 0, 0, 0
.section .text
.global _main

#Napisati program koji radi sa dva ulazna niza istih duzina. Prolazi kroz prvi niz od prvog do poslednjeg
#elementa, a kroz drugi niz od poslednjeg do prvog elementa. U treci, rezultujuci niz zapisuje zbirove
#trenutnih elemenata nizova (prvi sa poslednjim, pa dalje).

_main:

    movl $0, %eax   #indeks prvog i rezultujuceg
    movl $5, %ebx   #indeks drugog
    movl $0, %ecx
    movl $0, %edx

petlja:
    movl niz1(, %eax, 4), %ecx
    movl niz2(, %ebx, 4), %edx
    addl %ecx, %edx

    movl %edx, rezultat(, %eax, 4)

    incl %eax
    decl %ebx

    cmpl $5, %eax
    jbe uslov2      #nisam morao drugu proveru jer su iste duzine nizovi
    jmp kraj

uslov2:
    cmpl $0, %ebx
    jae petlja


kraj:
    xorl %eax, %eax
    ret
