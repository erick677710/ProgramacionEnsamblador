;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: overflowSS.asm (nombre programa)

;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; un ejemplo para detectar un overflow en una suma.
; CF=1 -> overflow. Es la bandera de CARRY la que detecta overflow para enteros SS ("NO" la bandera OF).
; OF=1 -> overflow. Es la bandera de OVERFLOW la que detecta overflow para enteros CS:
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

segment .data
		
segment .bss

segment .text 
global main 					
main:
;----------------------
		nop
		mov al, 255		;máximo entero sin signo -> al=0xFF
		mov bl, 255		;máximo entero sin signo -> bl=0xFF 
		add al, bl		;si CF=1 la suma ha producido un overflow.
		jc overflow		;salta a la etiqueta "overflow" si CF=1.		
		jmp fin			;salto incondicional a la etiqueta "fin".
overflow:
		mov al, 0
fin:
ret




