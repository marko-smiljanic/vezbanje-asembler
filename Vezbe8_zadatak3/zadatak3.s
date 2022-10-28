.section .data
broj1: .long 30
broj2: .long 3
zbir: .long 0
razlika: .long 0
proizvod: .long 0
kolicnik: .long 0
.section .text
.global _main

#Napisati program koji ima sledeće promenljive
#– prvi_broj
#– drugi_broj
#– zbir
#– razlika
#– proizvod
#– kolicnik
#Program za dva navedena broja računa njihov zbir, razliku, proizvod i količnik(celobrojni)

_main:

    movl broj1, %eax   #sabiranje
    addl broj2, %eax
    movl %eax, zbir

    movl broj1, %eax     #oduzimanje
    subl broj2, %eax
    movl %eax, razlika

    movl broj1, %eax    #mnozenje
    movl broj2, %ebx
    movl $0, %ecx       #brojac

mnozenje:
    incl %ecx
    addl %eax, proizvod
    cmpl %ebx, %ecx
    jb mnozenje

    movl broj1, %eax   #deljenje
    movl broj2, %ebx
    movl $0, %ecx      #brojac(brojac sam mogao napraviti kao i posebnu promenjljivu)

deljenje:
    incl %ecx
    subl %ebx, %eax   #moglo je i sa -incl %ecx  -addl %ebx, %ebx  -cmpl %ebx, %eax  -ja deljenje  -movl %ecx, kolicnik  ---ne ide jae, jer ako je equal svakako se odradi korak++ i ide dalje
    cmpl $0, %eax
    ja deljenje
    movl %ecx, kolicnik


kraj:
    xorl %eax, %eax
    ret
