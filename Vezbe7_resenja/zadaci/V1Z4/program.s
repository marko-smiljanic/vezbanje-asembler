#Zadatak 4, prema pseudokodu na slajdu 14
.section .text
.global _main

_main:
    movl $12, %eax
    movl $3, %ebx
    movl $1, %ecx
    subl %ecx, %ebx     #b-c
    addl %ebx, %eax     #a + (b-c)

    cmpl $10, %eax
    jbe false           #prvi deo AND-a nije tacan, ceo izraz vraca false, u suprotnom se sekvencijalno dalje izvrsava program

    cmpl $15, %eax
    jae false           #drugi deo izraza nije tacan, ceo izraz je false

    movl $12, %eax       #ukoliko nije uradjen ni prvi ni drugi skok, oba dela izraza su tacna (jer smo proveravali suprotno kao uslov za skok)
    movl $3, %ebx
    addl %ebx, %eax
    addl $15, %eax
    jmp kraj            #zavrsili smo deo koda za false, moramo preskociti deo koda za true

false:
    movl $3, %ebx
    movl $1, %ecx
    subl %ecx, %ebx
    addl %ebx, %eax     #u eax se nalazi prethodni zbir, ponovo dodamo b-c na to

kraj:
    xorl %eax, %eax
    ret
