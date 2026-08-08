;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: SWAP.asm

;---------------------------------------------------------
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.
;----------------------------------------------------------
		
segment .data
a	db  10
b	dd	20	
	
segment .bss

segment .text 
global main 					
main:
;--------------------
	push    al					;no soportado: registro 8-bits
	push    eax					;no soportado: registro 32-bits
	push    byte[a]				;no soportado: memoria 8-bits
	push    dword[b]			;no soportado: memoria 32-bits
	push    0x0_100_000_000     ;no soportado: valor inmediato 64-bits 
ret




