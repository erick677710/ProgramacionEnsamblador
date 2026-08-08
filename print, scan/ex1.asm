;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o ex1.o ex1.asm -l ex1.lst
;link:	   -->> gcc -o ex1 ex1.o
;run:      -->> ex1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: legal.asm
;El operando puede ser un registro de 16 o 64 bits, 
;una posición de memoria de 16 o 64 bits o 
;un valor inmediato de 8, 16 o 32 bits extendido a 64 bits.
extern printf,scanf,gets,strlen
segment .data
prueba db "cadena %s    cantidad de caracteres : %d",10,0
msj1	db "Ingresar umero en el arreglo: ",0
msj2	db "la cadena tiene un total de %d :(digitos + letras mayuscula + letras minusculas)",0
fmt		db "%S",0
segment .bss
arreglo resb 101
cantidad resq 1
segment .text 
global main 					
main:
;--------------------------
sub rsp, 0x20	

mov rcx,msj1
mov rdx,arreglo
call printf

mov rcx,arreglo
call gets

mov rcx,arreglo
call strlen
mov  qword[cantidad],RAX

mov rcx,prueba
mov rdx,arreglo
mov r8,[cantidad]
call printf

mov rcx,arreglo
mov rdx,[cantidad]
call contar

mov rcx,msj2
mov rdx,RAX
call printf
add rsp, 0x20	
;--- 16-bit PUSH instruction-----------------
ret

contar:
	     xor rsi,rsi 
		 xor r10,r10  
		 xor r11,r11 
		 xor r12,r12   
		 xor r13,r13  
		 xor r14,r14   
		 xor rax,rax
		 ciclo:
		 
		 mov r10b,[rcx+rsi]
		 cmp r10,0x30
		 jl siguiente
		 cmp r10,0x39
		 jle entra
		 
		 
		 cmp r10b,0x41
		 jl siguiente
		 cmp r10b,0x5A
		 jle entra
		 
		 cmp r10b,0x61
		 jl siguiente
		 cmp r10b,0x7A
		 jle entra
		 jg siguiente
		 
		 entra:
		 inc RAX
		 
		 siguiente:
		 inc rsi
		 inc r14
		 cmp r14,rdx
		 jl ciclo
	ret