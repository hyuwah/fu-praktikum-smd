;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH3.ASM
; Desc  : Counter P1 dari 0 hingga 255 dengan Delay
; Input : -
; Output: LED P1
;-------------------------------------------------------------------------------

mulai:  mov R7, #255  ; Menyiapkan nilai maksimum cacahan
        mov a, #0     ; Mengondisikan a=0

nyala:  mov P1, a     ; Menampilkan nilai a ke P1
        lcall delay   ; Memanggil rutin delay
        inc a         ; Increment a + 1
        djnz R7, nyala; jika a < 255 lompat ke nyala dan tampilkan a
        jmp mulai     ; jika a = 255 lompat ke mulai

delay:  mov R0, #0
        mov R1, #0
wait:   djnz R0, wait
        djnz R1, wait
        ret
end