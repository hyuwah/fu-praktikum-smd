;--------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH11.ASM Penyesuaian
; Desc  : Membaca penekanan keypad 4x3 (7pin)
;         Metode polling dan scanning kolom
; Input : Keypad di P3
; Output: LED di P1
;         4-display segmen di P2
;--------------------------------------------------------------------
;mov P0,#0h/#fh; pada mcu8051ide untuk menyalakan multi 7segmen ca/cc
mulai:
        mov P3, #01111111b  ; penetapan port 3 untuk keypad

polls:  ;metode polling untuk mendeteksi tombol yang ditekan
;scanning kolom 1
  clr p3.0
  setb p3.1
  setb p3.2
  jnb p3.3, dapat   ; tombol 1 (76h)
  jnb p3.4, dapat   ; tombol 4 (6eh)
  jnb p3.5, dapat   ; tombol 7 (5eh)
  jnb p3.6, dapat   ; tombol * (3eh)
  setb p3.0
;scanning kolom 2
  setb p3.0
  clr p3.1
  setb p3.2
  jnb p3.3, dapat   ; tombol 2 (75h)
  jnb p3.4, dapat   ; tombol 5 (6dh)
  jnb p3.5, dapat   ; tombol 8 (5dh)
  jnb p3.6, dapat   ; tombol 0 (3dh)
  setb p3.1
;scanning kolom 3
  setb p3.0
  setb p3.1
  clr p3.2
  jnb p3.3, dapat   ; tombol 3 (73h)
  jnb p3.4, dapat   ; tombol 6 (6bh)
  jnb p3.5, dapat   ; tombol 9 (5bh)
  jnb p3.6, dapat   ; tombol # (3bh)
  setb p3.2
jmp polls ;terus loop sampai dapat tombol yang ditekan

dapat:  mov A, P3   ; Menyalin kondisi P3 saat tombol terdeteksi
        mov 30h, A  ; Menyalin data dari P3 ke register 30h
        mov P1, A   ; Menyalin ke display led
        lcall konversi
        mov P2, A   ; Menyalin A konversi ke display multi 7segmen
        jmp mulai

konversi:
        mov R0, #255  ; Set R0 awal agar dibawah mulai dari 0
putar:
        inc R0
        cjne R0, #12, lanjut  ; Sebelum R0 = 12 loncat ke lanjut
        ret

lanjut:
        mov A, R0
        add A, #5
        movc A, @A+pc       ; proses lookup table
        cjne A, 30h, putar  ; Sebelum A = nilai di 30h, ke putar
        mov A, R0           ; R0 akan berisi 0 - 12, disalin ke A
        ret                 ; kembali ke pemanggilan konversi

tabel: db 3Dh, 76h, 75h, 73h, 6Eh, 6Dh, 6Bh, 5Eh, 5Dh, 5Bh, 3Eh, 3Bh
;perubahan 63h menjadi 6Eh
end

