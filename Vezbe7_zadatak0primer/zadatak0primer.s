.section .data
.section .text
.global _main

#sabiranje, oduzimanje dva broja i xor-ovanje brojeva
_main:
    movl $10, %eax    #stavljamo broj u registar
    movl $20, %ebx

    addl %eax, %ebx   #saberi brojeve iz eax i ebx i u ebx stavi rezultat
    sub %eax, %ebx    #oduzmi od ebx eax i smesti u ebx(od drugog se oduzima prvi i stavlja u drugi)

    xorl %eax, %eax   #broj xor-ovan sa sami sobom vraca 0
    ret               #izadji iz ovog podprograma(slicno kao return)
