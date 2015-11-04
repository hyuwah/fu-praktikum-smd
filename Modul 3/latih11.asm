;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH11.ASM
; Desc  : Membaca penekanan keypad 4x3
; Input : Keypad di P3
; Output: LED di P1
;         4-display segmen di P2
;--------------------------------------------------------------------

mulai:
        mov P3, #127
        mov A, P3
        mov 30h, A
        mov P1, A
        lcall konversi
        mov P2, A
        jmp mulai

konversi:
        mov R0, #255
putar:
        inc R0
        cjne R0, #12, lanjut
        ret

lanjut:
        mov A, R0
        add A, #5
        movc A, @A+pc
        cjne A, 30h, putar
        mov A, R0
        ret

tabel: db 3Dh, 76h, 75h, 73h, 63h, 6Dh, 6Bh, 5Eh, 5Dh, 5Bh, 3Eh, 3Bh
end
