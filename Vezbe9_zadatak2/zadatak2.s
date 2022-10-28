section .data
niz: .long 10, 25, 33, 58, 64
zbir: .long 0
section.text
global _main

#INDEKSNO ADRESIRANJE

#Zadat je sledeći niz: [10, 25, 33, 58, 64]
#Napisati program koji koristi indeksno
#adresiranje da pristupi 2., 4. i 5. elementu i
#sabere ih

# niz(, indeks, velicina)  a izvrsava se: niz+indeks*vel

_main:

    #Indeksno

    movl $1, %eax  #indeks drugog elementa stavljamo u eax
    movl niz(, %eax, 4), %ebx   #zadajemo direktno indeks elementa u sintaksi
    movl %ebx, zbir

    movl $3, %eax
    movl niz(, %eax, 4), %ebx
    addl %ebx, zbir

    movl $4, %eax
    movl niz(, %eax, 4), %ebx
    addl %ebx, zbir

    #Indirektno adresiranje

    movl $niz, %eax
    addl $4, %eax
    movl (%eax), %ebx

    addl $8, %eax     #u ebx je adresa od drugog elementa, a 4ti element je za 2 pozicije napred od njega(tj. 4*2)
    movl(%eax), %ebx

    addl $4, %eax
    movl (%eax), %ebx


    xorl %eax, %eax
    ret

