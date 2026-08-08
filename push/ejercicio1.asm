;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ejercicio1.asm

segment .data
a	dq  47
		
segment .bss

segment .text 
global main 					
main:
;-------------------
XOR RAX, RAX
XOR RCX, RCX
	MOV RAX, -22
		PUSH RAX
		PUSH qword[a]
		POP RBX
	DEC RBX
	SUB RAX, RCX
		PUSH RAX
		POP RCX
		POP RBX
ret




