#program za racunanje izraza (A+B)-(C+D)-(E+F)
.section .text
.global _main

_main:
    movl $5, %eax
    movl $10, %ebx
    addl %eax, %ebx #zbir (A+B) se nalazi u ebx, eax nam je slobodan

    movl $15, %eax
    movl $20, %ecx
    addl %eax, %ecx #(C+D) se nalazi u ecx, eax je slobodan opet

    movl $25, %eax
    movl $30, %edx
    addl %eax, %edx # (E+F) u edx

    subl %ecx, %ebx
    subl %edx, %ebx

    xorl %eax, %eax
    ret
