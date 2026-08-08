;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o %1.o %1.asm -l %1.lst
;x86_64-w64-mingw32-gcc.exe -o %1.exe %1.o
;x86_64-w64-mingw32-gcc.exe %1.c -o %1.exe
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;INVERTIR LOS ELEMENTOS DE UN ARREGLO

;file: invertir-arreglo.asm
		
segment .data
array	DQ	10, 20, 30, 40, 50
	
segment .bss

segment .text 
global main 					
main:
;----------------------------		
		xor rdx, rdx	;indice
do1:	push qword[array,rdx*8]
		inc rdx
		cmp rdx, 5		; -->> LOOP
		jne do1
;-----------------------------		
		xor rdx, rdx	;indice
do2:	pop  qword[array,edx*8]
		inc rdx
		cmp rdx, 5		; -->> LOOP
		jne do2
ret





