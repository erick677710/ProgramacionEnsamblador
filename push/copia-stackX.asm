;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;copiar "lista" (10 numeros cada uno a nivel "qword") dirección inicial 0x00403010 a otra area de memoria 
;que comienza en la direccion inicial final 0x0040305f (stack)

;direccion inicial arreglo =0x00403010 ---->>>> direc.  final 0x0040305F

;file: copia-stackX.asm

extern printf, scanf		

segment .data
arreglo dq	0x1111111111111111, 0x2222222222222222, 0x3333333333333333, 0x4444444444444444, 0x5555555555555555 
		dq	0x6666666666666666, 0x7777777777777777, 0x8888888888888888, 0x9999999999999999, 0xaaaaaaaaaaaaaaaa	
		
segment .bss

segment .text 
global main 					
main:
;--------------------------------	
		mov rcx, 10		;contador
		xor rbx, rbx	;indice
do:		push qword[arreglo+rbx*8+72]
; direccion ultimo elemento 0x0040305F - 8 = 0x00403058
		dec rbx
		loop do	
		add rsp, 80
		ret
	




