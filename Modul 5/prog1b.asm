;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH22.ASM (PROG1B)
; Desc  : Menggunakan timer 0 di mode 0
; Input : P3.4 masukkan pencacah
; Output: 7Seg(P1)
;-------------------------------------------------------------------

  setb T0       ;menyiapkan T0 sebagai masukkan
  mov Tmod,#84h ;mengonfigurasi timer 0 mode 0
  setb TR0      ;menyalakan timer
  mov b,#0      ;nilai cacahan awal
  mov a,b       ;mengisi a dengan cacahan awal
  lcall display ;mengambil pola tampilan
  mov p1,a      ;menampilkan digit
  mov a,b       ;mengambil nilai cacahan lagi

loop:
  mov a,TL0     ;mengambil nilai cacahan
  anl a,#0Fh    ;modulus 0fh
  xrl a,b       ;membandingkan dengan cacahan skrg
  jz loop       ;ulang jika sama

  inc b         ;jika tak sama naikan cacahan
  anl b,#0Fh    ;modulus 0Fh
  mov a,b       ;isi a dengan nilai cacahan
  lcall display ;mengambil pola tampilan
  mov p1,a      ;menampilkan digit
  mov a,b       ;mengambil nilai cacahan skrg
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
