;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o pruba.o pruba.asm -l pruba.lst
;link:	   -->> gcc -o pruba pruba.o
;run:      -->> pruba
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
		 JNS negativo	;salta a la etiqueta "negativo" si SF=1
			JMP fin
negativo:
		 MOV [num_neg], AL	
fin:
		 RET

