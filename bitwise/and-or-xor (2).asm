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
dato	DB	-89		;0xA7
dato1	DB	+37		;0x25
		
segment .bss

segment .text 

global main 					
main:
;-------AND------------------
		mov al, [dato]
		and al, 0xC3	;0X83   ; "C" -> al = al & 0xC3
		
		and byte[dato1], 0x7A	;0x20
;-------OR-------------------
		mov al, [dato]
		or al, 0xC3		;0XE7
;-------XOR------------------
		mov al, [dato]
		xor al, 0xC3	;0X64
;-------NOT------------------
		mov al, [dato]
		not al			;0X58
		
		mov eax, 0
		not eax
;-------NEG------------------------
		mov al, [dato]
		neg al			;0X59 = +89
		neg al			;0XA7 = -89
;-----------------------------------------------------------
;la instruccion NEG se puede realizar con NOT (C1) + INC (C2)
		mov al, [dato]	;0xA7 = -89
		not al			;0X58 = +88
		inc al			;0X59 = +89
		
;-------TEST-------------------------------------------------
;test destino, fuente: comparacion logica de los dos operandos
;realiza un 'and' logico sin guardar el resultado.
		mov al, [dato]
		test al, 0xC3	;S=1

		test cl, cl     ;set Z=1 if cl == 0		
ret
	




