;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH18.ASM
; Desc  : Menggerakkan motor stepper maju - mundur
; Input : -
; Output: Motor Stepper P1(0,1,2,3)
;-------------------------------------------------------------------

cseg at 0

waktu equ 5         ; mengatur kecepatan motor

awal:
  mov r3, #100      ;step kanan 100x4=400
  mov r4, #25       ;step kiri 25x4=100

maju:
  mov r2, #4        ; satu loop 4 langkah
  mov a, #08h       ; nilai biner awal 0000 1000b
kanan:
  mov p1, a         ; menggerakkan 1 langkah
  call tunda        ; memanggil tunda
  rr a              ; menggeser ke kanan 1 bit
  djnz r2, kanan    ; ulang sebanyak 4 langkah
  djnz r3, maju     ; ulang sebanyak r3x4 langkah

mundur:
  mov r2, #4        ; satu loop 4 langkah
  mov a, #01h       ; nilai biner awal 0000 0001b
kiri:
  mov p1, a         ; menggerakkan 1 langkah
  call tunda        ; memanggil tunda
  rl a              ; menggeser ke kanan 1 bit
  djnz r2, kiri     ; ulang sebanyak 4 langkah
  djnz r3, mundur   ; ulang sebanyak r3x4 langkah

  jmp awal

tunda:
  mov r0, #waktu
  mov r1, #waktu
tunggu:
  djnz r0, tunggu
  djnz r1, tunggu
  ret
end
