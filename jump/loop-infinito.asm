;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: jump0.asm (nombre programa)

;INSTRUCCIÓN -> JUMP	memonico JMP

segment .data
		
segment .bss

segment .text 
global main 					
main:
;--------------------
		mov eax, 1
loop1:	
		inc eax			;eax++
		jmp loop1		;salto incondicional a la etiqueta "loop1".
		mov ebx, eax	;nunca se efecuta
		ret				;nunca se ejecuta -> prog. numca termina (loop infinito).





