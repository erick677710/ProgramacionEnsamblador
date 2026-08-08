;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o practica1.o practica1.asm -l practica1.lst
;link:	   -->> gcc -o practica1 practica1.o
;run:      -->> practica1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: legal.asm
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.
		
segment .data
rango	dq  6

segment .bss
x resq 1
segment .text 
global main 					
main:
xor rax,rax
xor rcx,rcx
xor rdx,rdx
xor rbx,rbx
xor r8,r8


mov rcx,[rango]
mov rdx,1
call ee1
mov  qword[x],rax
ret
ee1 
cmp rdx,rcx
ja fin

mov r8,rdx

imul r8,r8
imul r8,rdx

add rax,r8
add rdx,2

jp ee1

fin ret
