;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI:
;rcx, rdx, r8, r9 -->> for integers ;(left to right)-->> primeros 4 parametros enteros windows
;Remaining arguments are passed via the stack (right to left)-->> [rsp+0x20],[rsp+0x28]......
;xmm0, xmm1, xmm2, xmm3 -->>

;file: cut-paste.asm

;crear un nuevo "byte3" combinando los bits pares del "byte1"
;con los bits impares del "byte2"

extern printf, scanf		

segment .data
byte1		DB	0x37	;0b0011_0111
byte2		DB	0x8A	;0b1000_1010
		
segment .bss
byte3	resb 1	0x9F	;0b1001_1111

segment .text 
global main 					
main:	
;------------------
	xor eax, eax
	mov al, [byte1]
	mov bl, [byte2]
	
	and al, 0x55 ; obtener bits pares -->> mascara 0X55(bits pares)
	and bl, 0xaa ; obtener bits impares -->> mascara 0xAA(bits impares) 
	or al, bl	 ; 0x9F combinar los dos bytes
	
	mov [byte3], al
ret





