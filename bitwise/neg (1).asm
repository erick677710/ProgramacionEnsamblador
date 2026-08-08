;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: neg.asm		 ;nombre del programa
;la instruccion "NEG" realiza la operacion C2
;actualiza las banderas S y Z
extern printf, scanf		

segment .data
a	DD	0x12345678	
b	DW	-32768			

segment .text 
global main 					
main:
;--------------------
	xor eax, eax
	mov eax, [a]	;+305419896
	neg eax			;negate the value in eax = 0xEDCBA988= -305419896
	neg dword [a]	;negate a 4 byte integer at x = 0x88A9CBED(little endian)= -305419896	

	xor eax, eax
	neg word [b]	; resultado valido?  -> si el mismo valor	
	ret
	




