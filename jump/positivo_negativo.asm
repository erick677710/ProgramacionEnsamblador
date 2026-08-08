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
;si resultado es un número positivo almacenarlo en la variable
;"positivo", caso contrario en la variable "negativo"

segment .data
minuendo		Dw	0xB93A	; -18118 (con signo)
sustraendo		Dw	0x3C10	; +15376 (con signo)
;0xB93A - 0x3C10 = 0x7D2A
		
segment .bss
positivo		resw 1
negativo		resw 1

segment .text 
global main 					
main:
;-----------------------
			xor ax, ax
			xor bx, bx
			mov ax, [minuendo]
			mov bx, [sustraendo]
			sub ax, bx		; ax= 0x7D2A -->> CF=0,  ZF=0, SF=0,  0F=1
							;resultado número positivo -> bandera signo SF = 0
			js negativo1	;salta si SF=1 (negativo)
				mov [positivo], ax
				jmp fin
negativo1:  mov [negativo], ax
fin:		
ret





