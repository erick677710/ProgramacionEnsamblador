;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: cifrado1.asm

extern _printf, _scanf		

segment .data
;aqui se declaran variables inicializadas
mensaje 	DB	"abcd"
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar
cifrado	    resb 4
descifrado  resb 4

segment .text 
global main 					
main:
;cifrado--------------------
;"hola" -->> cifrado: "????"	
mov al, [mensaje]
xor al, 0x34
mov [cifrado], al

mov al, [mensaje+1]
xor al, 0x34
mov [cifrado+1], al

mov al, [mensaje+2]
xor al, 0x34
mov [cifrado+2], al

mov al, [mensaje+3]
xor al, 0x34
mov [cifrado+3], al

;===========================
;descifrar------------------
nop
mov al, [cifrado]
xor al, 0x34
mov [descifrado], al

mov al, [cifrado+1]
xor al, 0x34
mov [descifrado+1], al

mov al, [cifrado+2]
xor al, 0x34
mov [descifrado+2], al

mov al, [cifrado+3]
xor al, 0x34
mov [descifrado+3], al

ret





