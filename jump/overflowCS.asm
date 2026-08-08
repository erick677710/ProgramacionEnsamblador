;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: overflowCS.asm (nombre programa)

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; un ejemplo para detectar un overflow en una suma.
; CF=1 -> overflow. Es la bandera de CARRY la que detecta overflow para enteros SS.
; OF=1 -> overflow. Es la bandera de OVERFLOW la que detecta overflow para enteros CS.
; Cuidado: CF=1 -> overflow. Es la bandera de CARRY la que detecta overflow para enteros SS.
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

segment .data
		
segment .bss

segment .text 
global main 					
main:
;-----------------------
		nop
		mov al, -128	;menor número entero negativo con signo en C2 -> al=0xFF
		mov bl, -128	;menor número entero negativo con signo en C2 -> bl=0xFF 
		add al, bl		;si OF=1 la suma ha producido un overflow.
		jo overflow		;salta a la etiqueta "overflow" si OF=1.		
		jmp fin			;salto incondicional a la etiqueta "fin".
overflow:
		mov al, 0
fin:
ret

