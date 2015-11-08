;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH15.ASM Penyesuaian Rangkaian Proteus
; Desc  : Menampilkan karakter A ke display matriks 7x5
; Input : -
; Output: Display matriks 7x5
;--------------------------------------------------------------------

cseg at 0

mulai:

mov P1,#00001b  ; mengaktifkan kolom ke-1
mov a,#0  ; pilih baris ke- 1
call ambilbaris ; mengambil data baris ke-1
mov p2,a  ; menyalakan baris-1 ke port-2
call tunda  ; tahan tampilan
mov p2,#0 ; padamkan baris ke 1

mov P1,#00010b  ; mengaktifkan kolom ke-2
mov a,#1  ; pilih baris ke- 2
call ambilbaris ; mengambil data baris ke-2
mov p2,a  ; menyalakan baris-2 ke port-2
call tunda  ; tahan tampilan
mov p2,#0 ; padamkan baris ke 2

mov P1,#00100b  ; mengaktifkan kolom ke-3
mov a,#2  ; pilih baris ke- 3
call ambilbaris ; mengambil data baris ke-3
mov p2,a  ; menyalakan baris-3 ke port-2
call tunda  ; tahan tampilan
mov p2,#0 ; padamkan baris ke 3

mov P1,#01000b  ; mengaktifkan kolom ke-4
mov a,#3  ; pilih baris ke-4
call ambilbaris ; mengambil data baris ke-4
mov p2,a  ; menyalakan baris-4 ke port-2
call tunda  ; tahan tampilan
mov p2,#0 ; padamkan baris ke 4

mov P1,#10000b  ; mengaktifkan kolom ke-5
mov a,#4  ; pilih baris ke- 5
call ambilbaris ; mengambil data baris ke-5
mov p2,a  ; menyalakan baris-5 ke port-2
call tunda  ; tahan tampilan
mov p2,#0 ; padamkan baris ke 5

jmp mulai

tunda:  mov r1,#0
  mov r2,#35

wait:   djnz r1,wait
  djnz r2,wait
  ret

ambilbaris:
  add a,#2d
  movc a,@a+pc
  cpl a
  ret
  db 7ch, 12h, 11h, 12h, 7ch
end
