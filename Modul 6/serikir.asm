;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH29.ASM (SERIKIR)
; Desc  : Mengirimkan data serial 0 - 255, baudrate 1200
; Input : -
; Output: Serial pin P3.0 & P3.1
;-------------------------------------------------------------------

mulai:
  mov scon, #52h      ; aktifkan port serial mode 1
  mov tmod, #20h      ; timer 1 mode 2 (auto reload)
  mov th1, #-26       ; nilai reload untuk baudrate 1200
  setb tr1            ; aktifkan timer 1

dataser:
  mov a, #0           ; nilai data awal = 0

kirim:
  mov sbuf, a         ; kirim data a ke port serial

  mov r0, #0
  mov r1, #0
tunda:
  djnz r0, tunda
  djnz r1, tunda

  inc a
  cjne a, #0, kirim   ; kirim terus hingga 255
  jmp dataser         ; ulang terus
  end
