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
;-------AND------------------
		mov al, 0b10100111
		and al, 0b11000011	;0X83   ; "lenguaje C/C++" -> al = al & 0xC3
		
		and byte[dato1], 0x7A	;0x20
;-------OR-------------------
		mov al, 0b10100111
		or al, 	0b11000011	;0xE7
;-------XOR------------------
		mov al, 0b10100111
		xor al, 0b11000011	;0x64
;-------NOT------------------
		mov al, 0b10100111
		not al				;0x58
		
		mov eax, 0
		not eax				;0xFFFFFFFF
;-------NEG------------------------
		mov al, 0b10100111
		neg al				;0x59 = +89
		neg al				;0xA7 = -89
;-----------------------------------------------------------
;la instruccion NEG se puede realizar con NOT (C1) + INC (C2)
		mov al, 0b10100111	;0xA7 = -89
		not al				;0x58 = +88
		inc al				;0x59 = +89
		
;-------TEST-------------------------------------------------
;test destino, fuente: comparacion logica de los dos operandos
;realiza un 'and' logico sin guardar el resultado.
		mov al,  0b10100111
		test al, 0b11000011	;S=1

		test cl, cl 	    ;set Z=1 if cl == 0		
ret
	




