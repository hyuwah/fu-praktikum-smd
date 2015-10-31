;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH6.ASM
; Desc  : Counter P1 dari 0 hingga 255 dengan Delay 
;         Tekan berhenti 
;         Lepas count
; Input : PB1 di P3.0 cacah naik
;         PB2 di P3.1 cacah turun
;         PB3 di P3.2 reset
; Output: LED P1
;-------------------------------------------------------------------------------

mulai:  mov a, #0           ; inisialisasi data awal
        mov P3, #255        ; Menyiapkan P3 sebagai input

nyala:  setb c              ; menyiapkan c pada keadaan HIGH
        mov P1, a           ; Menampilkan nilai a ke P1

delay:  mov R0, #100
        mov R1, #100
wait:   djnz R0, wait
        djnz R1, wait
        
baca_tombol:
        mov c, P3.0         ; baca PB1
        jnc naik            ; lompat ke naik jika PB1 ditekan
        mov c, P3.1         ; baca PB2
        jnc turun           ; lompat ke turun jika PB2 ditekan
        mov c, P3.2         ; baca PB3
        jnc reset           ; lompat ke reset jika PB3 ditekan
        jmp baca_tombol     ; Ulangi baca_tombol

naik:   inc a
        jmp nyala
turun:  dec a
        jmp nyala
reset:  mov a, #0
        jmp nyala
end