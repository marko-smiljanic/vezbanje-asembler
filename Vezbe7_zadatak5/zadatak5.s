.section .data
.section .text
.global _main

#Napisati program koji odgovara sledećem pseudokodu:
#z = a – b
#if ( z > 5 and z <10)
#    z = z + 10
#else if ( z > 10 and z < 20)
#   z = z + 5
#else if ( z <= 5)
#    z = z + 15
#else
#   z = z - 20

_main:
    movl $35, %eax
    movl $5, %ebx
    subl %ebx, %eax

    cmpl $5, %eax
    jbe elseif2         #<=5

    cmpl $10, %eax
    jb if               #znamo da nije <=5, odnosno znamo da je >5, ako je >5 i <10...
    je else             #ako je tacno = 10, ne upada ni u jedan uslov, tako da je to else slucaj

    cmpl $20, %eax      #nije <10, niti je =10, odnosno >10 je, proveravamo da li je >= 20 (sto je uslov za else)
    jae else

    addl $5, %eax       #nije else, if niti elseif2, sto znaci da je sigurno prvi elseif uslov, odnosno znamo da je >10 i <20
    jmp kraj

if:
    addl $10, %eax
    jmp kraj

elseif2:
    addl $15, %eax
    jmp kraj

else:
    subl $20, %eax

kraj:
    xorl %eax, %eax
    ret
