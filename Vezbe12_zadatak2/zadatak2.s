.section .data
text1: .string "there is the cat on the tree\0"
text2: .string "                       "
.section .text
.global _main

#Kreirati program koji kao promenljivu ima string "there is the cat on the tree".
#Potrebno je zameniti svaku rec "the" sa "a". Rezultujuci string treba da bude "there is a cat on a tree".


_main:

    movl $text1, %eax
    movl $text2, %ebx

ponovo:
    cmpb $'t', (%eax)
    je uslov1

    movb (%eax), %ecx
    movb %ecx, (%ebx)

    jmp azuriranje

uslov1:
    incl %eax
    cmpb $'h', (%eax)
    je uslov2

    decl %eax          #vrati se gore i ubaci i to slovo, jer ako ne prodje uslov moram se vracati gore i ubacivati sva slova od pocetka

    movb (%eax), %ecx      #mozda sam mogao i rucno pisati movb $'t', %ecx ;;; movb %ecx, (%ebx)
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)

    jmp azuriranje

uslov2:
    incl %eax
    cmpb $'e', (%eax)
    je uslov3

    subl $2, %eax

    movb (%eax), %ecx
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)

    jmp azuriranje

uslov3:
    incl %eax
    cmpb $' ', (%eax)
    je stavi_a

    subl $3, %eax         #ako posle slova e nije razmak, onda se vrati gore i da ubacuje skroz od slova t (smanjim adresu do adrese slova t)

    movb (%eax), %ecx
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)
    incl %ebx

    incl %eax
    movb (%eax), %ecx
    movb %ecx, (%ebx)

    jmp azuriranje


azuriranje:
    incl %ebx
    incl %eax

provera:
    cmpb $0, (%eax)  #poredim da li se 0 nalazi na poziciji eax
    je kraj
    jmp ponovo


stavi_a:
    movb $'a', (%ebx)
    incl %ebx
    movb $' ', (%ebx)
    jmp azuriranje


kraj:
    xorl %eax, %eax
    ret
