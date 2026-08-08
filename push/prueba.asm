;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o prueba.o prueba.asm -l prueba.lst
;link:	   -->> gcc -o prueba prueba.o
;run:      -->> prueba
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: legal.asm
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.
		
segment .data
a	dq  0x1122334455667788
b	dw  0xAABB

segment .bss

segment .text 
global main 					
main:
mov rax, 0xAABBCCDDEEFF1122
;--------------------------

	
;--- 16-bit PUSH instruction-----------------
	mov bx, 0xAABB			; 16-bit register zero-extended to 64 bits
	push    bx
	push    word[b]
	push    bx
	push    word[b]
	push    bx
	push    word[b]
ret