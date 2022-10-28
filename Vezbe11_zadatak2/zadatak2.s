.section .data
niz: .long 3, 1, 0, 15, 2, 19, 4
suma: .long 0
prosek: .long 0
najveci: .long 0
najmanji: .long 0
.section .text
.global _main

#Napisati program koji radi sa nizom brojeva. Program racuna prosecnu, najvecu i najmanju vrednost u
#nizu i zapisuje ih u odgovarajuce promenljive

_main:
    movl $0, %eax   #indeks niza
    movl $0, %ebx   #suma

sumaa:
    addl niz(, %eax, 4), %ebx
    incl %eax
    cmpl $6, %eax
    jbe sumaa
    movl %ebx, suma    #nisam morao da pravim promenljivu suma, ali je meni lakse zbog kontrole

    movl $0, %eax    #eax sad koristim kao brojac

prosecna_vr:
    subl $7, %ebx
    incl %eax        #u eax je rezultat deljenja
    cmpl $7, %ebx    #mora se staviti poredjenje sa 7 jer moze da ode u puno izvan opsega... znam da radim samo celobrojno deljenje
    jae prosecna_vr
    movl %eax, prosek

###########################resetujem vrednosti za dalje

    movl $0, %eax    #indeks prvog elementa
    movl $0, %ebx
    movl $0, %ecx

    movl niz(, %eax, 4), %ebx     #prvom elementu dodelim vrednost najveceg
    movl %ebx, najveci

najveca_vr:
    incl %eax
    movl niz(, %eax, 4), %ecx

    cmpl najveci, %ecx      #glavna provera(ako je veci od najveceg onda mu dodelim vrednost najveceg)
    jae novi_najveci
    jmp provera             #mogao sam da stavim i jb provera, ali svakako ako ne prodje jump gore ide dalje na sledecu liniju

novi_najveci:
    movl %ecx, najveci

provera:
    cmpl $5, %eax           #proveravam za 5 elemenata jer je prvi element iskoriscen na pocetku
    jbe najveca_vr


###########################resetujem vrednosti za dalje

    movl $0, %eax   #indeks prvog elementa
    movl $0, %ebx
    movl $0, %ecx

    movl niz(, %eax, 4), %ebx
    movl %ebx, najmanji

najmanja_vr:
    incl %eax                  #prvo inkrementujem da ne proveravam broj sa samim sobom
    movl niz(, %eax, 4), %ecx

    cmpl najmanji, %ecx      #glavna provera: ako je manji od najmanjeg
    jbe novi_najmanji
    jmp uslov

novi_najmanji:
    movl %ecx, najmanji

uslov:
    cmpl $5, %eax     #kad bude 5, ide gore, prvo se inkrementira se i svakako odradi za 6ti element
    jbe najmanja_vr



kraj:
    xorl %eax, %eax
    ret
