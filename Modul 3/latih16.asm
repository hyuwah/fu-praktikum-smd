;-------------------------------------------------------------------
; Praktikum SMD 2015
; M.Wahyudin (140310120031)
;
; Name  : LATIH16.ASM
; Desc  : Menampilkan karakter  ke display matriks 7x5 dengan rutin
; Input : -
; Output: Display matriks 7x5
;-------------------------------------------------------------------

Karakter Macro kar,lama
local tampil,baris
  mov r3,lama
tampil:
  clr c
  mov b,kar
  mov r0,#0ffh
  mov r1,#0
  mov dptr,#tabelchar
  mov a,#5
  mul ab

  add a,dpl   ; dptr = base add of char
  mov dpl,a
  mov a,b
  addc a,dph
  mov dph,a
  mov b,#0
  mov r1,#5

baris:
  mov a,r0
  rlc a
  mov p1,a
  mov r0,a
  mov a,b
  movc a,@a+dptr
  mov p2,a
  inc b

  mov r7,#0
  djnz r7,$
  mov p2,#0

  djnz r1,baris
  djnz r3,tampil
Endm

;--------------
; Program  Utama
;---------------
cseg at 0
mulai:
  Karakter #'F',200
  Karakter #'i',200
  Karakter #'s',200
  Karakter #'i',200
  Karakter #'k',200
  Karakter #'a',200
  Karakter #' ',200
  Karakter #'F',200
  Karakter #'M',200
  Karakter #'I',200
  Karakter #'P',200
  Karakter #'A',200
  Karakter #' ',200
  Karakter #'U',200
  Karakter #'N',200
  Karakter #'P',200
  Karakter #'A',200
  Karakter #'D',200

  jmp mulai

