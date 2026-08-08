;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;programa de multiplicacion. 
;file: mul-64.asm

; c = a*b 

segment .data
a	DQ	1_000_234_567_890	;0x000000E8E2A048D2
b	DQ	1_000_234_567_890	;0x000000E8E2A048D2

	
segment .bss
c	RESQ 2

segment .text 
global main 					
main:
				
;--------------MUL------------------------
;multiplicación 64-bits
	NOP
	MOV RAX, [a]
	MUL qword[b]	;producto = 0x000000000000D3DB_8B23618DE336CC44
					;RAX = 0x8B23618DE336CC44
					;RDX = 0x000000000000D3DB
;almacenar el resultado del producto
	MOV [c], RAX
	MOV [c+8], RDX
ret

