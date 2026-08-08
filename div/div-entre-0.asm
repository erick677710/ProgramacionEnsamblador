;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win32 -o P1.o P1.asm -l P1.lst
;gcc -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------
;file: div-entre-0.asm

segment .data
a	DD	+2147483647	
	
segment .text 
global main 					
main:
	mov ax, [a]
	mov dx, [a+2]
	mov cx, 0	;divisor cero
	idiv cx		;exception S.O. 0xC0000094
ret




