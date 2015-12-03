;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH26.ASM (TIMER1)
; Desc  : Timer 1 sekon/999424us (mode 0)
;         Timer 0 13bit diulang 122 kali (r7)
;         tidak termasuk header program
; Input : P3.4 masukkan pencacah
; Output: 7Seg(P1)
;-------------------------------------------------------------------

scount equ 07Ah

   mov TMOD,#80h    ;konfigurasi timer 0 di mode 0
   setb TR0         ;aktifkan timer 0
   mov b,#0
   mov r7,#scount   ;pencacah software

   mov a,b
   lcall display
   mov P1,a
   mov a,b

loop:
   jnb TF0,loop     ;ulang hingga timer 0 selesai
   clr TF0          ;clear flag overflow timer 0
   djnz r7,loop     ;kurangi pencacah software hingga 0

   mov r7,#scount   ;mereset pencacah software
   inc b

   anl b,#0Fh
   mov a,b
   lcall display
   mov P1,a
   mov a,b
   sjmp loop

display:
  inc a
  movc a,@a+pc
  ret

  db 3fh  ;0
  db 06h  ;1
  db 5bh  ;2
  db 4fh  ;3
  db 66h  ;4
  db 6dh  ;5
  db 7dh  ;6
  db 07h  ;7
  db 7fh  ;8
  db 67h  ;9
  db 77h  ;a
  db 7ch  ;b
  db 39h  ;c
  db 5eh  ;d
  db 79h  ;e
  db 71h  ;f
end
