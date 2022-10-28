.section .data
niz1: .long 1, 2, 3, 4, 5, 6
niz2: .long 1, 2, 3, 4, 5, 6
rezultat: .long 0, 0, 0, 0, 0, 0
.section .text
.global _main

#Dati su nizovi: A [1, 2, 3, 4, 5, 6] i B [1, 2, 3, 4, 5, 6]
#Sabrati elemente prvog i drugog niza, i smestiti zbirove u treći niz.
#Kroz prvi niz se kreće kroz od prvog do poslednjeg.
#Kroz drugi niz se kreće od poslednjeg do prvog.
#Resenje treba da bude : C [7, 7, 7, 7, 7, 7]

_main:
    movl $0, %eax  #indeks prvog niza, a i konacnog
    movl $5, %ebx  #indeks drugog niza

petlja:
    movl niz1(, %eax, 4), %ecx
    movl niz2(, %ebx, 4), %edx
    addl %edx, %ecx
    movl %ecx, rezultat(, %eax, 4)

    incl %eax
    decl %ebx

    cmpl $5, %eax
    ja kraj

    cmpl $0, %ebx
    jae petlja

kraj:
    xorl %eax, %eax
    ret





# DRUGI NACIN, PROSLI

#petlja:
    #movl niz1(, %eax, 4), %ecx
    #movl niz2(, %ebx, 4), %edx
    #addl %edx, %ecx
    #movl %ecx, rezultat(, %eax, 4)

    #cmpl $5, %eax
    #jae kraj

    #cmpl $0, %ebx
    #jbe kraj

    #incl %eax
    #decl %ebx
    #jmp petlja

#kraj:
    #xorl %eax, %eax
    #ret
