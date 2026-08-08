;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: push.asm

global main 

segment .data
		
segment .bss

segment .text 				
main:
;------------------------------
;solo valores de 16 o 64 bits	
;Supongamos que rax = 0x1020304050607080 (registro de 64 bits),
;bx = 0xA0B0 (registro de 16 bits) y rsp = 0x00000000_0022FF58.

	mov rax, 0x1020304050607080
	mov bx, 0xA0B0
;----------------------------
;mov rsp, 0x00000000_0022FF58
;----------------------------
	push rax
	push bx
	pop  bx
	pop  rax
ret
	




