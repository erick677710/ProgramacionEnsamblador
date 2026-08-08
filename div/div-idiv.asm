
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;debugger  -->> x64dg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: div-idiv.asm

segment .data
byte1	DB	   0x80
byte3	DB	   0x16
word1	DW	 0x2000
word2   DW	   0x10
word3	DW	 0x1000	
		
segment .text 
global main 					
main:	
;-------------SS (DIV)-----------------------------
;a.-)word/byte
MOV AX, [word1]		; 2000h/80h=40h + R00h
DIV byte[byte1]		; 8.192d/128d=64d + 0d

;b.-)byte/byte
MOV AL, [byte1]		; 80h/16h=5h+12h
SUB AH, AH			; 0080h/16h
DIV byte[byte3]		; 128d/22d=5d + R18d

;c.-)worddoble/word
MOV DX, [word2]		; 0010:1000h/2000h= AX=0080h + DX=1000h
MOV AX, [word3]
DIV word[word1]		;1.052.672d/8.192d=128d + 4096d

;d) word/word	
MOV AX, [word1]		;2000h/1000h = AX=0002h + DX=0000h
SUB DX, DX			; DX=0000
DIV word[word3]		; 8192d/4096d = AX= 2d + DX=0h

;------------CS (IDIV)-------------------------------
;a.-)word/byte
MOV AX, [word1]		; 2000h/80h=C0h + R00h
IDIV byte[byte1]		; 8.192d/(-128d)=(-64d) + 0d

;b.-)byte/byte
MOV AL, [byte1]		; 80h
CBW 				;!!!!!!!!	; FF80h/16h= FBh + EEh
IDIV byte[byte3]	; (-128d)/22d=(-5d) + (-18d)

;c.-)worddoble/word
MOV DX, [word2]		; 0010:1000h/2000h= AX=80h + DX=1000h
MOV AX, [word3]
IDIV word[word1]	;1.052.672d/8.192d=128d + 4096d

;d.-) word/word	
MOV AX, [word1]		;2000h/1000h = AX=2h + DX=0h
CWD					; DX=0000
IDIV word[word3]	; +8192d/4096d = AX= 2d + DX=0h

ret

	




