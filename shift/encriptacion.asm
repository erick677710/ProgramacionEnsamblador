;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;intercambiar -> NIBBLE "bajo" con el "alto"
;file: encriptacion.asm

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;-----------------------------------------
	xor eax, eax
	mov al, 0x7f	;al= 0x7f = 0b01111111

	mov ah, al		;ah= 0x7f = 0b01111111
	shl al, 4		;al= 0xf0 = 0b11110000
	shr ah, 4		;ah= 0x07 = 0b00000111
	or al, ah		;al= 0xf7 = 0b11110111
		
;----otra forma---------------------------
	xor eax, eax	
	mov al, 0x7f	;al= 0x7f = 0b01111111	
	mov cl, 4
	ror al, cl		;al= 0xf7 = 0b11110111
ret
	




