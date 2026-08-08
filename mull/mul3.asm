
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: mult_lab.asm

extern printf, scanf		

segment .data
byte1	DB 0x80
byte2	DB 0x40
word1	DW 0x8000
word2   DW 0x2000
dword1	dd 0x80000000
dword2	dd 0x80000000	
	
segment .bss

segment .text 
global main 					
main:
;-------------SS--------------------
xor eax, eax

;a.-)byte*byte
xor eax, eax
MOV AL, [byte1]		; 80h*40h=2.000h
MUL byte[byte2]		;128d*64d=8192d

;-----------------------------------------------
;b.-)word*word
xor eax, eax
MOV AX, [word1]		; 8000h*2000h=10.000.000h
MUL word[word2]		;32.768d*8192d=268.435.456d

;-----------------------------------------------
;c.-)byte*word
MOV AL, [byte1]		; 80h*8000h=400.000h
SUB AH, AH
MUL word[word1]		;128d*32768d=4.194.304d

;----------------------------------------------
;d.-) dword*dword
MOV EAX, [dword1]		; 80h*8000h=400.000h
MUL dword[dword2]		;128d*32768d=4.194.304d

;------------CS-------------------------------

;a.-)byte*byte
MOV AL, [byte1]		; 80h*40h=E000h
IMUL byte[byte2]	;(-128d)*64d=(-8.192d)

;b.-)word*word
MOV AX, [word1]		; 8000h*2000h=F0.000.000h
IMUL word[word2]	;(-32.768d)*8192d=(-268.435.456d)

;c.-)byte*word
MOV AL, [byte1]		; 80h*8000h=400.000h
CBW					; FF80h*8000h=400.000h
IMUL word[word1]	;(-128d)*(-32768d)=4.194.304d
			
ret
	




