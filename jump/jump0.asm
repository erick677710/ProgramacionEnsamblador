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
		mov eax, 0x10	;eax=0x10
		jmp label		;salto incondicional a la etiqueta "label".
		mov eax, 0x20	;nunca se ejecuta
label:
		ret





