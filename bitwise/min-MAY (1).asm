;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: min-MAY.asm		 ;nombre del programa
;Convertir caracter "minuscula" a "MAYUSCULA"

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
min	DB	"a"
		
segment .bss
;aqui van las variables declaradas pero sin inicializar
MAY		resb	1

segment .text 

global main 					
main:
	nop
	xor eax, eax
	mov al, [min]	;0x61
	AND al, 0xDF	;mascara al= 0x41=0b0100_0001
	mov [MAY], al
	
	nop
	xor eax, eax
	mov al, [min]	;0x61
	SUB al, 0x20	;mascara al= 0x41=0b0100_0001
	mov [MAY], al
ret
	




