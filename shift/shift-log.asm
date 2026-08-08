;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: shift-log.asm

extern printf, _scanf		

segment .data
;aqui se declaran variables inicializadas
;enteros sin signo SS
dato1	DB	 85		;0x55	0b01010101	
dato2	DB	213		;0xD5	0b11010101
dato3	DB	208		;0XD0	0b11010000
dato4	DB	209		;0XD1	0b11010001
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;------shift logicos (sin signo SS)-----------------------
;------SHL (shift logico izquierda)-----------------------	
	mov al, [dato1]		;al=0x55 -->>  85 -->>	0b01010101
	shl al, 1			;al=0xAA -->> 170 -->>	0b10101010

	mov al, [dato2]		;al=0xd5 -->> 213 -->>	0b11010101 
	shl al, 1			;al=0xAA -->> 170 ERROR	(OVERFLOW)

;------SHR (shift logico derecha)-------------------------	
	mov al, [dato3]		;al=0xD0 -->> 208 -->> 0b11010000
	shr al, 1			;al=0x68 -->> 104 -->> 0b01101000

	mov al, [dato4]		;al=0xD1 -->> 209 -->> 0b11010001
	shr al, 1			;al=0x68 -->> 104 (resultado 104.5)

;------	SHR (shift logico derecha)------------------------	
	mov al, [dato4]		;al=0xD1 -->> 209 -->> 0b11010001
	mov cl, 2			;contador # desplazamientos
	shr al, cl			;al=0x34 -->> 52 -->> 0b00110100
	
;------- SHR variable memoria -------------------------------
	shr byte[dato4], 2	;[dato4]=0x34 -->> 52 -->> 0b00110100

ret





