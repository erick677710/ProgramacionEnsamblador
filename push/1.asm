;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 1.asm

global main 

segment .data
		
segment .bss

segment .text 				
main:
;------------------------------	
;Supongamos que rax = 0x1020304050607080 (registro de 64 bits),
;y rsp = 0x00000000_0022FF58.

	mov rax, 0x1020304050607080
;--------------------------------
	push rax	;instruccion PUSH
	pop  rbx	;instruccion POP
	
;--------------------------------
;instruccion PUSH
;-----------------
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.

	sub rsp, 8
	mov [rsp], rax

;instruccion POP
;-----------------
;El operando puede ser un registro de 16 o 64 bits o
;una posición de memoria de 16 o 64 bits.	
	mov rbx, [rsp]
	add rsp, 8
ret
	




