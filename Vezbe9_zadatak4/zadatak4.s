.section .data
niz: .long 2, 15, 3, 6, 7, 19, 23, 16, 12, 9, 8
broj_parnih: .long 0
.section .text
.global _main

#Dat je niz: [2, 15, 3, 6, 7, 19, 23, 16, 12, 9, 8]
#Izračunati broj parnih brojeva u nizu

_main:

    movl $niz, %eax   #adresa niza
    movl $0, %ebx     #indeks
    movl $0, %ecx     #za smestanje pojedinacnih vrednosti iz niza


ponovo:
    movl (%eax, %ebx, 4), %ecx

provera:
    cmpl $2, %ecx
    jb rezultat_provere
    subl $2, %ecx
    jmp provera

rezultat_provere:
    cmpl $1, %ecx
    je neparan         #ako je neparan skace na labelu neparan i nece se izvrsavati povecanje broja parnih

    incl broj_parnih   #kao else

neparan:               #ako je neparan nece se odraditi nista, a indeks svakako moramo da povecamo
    incl %ebx
    cmpl $10, %ebx     #poredimo da li je dosao do poslednjeg broja u nizu, ako nije idemo ponovo
    jbe ponovo



    xorl %eax, %eax
    ret
