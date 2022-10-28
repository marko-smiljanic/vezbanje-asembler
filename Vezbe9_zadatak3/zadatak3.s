section .data
niz: .long 1, 3, 5, 7, 9, 11, 13
zbir: .long 0
section.text
global _main

#KOMBINOVANO ADRESIRANJE

#Dat je sledeći niz: [1, 3, 5, 7, 9, 11, 13]
#Napisati program koji koristi kombinovano adresiranje, i računa zbir svih ovih brojeva

# offset se isto osabira kao niz tj. predstavlja opseg(u njega stavljamo adresu niza tj. $niz se stavlja u registar pa u offset)
#(offset, indeks, velicina) = offset + indeks*velicina

_main:

    movl $niz, %eax
    movl $0, %ebx
    movl $0, %ecx                 #moramo da stavimo da je 0 jer nadodajemo u njega

petlja:
    addl (%eax, %ebx, 4), %ecx    #nadodajemo u ecx, a mogli smo samo da stavimo u ecx i da nadodajemo na promenjivu npr zbir
    incl %ebx
    cmpl $6, %ebx                 #6 je duzina niza, tj maksimalni indeks
    jbe petlja

    movl %ecx, zbir
                                  #ceo zadatak je mogao da se odradi i sa promenljivim, npr da stavim maxindeks = .long 6, indeks: .long 0
    xorl %eax, %eax
    ret
