;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
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
	push    rax
	
	push	+127			; 8-bit immediate sign-extended to 64 bits
	push    -128			; 8-bit immediate sign-extended to 64 bits
	
	
	push    +32767			; 16-bit immediate sign-extended to 64 bits	
	push    -32768			; 16-bit immediate sign-extended to 64 bits
	
	
	push    +2147483647		; 32-bit immediate sign-extended to 64 bits
	push    -2147483648		; 32-bit immediate sign-extended to 64 bits
	
	;;push    -9223372036854775808		; warning: signed dword value exceeds bounds
	;;push    +9223372036854775807		; warning: signed dword value exceeds bounds 
	push    qword[a]
	
	
;--- 16-bit PUSH instruction-----------------
	mov bx, 0xAABB			; 16-bit register zero-extended to 64 bits
	push    bx
	push    word[b]
ret




