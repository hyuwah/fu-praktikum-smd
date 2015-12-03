;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH25.ASM (COUNTER1)
; Desc  : Pencacah dengan counter 0 mode 2
;         Kapanpun nibble bawah (TL0) pencacah overflow,
;         nibble atas (TH0) akan disalin ke nibble bawah (TL0)
; Input : P3.4 masukkan pencacah
; Output: 7Seg(P1)
;-------------------------------------------------------------------

  setb T0         ;menyiapkan T0 sebagai masukkan
  mov Tmod,#86h   ;konfigurasi counter 0 mode 2
  mov TH0,#0      ;nilai reload
  setb TR0        ;menyalakan counter 0
  mov b,#0        ;nilai cacahan awal
  mov a,b         ;isi a dengan b
  lcall display   ;ambil pola tampilan
  mov p1,a        ;tampilkan digit
  mov a,b         ;mengambil nilai cacahan lagi

loop:
  mov a,TL0       ;mengambil nilai cacahan dar TL0
  anl a,#0Fh      ;modulus 0Fh
  xrl a,b         ;membandingkan dengan nilai cacahan sekarang
  jz loop         ;ulang jika sama

  inc b           ;jika tak sama cacah b
  anl b,#0Fh      ;modulus 0Fh
  mov a,b
  lcall display
  mov p1,a
  mov a,b

  mov a,TH0       ;mengisi a dengan nibble atas counter
  mov a,TL0       ;mengisi a dengan nibble bawah counter
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
