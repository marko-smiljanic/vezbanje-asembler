#program sabira 2 broja, ukoliko je zbir veci od 15, sabere ih opet
.section .text
.global _main

_main:
    movl $10, %eax
    movl $20, %ebx
    movl $20, %ecx

    addl %eax, %ebx
    cmpl $15, %ebx      #poredimo sadrzaj registra ebx sa 15. Obratiti paznju da i kod cmp operacije mora biti validno odrediste
    jbe kraj            #jbe = jump if below or equal - ukoliko NIJE veci od 15, odnosno manji ili jednak je, skacemo na kraj programa

    addl %eax, %ecx     #ukoliko se skok ne izvrsi, program se izvrsava dalje sekvencijalno, liniju po liniju, tako da ovde sledi deo koda za sabiranje
    addl %ecx, %ebx

kraj:                   #labela sama po sebi ne radi nista, odnosno program se dalje izvrsava
    xorl %eax, %eax
    ret

#Promena uslova sa "ako je veci, izvrsi nesto" na "ukooliko nije veci, nemoj izvrsiti nesto" nije jedini validan nacin resavanja ovog problema, ali zahteva najmanje koda.
#U nastavku sledi zakomentarisano alternativno resenje, bez promene uslova. Resenje se nadovezuje nakon compare operacije (linija 11)

    #ja sabiranje
    #jmp kraj           #moramo uhvatiti slucaj ukoliko ne dodje do skoka, da bismo sprecili izvrsavanje koda za ponovno sabiranje
#sabiranje:
    #addl %eax, %ecx
    #addl %ecx, %ebx
#kraj:
    #xorl %eax, %eax
    #ret
