;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o MAY.o MAY.asm -l MAY.lst
;link:	   -->> gcc -o MAY MAY.o
;run:      -->> MAY
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: MAY-min.asm		 ;nombre del programa
;Convertir caracter "minuscula" a "MAYUSCULA"

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
MAY	DB	"A"
		
segment .bss
;aqui van las variables declaradas pero sin inicializar
min		resb	1

segment .text 

global main 					
main:
	nop
	xor eax, eax
	mov al, [MAY]	;0x41
	OR al, 0x20		;mascara al= 0x61=0b0110_0001
	mov [min], al
	
	nop
	xor eax, eax
	mov al, [MAY]	;0x41
	ADD al, 0x20	;al= 0x61=0b0110_0001
	mov [min], al	
ret
	




