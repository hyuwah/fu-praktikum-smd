;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH10.ASM
; Desc  : Menampilkan digit hexa 0 hingga F ke P1
;        PB ditekan terus pencacah bekerja
; Input : PB1 di P3.0 cacah naik
;         PB2 di P3.1 cacah turun
;         PB3 di P3.2 reset
; Output: 7 segment
;-------------------------------------------------------------------------------

waktu equ 75

        mov b, #0h          ; mengondisikan awal b=0
        mov P3, #255        ; mengondisikan P3 sebagai input
mulai:
        anl b, #0Fh
        mov a, b            ; menyalin isi b ke a
        lcall tampil        ; memanggil rutin tampil
        mov P1, a           ; mengirim nilai a ke P1
        setb c

delay:
        mov R0, #200
        mov R1, #200
tunggu:
        djnz R0, tunggu
        djnz R1, tunggu

baca_tombol:
        mov c, P3.0         ; baca PB1
        jnc naik            ; lompat ke naik jika PB1 ditekan
        mov c, P3.1         ; baca PB2
        jnc turun           ; lompat ke turun jika PB2 ditekan
        mov c, P3.2         ; baca PB3
        jnc reset           ; lompat ke reset jika PB3 ditekan
        jmp baca_tombol     ; Ulangi baca_tombol

naik:   inc b
        jmp mulai
turun:  dec b
        jmp mulai
reset:  mov b, #0
        jmp mulai

tampil:
        inc a               ; cacah a
        movc a, @a+pc       ; menyalin isi alamat a+pc ke a
        ret                 ; kembali ke pemanggil

        db 3Fh  ; 0
        db 06h  ; 1
        db 5bh  ; 2
        db 4Fh  ; 3
        db 66h  ; 4
        db 6Dh  ; 5
        db 7Dh  ; 6
        db 07h  ; 7
        db 7Fh  ; 8
        db 67h  ; 9
        db 77h  ; a
        db 7Ch  ; b
        db 39h  ; c
        db 5Eh  ; d
        db 79h  ; e
        db 71h  ; f
end