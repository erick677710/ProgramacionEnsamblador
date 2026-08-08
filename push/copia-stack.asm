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

;direc. inicial arreglo =0x00403010 ---->>>> direc.  final arreglo 0x0040305F

;file: copia-stack.asm

extern printf, scanf		

segment .data
arreglo dq	0x11111111, 0x22222222, 0x33333333, 0x44444444, 0x55555555 
		dq	0x66666666, 0x77777777, 0x88888888, 0x99999999, 0xaaaaaaaa	
		
segment .bss

segment .text 
global main 					
main:
;------------------------	
		mov rcx, 10			;contador
							;rsp inicial=0x0028ff58 + 80d(0x50)=0x0028ff08
		mov rbx, arreglo	;direccion
		add rbx, 72			;rbx=0x00403010+0x48=0x00403058 (72d)
loop:	push qword[rbx]		
		sub rbx, 8
		dec rcx				;dec contador
		jnz loop	
		add rsp, 80
		ret
	




