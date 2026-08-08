;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: dividend-zero.asm

;.text=   0X00401550
;.data=   0x00403010

segment .data
bNumA db 00	;cero!
		
segment .bss

segment .text 
global main 					
main:
;-----------------------
	mov al, byte[bNumA]
	mov ah, 0
	mov bl, 3
	div bl	; cociente AL=0,  residuo AH=0
ret




