;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: shift-arit.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
;enteros sin signo SS
dato1	DB	+42		;+42 = 0x2A = 0b00101010	
dato2	Db	+74		;+74 = 0x4A = 0b01001010
dato3	DB	-54		;-54 = 0xCA 0 0b11001010
	
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;------shift aritmeticos (con signo CS)-----------

;------SAL (shift aritmetico izquierda)-----------
mov al, [dato1]		;al=0x2a -->> +42 = 0b00101010
sal al, 1			;al=0x54 -->> +84 = 0b01010100

mov al, [dato2]		;al=0x4a -->>  +74 = 0b01001010
sal al, 1			;al=0x94 -->> -108 = 0b10010100	ERROR (OVERFLOW)

;------SAR (shift aritmetico derecha)-------------
mov al, [dato2]		;al=0x4a -->> +74 = 0b01001010
sar al, 1			;al=0x25 -->> +37 = 0b00100101

mov al, [dato3]		;al=0xca -->> -54 = 0b11001010
sar al, 1			;al=0xe5 -->> -27 = 0b11100101	

ret





