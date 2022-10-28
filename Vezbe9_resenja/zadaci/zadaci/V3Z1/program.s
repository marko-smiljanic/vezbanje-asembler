.section .data
niz: .long 1, 10, 15, 25
indeks: .long 2                   #pristupamo 3. elementu ovog niza, indeks krece od 0

.section .text
.global _main

_main:
    movl $niz, %eax                #u eax je sada adresa niza
    addl $8, %eax                  #dodaje se 8 na adresu, 2 * 4 = 8. 2 je indeks, 4 je velicina jednog elementa niza u byte-ovima.
    movl (%eax), %ebx              #dereferenciramo sadrzaj u eax, i smestimo u ebx

    xorl %eax, %eax
    ret

