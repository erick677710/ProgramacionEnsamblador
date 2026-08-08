;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o huevo.o huevo.asm -l huevo.lst
;link:	   -->> gcc -o huevo huevo.o
;run:      -->> huevo
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: huevo.asm (nombre programa)
;registro: huevo
;nombres y apellidos: Erick Raul Teran Tabera

global main 
extern printf, scanf,gets		

segment .data
;aqui se declaran variables inicializadas
msj1 db "ingresa tu nombre y apellido en MAYUSCULAS: ",0
msj2 db "su nombre es : %s",10,0


		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
nom resb 60

segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;...
add rsp,0x20
mov rcx,msj1
call printf
mov rcx,nom
call gets

mov rax,nom
ciclo:
	mov rbx,[rax]
	cmp rbx,0
	jz fin
	
	mov rbx,[rax]
	or rbx,0x20
	mov [rax],rbx
	inc rax
	jmp ciclo
fin:
mov rcx,msj2
mov rdx,nom
call printf
sub rsp,0x20
;...
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...
ret