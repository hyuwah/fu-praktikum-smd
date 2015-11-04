;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH12.ASM
; Desc  : Menampilkan digit 1234 dari tabel ke 4-display segmen
; Input : -
; Output: 4-display segmen di P2
;--------------------------------------------------------------------

cseg at 0

digit:  mov R0, #4              ; Menentukan pengulangan 4 kali
        mov dptr, #tabel        ; mengambil alamat tabel
ulang:  mov A, R0
        dec A
        movc A, @A+dptr         ; mengambil tampilan dari tabel
        mov P2, A               ; mengirimkan digi ke P2
        call tunda              ; tunda
        djnz R0, ulang          ; ulang ke-4 digit tampilan
        jmp digit               ; ulang ke awal

tunda:  mov R7, #0
        djnz R7, $
        ret

tabel: db 01h, 12h, 23h, 34h    ; tabel digit
; Jika bcd (biasa) tak support multi 7 segment diganti :
; 11h, 22h, 43h, 84h
; MSB: 1111b LSB: BCD
; MSB: 8421d LSB: BCD
end
