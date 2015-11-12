;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH20.ASM
; Desc  : Menyalakan lampu dengan relay menggunakan metoda polling
; Input : PB di P3(0/nyala,1/padam,2/kedip)
; Output: Relay/Lampu
;-------------------------------------------------------------------

waktu equ 15            ; inisialisasi waktu

  mov p3, #255          ; menyiapkan p3 sebagai input
  mov p1, #0            ; Lampu mati di awal
tekan:
  jnb P3.0, nyala       ; polling p3.0
  jnb P3.1, mati        ; polling p3.1
  jnb P3.0, kedip       ; polling p3.2
  jmp tekan             ; terus baca ketiga PB

nyala:
  jnb P3.0, $           ; tunggu P3.0 dilepas
  setb P1.0             ; nyalakan lampu
  jmp tekan

mati:
  jnb P3.1, $           ; tunggu P3.1 dilepas
  clr P1.0              ; matikan lampu
  jmp tekan

kedip:
  jnb P3.2, $           ; tunggu P3.2 dilepas
L0:
  cpl P1.0              ; toggle kan lampu agar berkedip
  lcall tunda           ; memanggil tunda
  mov a, P3
  cjne a, #255, tekan   ; lompat ke tekan bila ada PB yang ditekan
  jmp L0

tunda:
  mov r0, waktu
  mov r1, waktu
tunggu:
  djnz r0, tunggu
  djnz r1, tunggu
ret
end
