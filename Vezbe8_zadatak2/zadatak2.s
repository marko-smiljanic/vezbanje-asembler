.section .data
X: .long 10
Y: .long 20
.section .text
.global _main

#Napisati program prema zadatom pseudokodu
#x = 10
#y = 20
#while(x < y)
#   x++

#inc - inkrement++, dec - dekrement-- (samo dodam l- za vrednost long)

_main:

    movl X, %eax
    movl Y, %ebx


petlja:
    incl %eax
    cmp %ebx, %eax
    jb petlja
    #jae kraj  #ne treba jer svakako ako se ne ispuni uslov za skok ide na kraj


kraj:
    xorl %eax, %eax
    ret
