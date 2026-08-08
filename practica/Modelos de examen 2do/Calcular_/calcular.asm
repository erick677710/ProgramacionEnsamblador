;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o calcular.o calcular.asm -l calcular.lst
;link:	   -->> gcc -o calcular calcular.o
;run:      -->> calcular
;debugger: -->> x64dbg calcular
;Direccion de incicio 401550
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: calcular.asm (nombre programa)
;registro:
;nombres y apellidos:

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
	msj1	db 	10, "Ingresar el valor de a: ", 0
	msj2	db	"Ingresar el valor de b: ", 0
	msj3	db 	"Ingresar el valor de c: ", 0
	msj4	db 	"d: %d", 10, 0
	fmt		db 	"%d", 0
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	a	resd	1
	b	resd	1
	c	resd	1
	d	resd	1
segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	sub rsp, 0x20
	mov rcx, msj1
	call printf
	
	mov rcx, fmt
	mov rdx, a
	call scanf
	
	mov rcx, msj2
	call printf
	
	mov rcx, fmt
	mov rdx, b
	call scanf
	
	mov rcx, msj3
	call printf
	
	mov rcx, fmt
	mov rdx, c
	call scanf
	
	
	
	mov ecx, [a]
	mov edx, [b]
	mov r8d, [c]
	call calcular
	mov [d], eax
	
	mov rcx, msj4
	mov rdx, [d]
	call printf
	
	
	add rsp, 0x20
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui calcular subrutina (funcion)
;	d = ((a << 3) & (-b * 8)) / ((b - c) ^ 3)

	calcular:
		mov ebx, edx
		sal ecx, 3		;(a << 3)
		neg ebx
		imul ebx, ebx, 8	;(-b * 8)
		
		and ecx, ebx		;((a << 3) & (-b * 8))
		
		sub edx, r8d		;(b - c)
		mov r12d, edx
		
		imul r12d, r12d
		imul r12d, edx		;(b - c) ^ 3
		
		mov eax, ecx		
		cdq
		idiv r12d			;((a << 3) & (-b * 8)) / ((b - c) ^ 3)
	ret