tabelchar:
  db 00h, 00h, 00h, 00h, 00h  ;0
  db 7ch, 12h, 11h, 12h, 7ch  ;1
  db 7fh, 41h, 41h, 22h, 1ch  ;2
  db 7ch, 12h, 11h, 12h, 7ch  ;3
  db 7fh, 41h, 41h, 22h, 1ch  ;4
  db 7ch, 12h, 11h, 12h, 7ch  ;5
  db 7fh, 41h, 41h, 22h, 1ch  ;6
  db 7ch, 12h, 11h, 12h, 7ch  ;7
  db 7fh, 41h, 41h, 22h, 1ch  ;8
  db 7ch, 12h, 11h, 12h, 7ch  ;9
  db 7fh, 41h, 41h, 22h, 1ch  ;10
  db 7ch, 12h, 11h, 12h, 7ch  ;11
  db 7fh, 41h, 41h, 22h, 1ch  ;12
  db 7ch, 12h, 11h, 12h, 7ch  ;13
  db 7fh, 41h, 41h, 22h, 1ch  ;14
  db 7ch, 12h, 11h, 12h, 7ch  ;15
  db 7fh, 41h, 41h, 22h, 1ch  ;16
  db 7ch, 12h, 11h, 12h, 7ch  ;17
  db 7fh, 41h, 41h, 22h, 1ch  ;18
  db 7ch, 12h, 11h, 12h, 7ch  ;19
  db 7fh, 41h, 41h, 22h, 1ch  ;20
  db 7ch, 12h, 11h, 12h, 7ch  ;21
  db 7fh, 41h, 41h, 22h, 1ch  ;22
  db 7ch, 12h, 11h, 12h, 7ch  ;23
  db 7fh, 41h, 41h, 22h, 1ch  ;24
  db 7fh, 41h, 41h, 22h, 1ch  ;25
  db 7ch, 12h, 11h, 12h, 7ch  ;26
  db 7fh, 41h, 41h, 22h, 1ch  ;27
  db 7ch, 12h, 11h, 12h, 7ch  ;28
  db 7fh, 41h, 41h, 22h, 1ch  ;29
  db 7fh, 41h, 41h, 22h, 1ch  ;30
  db 7ch, 12h, 11h, 12h, 7ch  ;31
  db 00h, 00h, 00h, 00h, 00h  ;32
  db 00h, 00h, 5fh, 00h, 00h  ;33
  db 00h, 01h, 01h, 00h, 00h  ;34
  db 7ch, 12h, 11h, 12h, 7ch  ;35
  db 7fh, 41h, 41h, 22h, 1ch  ;36
  db 00h, 00h, 5fh, 00h, 00h  ;37
  db 00h, 01h, 01h, 00h, 00h  ;38
  db 7ch, 12h, 11h, 12h, 7ch  ;39
  db 7fh, 41h, 41h, 22h, 1ch  ;40
  db 7ch, 12h, 11h, 12h, 7ch  ;41
  db 7fh, 41h, 41h, 22h, 1ch  ;42
  db 7ch, 12h, 11h, 12h, 7ch  ;43
  db 7fh, 41h, 41h, 22h, 1ch  ;44
  db 7ch, 12h, 11h, 12h, 7ch  ;45
  db 7fh, 41h, 41h, 22h, 1ch  ;46
  db 7fh, 41h, 41h, 22h, 1ch  ;47
  db 3eh, 51h, 49h, 45h, 3eh  ;48 = 0
  db 00h, 42h, 7fh, 40h, 00h  ;49 = 1
  db 46h, 61h, 51h, 49h, 46h  ;50 = 2
  db 22h, 41h, 49h, 49h, 36h  ;51 = 3
  db 18h, 14h, 12h, 7fh, 11h  ;52 = 4
  db 27h, 45h, 45h, 45h, 39h  ;53 = 5
  db 3eh, 49h, 49h, 49h, 32h  ;54 = 6
  db 41h, 21h, 11h, 09h, 07h  ;55 = 7
  db 36h, 49h, 49h, 49h, 36h  ;56 = 8
  db 26h, 49h, 49h, 49h, 3eh  ;57 = 9
  db 7fh, 3eh, 41h, 41h, 3eh  ;58
  db 00h, 42h, 7fh, 40h, 00h  ;59
  db 46h, 61h, 51h, 49h, 46h  ;60
  db 7fh, 3eh, 41h, 41h, 3eh  ;61
  db 00h, 42h, 7fh, 40h, 00h  ;62
  db 46h, 61h, 51h, 49h, 46h  ;63
  db 7fh, 3eh, 41h, 41h, 3eh  ;64
  db 7ch, 12h, 11h, 12h, 7ch  ;65 = A
  db 7fh, 49h, 49h, 49h, 36h  ;66 = B
  db 3Eh, 41h, 41h, 41h, 22h  ;67 = C
  db 7fh, 41h, 41h, 22h, 1ch  ;68 = D
  db 7fh, 49h, 49h, 49h, 41h  ;69 = E
  db 7fh, 09h, 09h, 09h, 01h  ;70 = F
  db 3Eh, 49h, 49h, 49h, 3Ah  ;71 = G
  db 7fh, 08h, 08h, 08h, 7Fh  ;72 = H
  db 00h, 41h, 7Fh, 41h, 00h  ;73 = I
  db 41h, 41h, 41h, 21h, 1Fh  ;74 = J
  db 7fh, 08h, 14h, 22h, 41h  ;75 = K
  db 7fh, 40h, 40h, 40h, 40h  ;76 = L
  db 7Fh, 02h, 04h, 02h, 7Fh  ;77 = M
  db 7fh, 02h, 04h, 08h, 7Fh  ;78 = N
  db 3eh, 41h, 41h, 41h, 3eh  ;79 = O
  db 7fh, 09h, 09h, 09h, 06h  ;80 = P
  db 3eh, 41h, 51h, 21h, 5eh  ;81 = Q
  db 7fh, 09h, 19h, 29h, 46h  ;82 = R
  db 26h, 49h, 49h, 49h, 32h  ;83 = S
  db 01h, 01h, 7fh, 01h, 01h  ;84 = T
  db 3fh, 40h, 40h, 40h, 3fh  ;85 = U
  db 1fh, 20h, 40h, 20h, 1fh  ;86 = V
  db 3fh, 40h, 30h, 40h, 3fh  ;87 = W
  db 63h, 14h, 08h, 14h, 63h  ;88 = X
  db 07h, 08h, 70h, 08h, 07h  ;89 = Y
  db 61h, 51h, 49h, 45h, 43h  ;90 = Z
  db 7ch, 12h, 11h, 12h, 7ch  ;91
  db 7fh, 41h, 41h, 22h, 1ch  ;92
  db 7ch, 12h, 11h, 12h, 7ch  ;93
  db 7fh, 41h, 41h, 22h, 1ch  ;94
  db 7ch, 12h, 11h, 12h, 7ch  ;95
  db 7fh, 41h, 41h, 22h, 1ch  ;96
  db 38h, 44h, 44h, 24h, 78h  ;97 = a
  db 7fh, 48h, 44h, 44h, 38h  ;98 = b
  db 38h, 44h, 44h, 44h, 28h  ;99 = c
  db 38h, 44h, 44h, 48h, 7fh  ;100 = d
  db 38h, 54h, 54h, 54h, 48h  ;101 = e
  db 7ch, 12h, 12h, 02h, 04h  ;102 = f
  db 0ch, 52h, 52h, 52h, 3Eh  ;103 = g
  db 7fh, 04h, 04h, 04h, 78h  ;104 = h
  db 00h, 44h, 7Dh, 40h, 00h  ;105 = i
  db 20h, 40h, 42h, 3Eh, 02h  ;106 = j
  db 00h, 7Fh, 10h, 28h, 44h  ;107 = k
  db 00h, 41h, 7Fh, 40h, 00h  ;108 = l
  db 7Ch, 04h, 78h, 04h, 78h  ;109 = m
  db 7Ch, 08h, 04h, 04h, 78h  ;110 = n
  db 38h, 44h, 44h, 44h, 38h  ;111 = o
  db 7Eh, 12h, 12h, 12h, 0Ch  ;112 = p
  db 00h, 12h, 12h, 12h, 7Eh  ;113 = q
  db 7Ch, 08h, 04h, 04h, 08h  ;114 = r
  db 28h, 54h, 54h, 54h, 28h  ;115 = s
  db 04h, 3Eh, 44h, 44h, 20h  ;116 = t
  db 3Ch, 40h, 40h, 20h, 7Ch  ;117 = u
  db 1Ch, 20h, 40h, 20h, 1Ch  ;118 = v
  db 3Ch, 40h, 30h, 40h, 3Ch  ;119 = w
  db 44h, 28h, 10h, 28h, 44h  ;120 = x
  db 0Eh, 50h, 50h, 50h, 3Eh  ;121 = y
  db 44h, 64h, 54h, 4Ch, 44h  ;122 = z
  db 7ch, 12h, 11h, 12h, 7ch  ;123
  db 7fh, 41h, 41h, 22h, 1ch  ;124
  db 7ch, 12h, 11h, 12h, 7ch  ;125
  db 7fh, 41h, 41h, 22h, 1ch  ;126
  db 7ch, 12h, 11h, 12h, 7ch  ;127
  db 7fh, 41h, 41h, 22h, 1ch  ;128
  db 7ch, 12h, 11h, 12h, 7ch  ;129
  db 00h, 42h, 7fh, 40h, 00h  ;130
  db 7ch, 12h, 11h, 12h, 7ch  ;131
  db 7fh, 41h, 41h, 22h, 1ch  ;132
  db 7ch, 12h, 11h, 12h, 7ch  ;133
  db 7fh, 41h, 41h, 22h, 1ch  ;134
  db 7ch, 12h, 11h, 12h, 7ch  ;135
  db 7fh, 41h, 41h, 22h, 1ch  ;136
  db 7ch, 12h, 11h, 12h, 7ch  ;137
  db 7fh, 41h, 41h, 22h, 1ch  ;138
  db 7ch, 12h, 11h, 12h, 7ch  ;139
  db 00h, 42h, 7fh, 40h, 00h  ;140
  db 7ch, 12h, 11h, 12h, 7ch  ;141
  db 7fh, 41h, 41h, 22h, 1ch  ;142
  db 7ch, 12h, 11h, 12h, 7ch  ;143
  db 7fh, 41h, 41h, 22h, 1ch  ;144
  db 7ch, 12h, 11h, 12h, 7ch  ;145
  db 7fh, 41h, 41h, 22h, 1ch  ;146
  db 7ch, 12h, 11h, 12h, 7ch  ;147
  db 7fh, 41h, 41h, 22h, 1ch  ;148
  db 7ch, 12h, 11h, 12h, 7ch  ;149
  db 00h, 42h, 7fh, 40h, 00h  ;150
  db 7ch, 12h, 11h, 12h, 7ch  ;151
  db 7fh, 41h, 41h, 22h, 1ch  ;152
  db 7ch, 12h, 11h, 12h, 7ch  ;153
  db 7fh, 41h, 41h, 22h, 1ch  ;154
  db 7ch, 12h, 11h, 12h, 7ch  ;155
  db 7fh, 41h, 41h, 22h, 1ch  ;156
  db 7ch, 12h, 11h, 12h, 7ch  ;157
  db 7fh, 41h, 41h, 22h, 1ch  ;158
  db 7ch, 12h, 11h, 12h, 7ch  ;159
  db 00h, 42h, 7fh, 40h, 00h  ;160
  db 7ch, 12h, 11h, 12h, 7ch  ;161
  db 7fh, 41h, 41h, 22h, 1ch  ;162
  db 7ch, 12h, 11h, 12h, 7ch  ;163
  db 7fh, 41h, 41h, 22h, 1ch  ;164
  db 7ch, 12h, 11h, 12h, 7ch  ;165
  db 7fh, 41h, 41h, 22h, 1ch  ;166
  db 7ch, 12h, 11h, 12h, 7ch  ;167
  db 7fh, 41h, 41h, 22h, 1ch  ;168
  db 7ch, 12h, 11h, 12h, 7ch  ;169
  db 00h, 42h, 7fh, 40h, 00h  ;170
  db 7ch, 12h, 11h, 12h, 7ch  ;171
  db 7fh, 41h, 41h, 22h, 1ch  ;172
  db 7ch, 12h, 11h, 12h, 7ch  ;173
  db 7fh, 41h, 41h, 22h, 1ch  ;174
  db 7ch, 12h, 11h, 12h, 7ch  ;175
  db 7fh, 41h, 41h, 22h, 1ch  ;176
  db 7ch, 12h, 11h, 12h, 7ch  ;177
  db 7fh, 41h, 41h, 22h, 1ch  ;178
  db 7ch, 12h, 11h, 12h, 7ch  ;179
  db 00h, 42h, 7fh, 40h, 00h  ;180
  db 7ch, 12h, 11h, 12h, 7ch  ;181
  db 7fh, 41h, 41h, 22h, 1ch  ;182
  db 7ch, 12h, 11h, 12h, 7ch  ;183
  db 7fh, 41h, 41h, 22h, 1ch  ;184
  db 7ch, 12h, 11h, 12h, 7ch  ;185
  db 7fh, 41h, 41h, 22h, 1ch  ;186
  db 7ch, 12h, 11h, 12h, 7ch  ;187
  db 7fh, 41h, 41h, 22h, 1ch  ;188
  db 7ch, 12h, 11h, 12h, 7ch  ;189
  db 00h, 42h, 7fh, 40h, 00h  ;190
  db 7ch, 12h, 11h, 12h, 7ch  ;191
  db 7fh, 41h, 41h, 22h, 1ch  ;192
  db 7ch, 12h, 11h, 12h, 7ch  ;193
  db 7fh, 41h, 41h, 22h, 1ch  ;194
  db 7ch, 12h, 11h, 12h, 7ch  ;195
  db 7fh, 41h, 41h, 22h, 1ch  ;196
  db 7ch, 12h, 11h, 12h, 7ch  ;197
  db 7fh, 41h, 41h, 22h, 1ch  ;198
  db 7ch, 12h, 11h, 12h, 7ch  ;199
  db 00h, 42h, 7fh, 40h, 00h  ;200
  db 7ch, 12h, 11h, 12h, 7ch  ;201
  db 7fh, 41h, 41h, 22h, 1ch  ;202
  db 7ch, 12h, 11h, 12h, 7ch  ;203
  db 7fh, 41h, 41h, 22h, 1ch  ;204
  db 7ch, 12h, 11h, 12h, 7ch  ;205
  db 7fh, 41h, 41h, 22h, 1ch  ;206
  db 7ch, 12h, 11h, 12h, 7ch  ;207
  db 7fh, 41h, 41h, 22h, 1ch  ;208
  db 7ch, 12h, 11h, 12h, 7ch  ;209
  db 00h, 42h, 7fh, 40h, 00h  ;210
  db 7ch, 12h, 11h, 12h, 7ch  ;211
  db 7fh, 41h, 41h, 22h, 1ch  ;212
  db 7ch, 12h, 11h, 12h, 7ch  ;213
  db 7fh, 41h, 41h, 22h, 1ch  ;214
  db 7ch, 12h, 11h, 12h, 7ch  ;215
  db 7fh, 41h, 41h, 22h, 1ch  ;216
  db 7ch, 12h, 11h, 12h, 7ch  ;217
  db 7fh, 41h, 41h, 22h, 1ch  ;218
  db 7ch, 12h, 11h, 12h, 7ch  ;219
  db 00h, 42h, 7fh, 40h, 00h  ;220
  db 7ch, 12h, 11h, 12h, 7ch  ;221
  db 7fh, 41h, 41h, 22h, 1ch  ;222
  db 7ch, 12h, 11h, 12h, 7ch  ;223
  db 7fh, 41h, 41h, 22h, 1ch  ;224
  db 7ch, 12h, 11h, 12h, 7ch  ;225
  db 7fh, 41h, 41h, 22h, 1ch  ;226
  db 7ch, 12h, 11h, 12h, 7ch  ;227
  db 7fh, 41h, 41h, 22h, 1ch  ;228
  db 7ch, 12h, 11h, 12h, 7ch  ;229
  db 00h, 42h, 7fh, 40h, 00h  ;230
  db 7ch, 12h, 11h, 12h, 7ch  ;231
  db 7fh, 41h, 41h, 22h, 1ch  ;232
  db 7ch, 12h, 11h, 12h, 7ch  ;233
  db 7fh, 41h, 41h, 22h, 1ch  ;234
  db 7ch, 12h, 11h, 12h, 7ch  ;235
  db 7fh, 41h, 41h, 22h, 1ch  ;236
  db 7ch, 12h, 11h, 12h, 7ch  ;237
  db 7fh, 41h, 41h, 22h, 1ch  ;238
  db 7ch, 12h, 11h, 12h, 7ch  ;239
  db 00h, 42h, 7fh, 40h, 00h  ;240
  db 7ch, 12h, 11h, 12h, 7ch  ;241
  db 7fh, 41h, 41h, 22h, 1ch  ;242
  db 7ch, 12h, 11h, 12h, 7ch  ;243
  db 7fh, 41h, 41h, 22h, 1ch  ;244
  db 7ch, 12h, 11h, 12h, 7ch  ;245
  db 7fh, 41h, 41h, 22h, 1ch  ;246
  db 7ch, 12h, 11h, 12h, 7ch  ;247
  db 7fh, 41h, 41h, 22h, 1ch  ;248
  db 7ch, 12h, 11h, 12h, 7ch  ;249
  db 00h, 42h, 7fh, 40h, 00h  ;250
  db 7ch, 12h, 11h, 12h, 7ch  ;251
  db 7fh, 41h, 41h, 22h, 1ch  ;252
  db 7ch, 12h, 11h, 12h, 7ch  ;253
  db 7fh, 41h, 41h, 22h, 1ch  ;254
  db 7ch, 12h, 11h, 12h, 7ch  ;255
end
