;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o print2.o print2.asm -l print2.lst
;link:	   -->> gcc -o print2 print2.o
;run:      -->> print2
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
c	db "I can stop te lonliless : %S %d %d",0
d   dd 9
fmt		db "%S",0
segment .bss
b resb 5
segment .text 
global main 					
main:
;--------------------------
sub rsp, 0x20	
mov rcx,a
call printf

mov rdx,b
mov rcx,fmt
call scanf


mov rcx,c
mov rdx,b
mov r8,d
mov r9,[d]
call printf

add rsp, 0x20	
;--- 16-bit PUSH instruction-----------------
ret
