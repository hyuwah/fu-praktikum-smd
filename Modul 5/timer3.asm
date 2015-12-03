;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH28.ASM (TIMER3)
; Desc  : Timer 1 sekon/999424us (mode 2)
;         Timer 0 8bit auto diulang 256-134 kali (r6 & r7)
;         tidak termasuk header program
; Input : P3.4 masukkan pencacah
; Output: 7Seg(P1)
;-------------------------------------------------------------------

scountL equ 0h      ;nilai cacah nibble bawah
scountH equ 10h     ;nilai cacah nibble atas
reload equ 86h      ;nilai reload TL0 di TH0

   mov TMOD,#82h    ;konfigurasi timer 0 di mode 2
   setb TR0         ;aktifkan timer 0
   mov b,#0
   mov r6,#scountL  ;pencacah software nibble bawah
   mov r7,#scountH  ;pencacah software nibble atas

   mov a,b
   lcall display
   mov P1,a
   mov a,b

loop:
   jnb TF0,loop     ;ulang hingga timer 0 selesai
   clr TF0          ;clear flag overflow timer 0
   djnz r6,loop     ;kurangi pencacah software hingga 0
   mov r6,#scountL  ;mereset pencacah software
   djnz r7,loop     ;kurangi pencacah software hingga 0
   mov r7,#scountH  ;mereset pencacah software
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
