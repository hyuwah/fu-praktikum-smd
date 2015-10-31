;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH14.ASM
; Desc  : Menampilkan digit dari keypad ke 4-display segmen
; Input : Keypad P3
; Output: 4-display segmen di P2
;--------------------------------------------------------------------

seg0 equ 30h
seg1 equ 31h
seg2 equ 32h
seg3 equ 33h

kbuf equ 3Ch

mulai:  mov seg0, #00h
        mov seg1, #10h
        mov seg2, #20h
        mov seg3, #30h

L0:
        mov lcall display
        lcall ambiltombol         ; ambil bilangan
        cjne a, #FFh, L1
        jmp L0
        cjne a, #10h, L1
        jmp L0
        cjne a, #11h, L1
        jmp L0
L1:
        mov seg0, seg1
        mov seg1, seg2
        mov seg2, seg3
        mov seg3, a
        anl seg0, #0Fh
        anl seg1, #0Fh
        anl seg2, #0Fh
        orl seg1, #10h
        orl seg2, #20h
        orl seg3, #30h
        jmp L0

ambiltombol:                      ; mengambil data dari keypad
        mov P3, #127
        mov a, P3
        cjne a, #127, ada
        mov a, #FFh
        ret
ada:
        call tunda
        mov P3, #127
        mov a, P3
        mov kbuf, a
lepas:
        call display
        mov P3, #127
        mov a, P3
        cjne a, #127, lepas
        lcall konversi
        ret

konversi:
        mov R0, #255
putar:  inc R0
        cjne R0, #12, lanjut
        mov a, #FFh
        ret

lanjut:
        mov a, R0
        add a, #5
        movc a, @a+pc
        cjne a, kbuf, putar
        mov a, R0
        ret

tabel: db 3Dh, 76h, 75h, 73h, 63h, 6Dh, 6Bh, 5Eh, 5Dh, 5Bh, 3Eh, 3Bh

display:
        mov R0, #4
        mov R1, $seg3
ulang:  mov P2, @R1
        dec R1
        call tunda
        djnz R0, ulang
        ret
tunda:  mov R7, #0
        djnz R7, $
        ret

end
