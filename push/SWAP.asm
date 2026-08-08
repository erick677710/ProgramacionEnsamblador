;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: SWAP.asm
		
segment .data
a	dq  10
b	dq	20	
	
segment .bss

segment .text 
global main 					
main:
;--------------------
		PUSH qword[a]
		PUSH qword[b]
		
		POP qword[a]
		POP qword[b]	
ret




