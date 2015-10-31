;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH15.ASM
; Desc  : Menampilkan karakter A ke display matriks 7x5
; Input : -
; Output: Display matriks 7x5
;--------------------------------------------------------------------

cseg at 0

mulai:
        mov P1,#1Eh     ; mengaktifkan kolom ke-1
        mov a,#0        ; pilih baris ke- 1
        call ambilbaris ; mengambil data baris ke-1
        mov p2,a        ; menyalakan baris-1 ke port-2
        call tunda      ; tahan tampilan
        mov p2,#0       ; padamkan baris ke 1

        mov P1,#1Dh     ; mengaktifkan kolom ke-2
        mov a,#0        ; pilih baris ke- 2
        call ambilbaris ; mengambil data baris ke-2
        mov p2,a        ; menyalakan baris-2 ke port-2
        call tunda      ; tahan tampilan
        mov p2,#0       ; padamkan baris ke 2

        mov P1,#1Bh     ; mengaktifkan kolom ke-3
        mov a,#0        ; pilih baris ke- 3
        call ambilbaris ; mengambil data baris ke-3
        mov p2,a        ; menyalakan baris-3 ke port-2
        call tunda      ; tahan tampilan
        mov p2,#0       ; padamkan baris ke 3

        mov P1,#17h     ; mengaktifkan kolom ke-4
        mov a,#0        ; pilih baris ke-4
        call ambilbaris ; mengambil data baris ke-4
        mov p2,a        ; menyalakan baris-4 ke port-2
        call tunda      ; tahan tampilan
        mov p2,#0       ; padamkan baris ke 4

        mov P1,#0Fh     ; mengaktifkan kolom ke-5
        mov a,#0        ; pilih baris ke- 5
        call ambilbaris ; mengambil data baris ke-5
        mov p2,a        ; menyalakan baris-5 ke port-2
        call tunda      ; tahan tampilan
        mov p2,#0       ; padamkan baris ke 5

tunda:  mov r7,#0
        djnz r7, $
        ret

ambilbaris:
        inc a
        movc a, @a+pc
        ret
        db 7ch, 12h, 11h, 12h, 7ch
end
