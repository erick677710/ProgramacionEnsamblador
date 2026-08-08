;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ror-rol.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;entero sin signo SS
dato1	DB	15	;15 -->>  0x0f -->> 0b00001111	
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;--------rotacion--------------------
;--------ROR-------------------------	
mov al, [dato1]		;al=0x0f -->>  15 -->> 0b00001111
ror al, 1			;al=0x87 -->> 135 -->> 0b10000111

mov cl, 4
mov al, [dato1]		;al=0x0f -->>  15 -->> 0b00001111 
ror al, cl			;al=0xf0 -->> 240 -->> 0b11110000

;---------ROL-------------------------
mov cl, 4
mov al, [dato1]		;al=0x0f -->>  15 -->> 0b00001111
rol al, cl			;al=0xf0 -->> 240 -->> 0b11110000 

ret





