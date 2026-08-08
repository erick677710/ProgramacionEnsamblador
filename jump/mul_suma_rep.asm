;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: mul_suma_rep.asm (nombre programa)

;programa de multiplicación enteros sin signo mediante
;algoritmo "sumas repetidas"
;en este caso se sumará el "multiplicando"
;el número de veces que indica el "multiplicador"

segment .data
multiplicando DB 20		;sin signo SS
multiplicador DB 30		;sin signo SS
		
segment .bss
producto	RESW  1
;cuidado -> tamaño "producto" doble

segment .text 
global main 					
main:
;------------------------
	xor ax, ax
	xor cx, cx
	xor dx, dx				;almacenará el producto
;-------------
	mov al, [multiplicando]
	cmp al, 0				;resta (al - 0) actualiza banderas, pero no almacena resultado resta.
	jz fin					;salta etiqueta "fin" si: -> ZF=1 o sea cuando al=0
	mov cl, [multiplicador] ;rgistro "cl" actuará com un contador
suma: 	cmp cl, 0			
		jz fin				;salta etiqueta "fin" si: -> ZF=1 o sea cuando al=0		
		add dx, ax
		dec cl
		jmp suma
fin: 
	mov [producto], dx
ret




