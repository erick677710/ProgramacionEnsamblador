
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o IDIV-64-V1.o IDIV-64-V1.asm -l IDIV-64-V1.lst
;link:	   -->> gcc -o IDIV-64-V1 IDIV-64-V1.o
;run:      -->> IDIV-64-V1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: IDIV-64.asm

segment .data
a	DD	214_748_364		  ;0xCCC_CCCC
b	DW	     30_000		  ;0x7530

c	DQ  2_000_000_000_000 ;0x1D1A94A2000
d	DD	          300_000 ;0x493E0
		
segment .text 
global main					
main:
;-------------------
;---division 32 bits
	mov ax, [a]
	mov dx, [a+2]
	mov bx, [b]
	idiv bx
	
;---division 64 bits	
	mov eax, [c]
	mov edx, [c+4]
	mov ebx, [d]
	idiv ebx
ret



