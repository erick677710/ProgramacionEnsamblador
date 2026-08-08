;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: jump.asm (nombre programa)

;INSTRUCCIÓN -> JUMP	memonico JMP
		
segment .data
		
segment .bss

segment .text 
global main 					
main:
;-----------------------
		mov eax, 12345
		mov ecx, 67890
		sub eax, ecx
		jmp suma			;salto incondicional a la etiqueta "suma".
			sub ebx, edx	;nunca se ejecuta
atras:	jmp fin				;salto incondicional a la etiqueta "fin".
suma:   	add ecx, eax	
		jmp atras			;salto incondicional a la etiqueta "vuelve".
fin:		xor eax, eax
		ret





