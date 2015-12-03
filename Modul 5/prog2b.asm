;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH24.ASM (PROG2B)
; Desc  : Mencacah 7Seg dengan timer sebagai tunda
; Input : -
; Output: 7Seg(P1)
;-------------------------------------------------------------------

scount equ 9Ah

  mov tmod,#80h   ;Pilih timer/counter sebagai timer 0 mode 0
  setb TR0        ;nyalakan timer (saat ini timer di TL0..
                  ;..dan TH0 mencacah dari 0 - 8192)
  mov b,#0        ;nilai cacahan awal
  mov r7,#scount  ;counter-nya software
  mov a,b         ;isi a dengan b
  lcall display   ;mengambil pola tampilan
  mov P2,a        ;menampilkan digit
  mov a,b         ;mengambil nilai cacahan

loop:
  jnb tf0,loop    ;ulang terus hingga timer overflow
  clr tf0         ;clear overflow flag
  djnz r7,loop    ;kurangi counter software, ulang hingga 0

  mov r7,#scount  ;reset nilai counter software
  inc b           ;cacah b ketika counter software overflow
  anl b,#0fh      ;modulus 0fh
  mov a,b         ;isi a dengan b
  lcall display   ;mengambil pola tampilan
  mov P2,a        ;menampilkan digit
  mov a,b         ;isi a dengan nilai cacahan sekarang
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
