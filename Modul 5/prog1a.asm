;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH21.ASM (PROG1A)
; Desc  : Menampilkan digit hexa 0..F ke P1
;         Menggerakkan motor stepper untuk interupsi ext 1
; Input : Pushbutton, INT1, di P3
; Output: 7Seg(P1) dan Motor Stepper(P2)
;-------------------------------------------------------------------

  org 00h
  ljmp mulai
  org 13h
  ljmp motor

  org 100h
mulai:
  setb it1
  setb ex1
  setb ea
  mov p3,#255
  mov b,#0          ;mengondisikan awal b=0

mulai1:
  mov a,b           ;menyalin isi b ke
  lcall tampil      ;memanggil rutin tampil
  mov P1,a          ;mengirim a ke P1
  lcall tunda       ;memanggil tunda
  inc b             ;mencacah b
  anl b,#0fh        ;membatasi hex b
  sjmp mulai1

motor:  mov r6,#0ah  ;interrupt handler
putar1: mov r7,#04h
        mov a,#08h
putar2: mov p2,a
        lcall tunda
        rr a
        djnz r7,putar2
        djnz r6,putar1
        reti

Tunda:  mov r0,#0
        mov r1,#0
tunggu:
        djnz r0,tunggu
        djnz r1,tunggu
        ret
tampil:
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
