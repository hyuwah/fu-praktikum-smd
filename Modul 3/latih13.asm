;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH13.ASM
; Desc  : Menampilkan cacahan digit ke 4-display segmen
; Input : -
; Output: 4-display segmen di P2
;--------------------------------------------------------------------

cseg at 0

seg0 equ 30h
seg1 equ 31h
seg2 equ 32h
seg3 equ 33h

mulai:  mov seg0, #0            ; mengisi digit ke-1 = 0
        mov seg1, #10h          ; mengisi digit ke-2 = 0
        mov seg2, #20h          ; mengisi digit ke-3 = 0
        mov seg3, #30h          ; mengisi digit ke-4 = 0

lagi:   mov R0, #01Fh
sl:     call digit
        djnz R6, sl               ; menunda tampilan

        inc seg3                  ; menaikan digit ke-4
        mov a, #3Ah               ; mengambil digit akhir dari RAM
        cjne a, seg3, sudah       ; tampilan hingga 9
        mov seg3, #30h

        inc seg2                  ; menaikan digit ke-3
        mov a, #2Ah               ; mengambil digit akhir dari RAM
        cjne a, seg2, sudah       ; tampilan hingga 9
        mov seg2, #20h

        inc seg1                  ; menaikan digit ke-2
        mov a, #1Ah               ; mengambil digit akhir dari RAM
        cjne a, seg1, sudah       ; tampilan hingga 9
        mov seg1, #10h

        inc seg0                  ; menaikan digit ke-1
        mov a, #0Ah               ; mengambil digit akhir dari RAM
        cjne a, seg0, sudah       ; tampilan hingga 9
        mov seg0, #00h

sudah:  jmp lagi

digit:  mov R0, #4
        mov R1, seg3
ulang:  mov P2, @R1
        dec R1
        call tunda
        djnz R0, ulang
        ret
tunda:  mov R7, #0
        djnz R7, $
        ret

end
