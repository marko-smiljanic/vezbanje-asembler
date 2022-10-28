#Program za sabiranje 2 broja. ecx = eax + ebx
.section .text      #oznacavamo da sledi segment sa programskim kodom
.global _main       #definisemo main labelu

_main:
    movl $10, %eax  #smestamo vrednost 10 u registar eax
    movl $15, %ebx  #smestamo vrednost 15 u registar ebx
    addl %eax, %ebx #sabiramo sadrzaje registara, nakon cega ce se zbir naci u registru ebx
    movl %ebx, %ecx #smestamo zbir u registar ecx

    xorl %eax, %eax #podesavamo vrednost sadrzaja registra eax na 0
    ret

#Za proveru validnosti, postaviti breakpoint u kodu (npr u liniji 11), i pokrenuti program u debug rezimu.
#Program ce se izvrsavati do breakpointa. Kada se zaustavi podesavanje, proveriti stanje registara. U registru ecx treba da se nalazi vrednost 25
#Ukoliko nije prikazano stanje registara, u opcijama Debug->Debugging windows->CPU registers

#Ukoliko ne uspeva build programa, uputstvo za konfiguraciju codeblocks se nalazi na prvim vezbama.
