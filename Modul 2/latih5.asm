;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH5.ASM
; Desc  : Counter P1 dari 0 hingga 255 dengan Delay 
;         PB toggle pseudo ops
; Input : Pushbutton di P3.0 (toggle)
; Output: LED P1
;-------------------------------------------------------------------------------

waktu equ 75                ; inisialisasi waktu
mulai:  mov a, #0           ; Menyiapkan nilai awal cacahan

        setb b.0            ; menyiapkan b.0 pada keadaan HIGH
nyala:  mov P1, a           ; Menampilkan nilai a ke P1

tekan:   jb P3.0, tes_on     ; Bila PB tak ditekan lompat ke tes_on
        cpl b.0             ; Jika PB ditekan komplemenkan b.0
  tekan1: jnb P3.0, tekan1  ; Diam disini hingga PB dilepas kembali
  tes_on:  jb b.0, delay     ; Jika b.0 HIGH lompat ke delay
        jmp tekan           ; Terus baca PB jika tak ditekan

delay:  mov R0, waktu
        mov R1, waktu
wait:   djnz R0, wait
        djnz R1, wait
        
        inc a               ; Increment a +1
        cjne a, #255, nyala ; Jika a<>255, lompat ke nyala
        jmp mulai           ; Jika a=255, lompat ke mulai
end