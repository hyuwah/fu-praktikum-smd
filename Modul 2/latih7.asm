;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH7.ASM
; Desc  : Menampilkan digit hexa 0 hingga F ke P1
; Input : -
; Output: 7 segment
;-------------------------------------------------------------------------------

        mov b, #0           ; mengondisikan awal b=0
mulai:  
        mov a, b            ; menyalin isi b ke a
        lcall tampil        ; memanggil rutin tampil
        mov P1, a           ; mengirim nilai a ke P1
        lcall tunda         ; memanggil rutin tunda
        inc b               ; cacah b
        anl b, #0Fh         ; meng-AND-kan b dengan 0Fh
        sjmp mulai          ; lompat ke mulai

tunda:
        mov R0, #0
        mov R1, #0
        mov R2, #5
tunggu:
        djnz R0, tunggu
        djnz R1, tunggu
        djnz R2, tunggu
        ret
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