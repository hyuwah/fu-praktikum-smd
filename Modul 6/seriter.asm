;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH30.ASM (SERITER)
; Desc  : Mennerima data serial 0 - 255, baudrate 1200
; Input : Serial pin P3.0 & P3.1
; Output: P1
;-------------------------------------------------------------------

mulai:
  mov scon, #52h      ; aktifkan port serial mode 1
  mov tmod, #20h      ; timer 1 mode 2 (auto reload)
  mov th1, #-26       ; nilai reload untuk baudrate 1200
  setb tr1            ; aktifkan timer 1

kirim:
  clr ri
  mov P1, sbuf        ; terima data dari sbuf disimpan ke P1
  jmp kirim
  end
