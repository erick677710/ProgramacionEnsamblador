;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o mul-2-3operandos.o mul-2-3operandos.asm -l mul-2-3operandos.lst
;link:	   -->> gcc -o mul-2-3operandos mul-2-3operandos.o
;run:      -->> mul-2-3operandos%%%%%%%%%%%%
;-----------------------------------------

;file: mul-2-3operandos.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
x	DD 10	    
	
segment .text 
global main 					
main:
;---------------------------------------
mov eax, 25
mov ebx, 30
mov ecx, 35

;--2 operandos----------------------	
imul eax, 100	;multiplica eax por 100  lenguaje "C" -> eax *= 100
imul eax, [x]	;multiplica eax por [x]
imul ebx , ecx	;multiplica ebx por ecx  y se guarda en ebx              
			
;--3 operandos----------------------
mov ebx, 30
imul ebx , [x] , 100 ;almacena 100*x en ebx
imul edx , ebx , 50	 ;almacena 50*ebx in edx

;-----------------------------------------
;----Sin Signo----------------------------	
mov eax, 012345678h
mov edx, 012345678h
mul edx
;El resultado de esta multiplicacion es:
;0x12345678 * 0x12345678 = 0x014B66DC1DF4D840
;la cual produce los siguientes valores en los registros edx and eax:
;edx = 0x014B66DC
;eax = 0x1DF4D840

;-----Con Signo------------------------------
mov eax, -2
mov ebx, -2
imul ebx
;edx:eax = (-2) * (-2) = 4 = 0x0000000000000004

;Ahora usaremos el entero con signo positivo más grande posible:
mov edi, +2147483647
mov esi, +2147483647

;esta instruccion almacena el resultado en edi y descarta los 32 bits superiores:
imul edi, esi
;2147483647*2147483647=4611686014132420609=0x3FFFFFFF00000001
;edi = 0x00000001
;0x3FFFFFFF se descarta.

mov eax, 10
mov ebx, 20

;3 operandos (destino y 2 operandos fuentes).
;The three-operand form is the only form where the destination register
;is not one of the factors in the product.
;this simply adds another factor to the multiplication:
imul eax, ebx, 3
;eax= ebx*3 = 20*3 = 60 = 0x3C
;upper 32 bit are discarded but they are 0 anyways, so:
;eax = 60 = 0x0000003C
mov eax, -2
mov ebx, -2
mul ebx
ret




