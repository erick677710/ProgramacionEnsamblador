;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o paralelepipedo.o paralelepipedo.asm -l paralelepipedo.lst
;link:	   -->> gcc -o paralelepipedo paralelepipedo.o
;run:      -->> paralelepipedo
;debugger: -->> x64dbg paralelepipedo
;Direccion de incicio 401550
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: paralelepipedo.asm (nombre programa)
;registro:
;nombres y apellidos:

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
	msj		db	10, "------------------------", 10, 0
	msjA	db	"Largo A: ", 0
	msjB	db 	"Ancho B: ", 0
	msjC	db	"Altura C:", 0
	msjAr	db	"Area: %d", 10, 0
	fmt		db	"%d", 0
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	area	resd	1
	a		resd	1
	b		resd	1
	c		resd 	1
segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	sub rsp, 0x20
	
	mov rcx, msj
	call printf
	
	mov rcx, msjA
	call printf
	
	mov rcx, fmt
	mov rdx, a
	call scanf
	
	mov rcx, msjB
	call printf
	
	mov rcx, fmt
	mov rdx, b
	call scanf
	
	mov rcx, msjC
	call printf
	
	mov rcx, fmt
	mov rdx, c
	call scanf
	
	mov ecx, [a]
	mov edx, [b]
	mov r8d, [c]
	call Area
	mov [area], eax
	
	mov rcx, msjAr
	mov rdx, [area]
	call printf
	
	mov rcx, msj
	call printf
	
	add rsp, 0x20
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui paralelepipedo subrutina (funcion)
;Area = 2*(A*B + A*C + B*C).
	Area:
		mov eax, ecx
		imul ecx, edx	;a*b
		imul eax, r8d	;a*c
		imul edx, r8d	;b*c
		xor r12, r12
		add r12d, ecx
		add r12d, eax
		add r12d, edx
		imul r12d, 2
		mov eax, r12d
	ret