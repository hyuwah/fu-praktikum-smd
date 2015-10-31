;-------------------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH2.ASM
; Desc  : Baca DIPSWITCH di P1, tampilkan ke P2 dan P3
; Input : DIPSWITCH di P1
; Output: LED P2 dan P3
;-------------------------------------------------------------------------------

mov P1, #255      ; Menyiapkan P1 sebagai input (1111 1111)

mulai:
  mov a, P1       ; Menyalin data input P1 ke a (?)
  mov P2, a       ; Menampilkan data a di P2
  inc a           ; Manipulasi data a + 1
  cpl  a          ; Manipulasi data a dikomplemen
  mov P3, a       ; Menampilkan data a manipulasi ke P3
  sjmp mulai      ; Ulang dari mulai
end