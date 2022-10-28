.section .data
A: .long 50     #promenjive se pisu uvek izmedju .section.data i .section.text
B: .long 30
C: .long 50
Zbir: .long 0   #mora se zadati pocetna vrednost
.section .text
.global _main

#Napisati program koji računa zbir 3 broja
#Brojeve rasporediti u promenljive A, B i C
#Rezultat smestiti u promenljivu Zbir

_main:

    movl A, %eax  #promenjive prikazuju samo na adresu u memoriji, a tu adresu moramo da da koristimo preko registara
    addl B, %eax
    addl C, %eax
    movl %eax, Zbir


    xorl %eax, %eax
    ret
