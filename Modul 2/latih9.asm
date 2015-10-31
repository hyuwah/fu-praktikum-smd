;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH9.ASM
; Desc  : Menampilkan digit hexa 0 hingga F ke P1
;         Cacah naik
; Input : PB di P3.0 (toggle)
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

tekan:
        jb P3.0, tes_on     ; jika PB tak ditekan lompat ke tes_on
        cpl c               ; jika PB ditekan kopmlemenkan c
tekan1: jnb P3.0, tekan1    ; looping disini hingga PB dilepas
tes_on: jc delay            ; jika c HIGH lompat ke delay
        jmp tekan           ; terus baca PB jika tak ditekan

delay:
        mov R0, #200
        mov R1, #200
tunggu:
        djnz R0, tunggu
        djnz R1, tunggu
        inc b
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