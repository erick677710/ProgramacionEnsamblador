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
minuendo		DB	-93		;  0xA3	(con signo)
sustraendo		DB	-120	;  0x88 (con signo)





;-93 -(-120) = 27
;0xA3 - 0x88 = 0x1B
		
segment .bss
positivo		resB 1
negativo		resB 1

segment .text 
global main 					
main:
;------------------------------
			mov al, [minuendo]
			mov bl, [sustraendo]
			sub al, bl		; ax=0xA3-0x88=0x1B -> CF=0, ZF=0, SF=0, 0F=0
							;resultado número positivo -> bandera signo SF = 0
			js negativo1	;salta si SF=1 (negativo)
				mov [positivo], al
				jmp fin
negativo1:  mov [negativo], al
fin:		
ret





