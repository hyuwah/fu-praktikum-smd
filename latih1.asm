;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH1.ASM
; Desc  : Mengirim data ke port 1, 2, dan 3
; Input : -
; Output: LED
;-------------------------------------------------------------------------------

mulai:
  mov P1, #129    ; Menyalin data 129d (1000 0001) ke P1 (immediate)
  mov 0A0h, #8Fh  ; Menyalin data 8Fh (1000 1111) ke P2 (direct)
  mov psw, #08h   ; Memilih Register Bank 1
  mov R1, #0F1h   ; Menyalin data F1h ke Register R1
  mov 0B0h, R1    ; Menyalin nilai dari R1 (1111 0001) ke P3 (direct)
  jmp mulai
end
