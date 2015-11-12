;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH17.ASM
; Desc  : Menggerakkan motor stepper
; Input : -
; Output: Motor Stepper P1(0,1,2,3)
;-------------------------------------------------------------------

cseg at 0

mulai:
  mov a, #08h       ;memasang formasi biner 0000 1000b
  mov r3, #4        ;menentukan 4 langkah

putar:
  mov P1, a         ;menggerakkan 1 langkah
  call tunda        ;memanggil tunda
  rr a              ; menggeser bit ke kanan
  djnz r3, putar    ; ulang hingga 4 kali
  jmp mulai         ; ulang lagi 4 langkah selanjutnya

tunda:
  mov r0, #0
  mov r1, #0
tunggu:
  djnz r0, tunggu
  djnz r1, tunggu
  ret
end
