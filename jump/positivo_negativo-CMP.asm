;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: pos-neg.asm (nombre programa)
;program realiza una resta (minuendo - sustraendo)
;no almacena el resultado
;si resultado es un número positivo almacenar 0x00 (ceros) la variable "flag"
;caso contrario almacena 0xFF (unos) en la variable "flag".

segment .data
minuendo		DW	0xB93A	; -18118 (con signo)
sustraendo		DW	0x3C10	; +15376 (con signo)
;0xB93A - 0x3C10 = 0x7D2A
		
segment .bss
flag	RESB 1


segment .text 
global main 					
main:
;-----------------------
			xor ax, ax
			xor bx, bx
			mov ax, [minuendo]
			mov bx, [sustraendo]
			cmp ax, bx		;(ax -bx) no almacena resultado y actualiza  -->> CF=0, ZF=0, SF=0, 0F=1
							;resultado número positivo -> bandera signo SF=0, negativo SF=1. 
			js negativo1	;salta si SF=1 (negativo)
				mov byte[flag], 0x00
				jmp fin
negativo1:  mov byte[flag], 0xFF
fin:		
ret





