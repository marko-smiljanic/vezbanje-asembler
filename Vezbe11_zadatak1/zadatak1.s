.section .data
broj1: .long 8
broj2: .long 3
prvi_na_kvadrat: .long 0
drugi_na_kvadrat: .long 0
prvi_na_drugi: .long 0
.section .text
.global _main

#Napisati program koji u data sekciji ima definisane dve promenljive, prvi i drugi broj. Program racuna
#kvadrat prvog broja, kvadrat drugog broja, i ”prvi broj na drugi”(stepen prvog broja gde je eksponent
#drugi broj). Rezultate tih raccunanja zapisati kao promenljive.

_main:
    movl $0, %eax           #suma(tj. kvadrat broja)
    movl $0, %ebx           #brojac

kvadrat_prvog:
    addl broj1, %eax
    incl %ebx
    cmp %ebx, broj1
    ja kvadrat_prvog

    movl %eax, prvi_na_kvadrat

    movl $0, %eax              #resetujem vrednosti da bih ih koristio i dalje
    movl $0, %ebx

kvadrat_drugog:
    addl broj2, %eax
    incl %ebx
    cmpl %ebx, broj2
    ja kvadrat_drugog

    movl %eax, drugi_na_kvadrat    #cuvanje rezultata u promenljivu

    ###################

    cmpl $1, broj2     #stavljam mogucnost i ako se stavi da je broj2 == 1, jer ako ne stavim on ce svakako odraditi kvadriranje, a 8**1 nije 64 (ili ce izbaciti gresku)
    je broj2_je_1

    movl $0, %eax         #ponovo resetujem da mogu dalje da koristim
    movl $0, %ebx
    movl $0, %ecx         #novi brojac za brojanje stepenovanja

    movl broj1, %edx
    movl %edx, prvi_na_drugi     #prvi broj stavljam u promenljivu jer cu morati da u njoj cuvam vrednost

    movl broj2, %edx
    subl $2, %edx             #moram od drugog broja da oduzmem 2, jer se svakako kvadriranje izvrsi (znaci ostaje da se odradi jos broj2 - 2 stepenovanja)

prvibr_na_drugi:
    addl prvi_na_drugi, %eax
    incl %ebx
    cmpl %ebx, broj1
    ja prvibr_na_drugi

    movl %eax, prvi_na_drugi   #cuvam rezultat u promenljivu (rezultat moze da se cuva samo iz registra u promenljivu, ne moze iz promenljive u promenljivu)
    movl $1, %ebx              #resetujem brojac na 1, jer je prvi sledeci korak posle kvadiranja broj + broj (a ne broj + 0 kao na pocetku iteracije...znaci, posle prve iteracije, u eax je kvadrat tog broja a ne 0 kao a pocetku iteracije)

    incl %ecx
    cmpl %ecx, %edx
    jae prvibr_na_drugi       #stavljam ae jer npr. ako je broj2 == 3 (a 3-2 == 1), da odradi tacno jos jednom

    jmp kraj                      #da bi preskocilo petlju za broj2 == 1

broj2_je_1:
    movl broj1, %eax
    movl %eax, prvi_na_drugi     #prvi na drugi je taj broj ako je eksponent 1(tj. broj2 == 1)


kraj:
    xorl %eax, %eax
    ret
