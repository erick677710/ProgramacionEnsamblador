;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o 223044083.o 223044083.asm -l 223044083.lst
;link:	   -->> gcc -o 223044083 223044083.o
;run:      -->> 223044083
;debugger: -->> x64dbg 223044083
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: 223044083.asm (nombre programa)
;registro:	223044083
;nombres y apellidos:	Evert Rodriguez Araúz

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
 n dd	10
 arreglo dd	1,-2,3,-4,5,-6,7,-10,9,-12
msj	db 	10, "Residuo del promedio: %d", 10, 0	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
residuo		resd	1
	
segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	sub rsp, 0x20
	
	mov ecx, [n]
	mov rdx, arreglo
	call calcular
	mov [residuo], eax
	
	mov rcx, msj
	mov rdx, [residuo]
	call printf
	add rsp, 0x20

ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
	calcular:
		mov rbx, rdx
		xor r8, r8
		xor r9d, r9d
		mov r10d, 2
		xor r12d, r12d
		xor r13d, r13d
		while:
			mov eax, [rbx + r8]
			mov r13d, eax
			cmp eax, 0
			jg falso
				cdq
				idiv r10d
				cmp rdx, 0
				jne	falso1
					inc r9d
					add	r12d, r13d 
				falso1:
			falso:
			add r8, 4
		loop while	
		mov eax, r12d
		cdq
		idiv r9d
		mov eax, edx
	ret


