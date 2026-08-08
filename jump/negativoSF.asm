;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: negativoSF

;INSTRUCCIÓN -> JS (jump if negative) SF=1		

segment .data
		
segment .bss
num_neg	RESB  1

segment .text 
global main 					
main:
;--------------------------
		 MOV AL, 15
		 SUB AL, 97		;AL = -82	->  CF=1, ZF=0, SF=1, OF=0 
		 JS negativo	;salta a la etiqueta "negativo" si SF=1
			JMP fin
negativo:
		 MOV [num_neg], AL	
fin:
		 RET




