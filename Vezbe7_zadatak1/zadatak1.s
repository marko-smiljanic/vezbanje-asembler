.section .data
.section .text
.global _main

#napisati program za sabiranje 2 broja, prvi je u registru eax, drugi u ebx, rezultat smestiti u ecx

_main:
    movl $10, %eax
    movl $20, %ebx
    addl %eax, %ebx

    movl %ebx, %ecx

    ret

