;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ejercicio.asm

segment .data
a	dq  10
b	dq	20	
	
segment .bss

segment .text 
global main 					
main:
;----------------
	MOV RAX, 25
	ADD RAX, 5
		PUSH RAX
	INC RAX
		PUSH RAX
	MOV RBX, RAX
	SUB RBX, 15
		PUSH RBX
		POP RAX
		POP RCX
		POP RBX
ret




