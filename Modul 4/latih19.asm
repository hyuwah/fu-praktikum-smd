;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH19.ASM
; Desc  : Menggerakkan motor DC dengan metoda PWM
; Input : PB di P0(0,1,2)
; Output: Motor DC P1(0)
;-------------------------------------------------------------------

T_UP equ 30h
T_DN equ 31h
TB0 BIT P0.0
TB1 BIT P0.1
TB2 BIT P0.2

cseg at 0
awal:
  mov T_UP, #07fh       ;hi cycle counting
  mov T_DN, #07fh       ;lo cycle counting

ulang:
  anl T_UP, #0ffh
  anl T_DN, #0ffh

  setb P1.0             ;make hi cycle
  mov r0, T_UP          ;hold it
  djnz r0, $

  clr P1.0              ;make lo cycle
  mov r0, T_DN          ;hold it
  djnz r0, $

  jb TB0, L0
  mov r1, 0fh
  djnz r1, $            ;debouncing delay
  jb TB0, L0            ;check consistency
  jnb TB0, $            ;wait until released

  inc T_UP              ;use TB0 to increase pwm duty cycle
  dec T_DN              ;lower speed and then turning opposite dir

L0:
  jb TB1, L1
  mov r1, 0fh
  djnz r1, $
  jb TB1, L1
  jnb TB1, $

  dec T_UP            ;use TB1 to lower pwm duty cycle
  inc T_DN            ;lower speed and then turning opposite dir

L1:
  jb TB2, L2
  mov r1, 0fh
  djnz r1, $
  jb TB2, L2
  jnb TB2, $

  mov T_UP, #07fh     ;use TB2 to stop
  mov T_DN, #07fh     ;50% duty cycle made motor stop

L2:
  jmp ulang

end
