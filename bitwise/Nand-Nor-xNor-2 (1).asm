;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------


;file: and-or-xor.asm

extern printf, scanf		

segment .data
dato	DB	0b1010_0111		;0xA7 	-89
dato1	DB	0b0010_0101		;0x25 	+37
		
segment .bss

segment .text 

global main 					
main:
;-------NAND-----
;Tabla de Verdad -> AND
; A  B   Out
; 0  0   1
; 0  1   1
; 1  0   1
; 1  1   0

		mov al, 0b10100111
		and al, 0b11000011	;0X83   
		not al				;0x7C
		
;-------NOR------
;Tabla de Verdad -> OR
; A  B   Out
; 0  0   1
; 0  1   0
; 1  0   0
; 1  1   0

		mov al, 0b10100111
		or al, 	0b11000011	;0XE7
		not al				;0x18
		
;-------XNOR-----
;Tabla de Verdad -> XNOR
; A  B   Out
; 0  0   1
; 0  1   0
; 1  0   0
; 1  1   1

		mov al, 0b10100111
		xor al, 0b11000011	;0X64
		not al				;0x9B
ret
	




