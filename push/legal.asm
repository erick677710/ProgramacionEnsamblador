;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: legal.asm
		
segment .data
a	dq  0x1122334455667788
b	dw  0xAABB
segment .bss

segment .text 
global main 					
main:
mov rax, 0xAABBCCDDEEFF1122
;--------------------
	push    rax
	push    1              ; 8-bit immediate sign-extended to 64 bits
	push    65536          ; 32-bit immediate sign-extended to 64 bits
	push    qword[a]
	
;--- 16-bit PUSH instruction-----------------
	mov bx, 0xAABB		   ; 16-bit register zero-extended to 64 bits
	push    bx
	push    word[b]
ret




