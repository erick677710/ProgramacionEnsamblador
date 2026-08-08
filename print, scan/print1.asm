;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o print1.o print1.asm -l print1.lst
;link:	   -->> gcc -o print1 print1.o
;run:      -->> print1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: legal.asm
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.
extern printf,scanf		
segment .data
a	db "I can stop te lonliless : ",0
c	dd "I can stop te lonliless : %d",0
fmt		db "%d",0
segment .bss
b resd 1
segment .text 
global main 					
main:
;--------------------------
mov rcx,a
call printf


mov rdx,b
mov rcx,fmt
call scanf



	
mov rcx,c
mov rdx,[b]
call printf
	
;--- 16-bit PUSH instruction-----------------
ret