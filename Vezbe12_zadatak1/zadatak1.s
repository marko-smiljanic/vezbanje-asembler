.section .data
prom: .string "Neki string\0"
.section .text
.global _main

#Kreirati program koji kao promenljivu ima bilo kakav string. Program prolazi kroz string i svako detektovano slovo 'e' pretvara uslovo 'a'.
#Potrebno je da radi sa stringovima proizvoljnih duzina (petlju zaustaviti kada se detektuje 0 znak)

_main:

    movl $prom, %eax  #u eax je adresa

ponovo:
    cmpb $'e', (%eax)  #udji u adresu i iscitaj sta se tamo nalazi
    je promena
    jmp provera

promena:
    movb $'a', (%eax)

provera:
    cmpb $0, (%eax)
    je kraj
    incl %eax  #prelazak na sledecu adresu, svaki karakter iz stringa zauzima 1 bajt, zato se samo inkrementira
    jmp ponovo

kraj:
    xorl %eax, %eax
    ret
