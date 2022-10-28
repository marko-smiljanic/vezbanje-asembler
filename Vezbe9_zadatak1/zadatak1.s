section .data
niz: .long 1, 10, 15, 25   #indeks ide od 0
section.text
global _main

# INDIREKTNO ADRESIRANJE

#Dat je niz brojeva:
#– niz: .long 1, 10, 15, 25
#Koristeći indirektno adresiranje, pristupiti
#3. elementu ovog niza


_main:

    movl $niz, %eax    # $niz je adresa u memoriji, koju prebacujemo u registar
    addl $8, %eax      # elementima niza pristupamo tako sto za svaki sledeci el dodajemo na adresu niza broj 4 (jer long zauzima 4 bajta u memoriji)
    movl (%eax), %ebx  # (%eax) - idi na adresu i procitaj sta se tamo nalazi, i na kraju u ebx smestamo rezultat
                       # dodaje se 8 na adresu, 2 * 4 = 8. 2 je indeks, 4 je velicina jednog elementa niza u byte-ovima.
    xorl %eax, %eax
    ret
