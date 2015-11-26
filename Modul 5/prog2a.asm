;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH23.ASM (PROG2A)
; Desc  : Mencacah 7Seg menggunakan uC sebagai counter 0 mode 0
; Input : P3.4 masukkan pencacah
; Output: 7Seg(P1)
;-------------------------------------------------------------------

  setb T0       ;T0 sebagai input
tinggi:
  mov tmod,#0ch ;(0000 1100) memilih timer/counter 0
                ;sebagai counter 0 mode 0
  setb TR0      ;mengaktifkan counter 0

  mov b,#0      ;nilai cacahan awal
  mov a,b       ;isi a dengan cacahan awal
  lcall display ;mengambil pola tampilan
  mov P1,a      ;menampilkan digit
  mov a,b       ;ambil nilai cacahan awal
loop:
  mov a,TL0     ;mengambil nilai counter
  anl a,#0fh    ;modulus 0fh
  xrl a,b       ;membandingkan nilai a dengan b
  jz loop       ;jika a=b lompat ke loop ambil nilai TL0

  inc b         ;jika tak sama, cacah b
  anl b,#0fh    ;modulus 0fh
  mov a,b       ;isi a dengan b
  lcall display ;mengambil pola tampilan
  mov P1,a      ;menampilkan digit
  mov a,b       ;ambil nilai cacahan
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
