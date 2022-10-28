.section .data
.section .text
.global _main

#cmp - poredjenje, poredi drugi sa prvim

#jmp - skok bez uslova,
#je - if equal,
#jne - if not equal,
#ja - if above tj. ako je drugi veci od prvog, *UVEK SE DRUGI POREDI
#jna- if not above, (nije veci, tj. manji ili jednak)
#jb - if below, tj. ako je manji
#jnb - if not below, (nije manji, tj. veci ili jednak)
#jae - if above or equal (veci ili jednak)

#napisati program za sabiranje dva broja, ukoliko je zbir veci od 15 sabere ih opet. Isprobat isa razlicitim vrednostima

_main:
    movl $5, %eax
    movl $2, ebx
    addl %eax, %ebx

    cmpl $15, %ebx   #compare ne menja vrednost registara, poredi se drugi sa prvim

    #ja sabiranje    #ako stavimo da je ebx manje od 15 on opet ide dalje normalno, i ponovce ih sabrati iako nije trebalo, jer svakako ide dalje program
    #jbe kraj        #moze ovako: skoci na kraj ako su manji ili jednaki, u suprotnom SVAKAKO ide dalje na sabiranje
    jna kraj         #bolje napisati ako nisi veci(tj ako si manji ili jednak) preskoci sabiranje i idi na kraj...

                         #*savet: ako treba nesto da se izvrsi, pustimo da se izvrsi ali ogranicimo sa SUPROTNIM uslovom


sabiranje:
    movl $5, %eax
    movl $2, %ecx        #da ne pokvarimo ebx, jer se sve treba ponovo sabrati sa rezultatom koi se nalazi u ebx
    addl %eax, %ecx
    addl %ecx, %ebx

kraj:
    xorl %eax, %eax
    ret

