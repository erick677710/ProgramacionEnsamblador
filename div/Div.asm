;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o ejemplo.o ejemplo.asm
;gcc -o ejemplo.exe ejemplo.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------
; programa de division (SS). 
;file: div.asm

segment .data
		
segment .text 
global main 					
main:
	XOR EAX, EAX
	XOR ECX, ECX
;-------------------------------------
;Sin Signo (SS)
;dividir: 251/12

	NOP
	MOV AX, 251 	;dividendo 0xFB
	MOV CL, 12  	;divisor   0x0C
	DIV CL
;produce 20 = 0x14 -->> AL(cociente) y 11 = 0xB -->> AH(residuo)
;---------------------------------------------------------------
;Sin Signo (SS)
;dividir: 5147/300

	NOP
	MOV   AX, 5147	 ;AX = 0x141B (dividendo DX:AX)
	XOR   DX, DX     ;cuidado ==>> clear DX
	MOV   CX, 300    ;CX = 0x12C  (divisor CX)
	DIV   CX
;produce 17=0x11 en AX(cociente) y 47=0x2F en DX(residuo)

ret




