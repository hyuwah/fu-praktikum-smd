;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH8.ASM
; Desc  : Menampilkan digit hexa 0 hingga F ke P1
;         PB ditekan pencacah bekerja
;         PB dilepas pencacah berhenti
; Input : PB di P3.0
; Output: 7 segment
;-------------------------------------------------------------------------------

        setb P3.0           ; mengondisikan PB sebagai input
        mov b, #0h          ; mengondisikan awal b=0
  
        mov a, b            ; menyalin isi b ke a
        lcall tampil        ; memanggil rutin tampil
        mov P1, a           ; mengirim nilai a ke P1
ulang:
        jb P3.0, ulang      ; looping disini hingga PB ditekan
PBtekan:
        jnb P3.0, PBtekan   ; looping disini hingga PB dilepas
        lcall tunda         ; memanggil rutin tunda
        inc b               ; cacah b
        anl b, #0Fh         ; meng-AND-kan b dengan 0Fh
        mov a, b            ; menyalin nilai b ke a
        lcall tampil        ; memanggil rutin tampil
        mov P1, a           ; mengirim isi register a ke P1
        sjmp ulang          ; lompat ke ulang

tunda:
        mov R0, #0
        mov R1, #0
tunggu:
        djnz R0, tunggu
        djnz R1, tunggu
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