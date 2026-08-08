;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o mayor_menor.o mayor_menor.asm -l mayor_menor.lst
;link:	   -->> gcc -o mayor_menor mayor_menor.o
;run:      -->> mayor_menor
;debugger: -->> x64dbg mayor_menor
;Direccion de incicio 401550
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: mayor_menor.asm (nombre programa)
;registro:
;nombres y apellidos:

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
	msj		db	10, "Bienvenido::", 10, "------------------", 10, 0
	msj1	db	"Ingrese la cantidad de elementos (max 50): ", 0
	msj2	db	"Ingrese el elemento %d: ", 0
	msj3	db	"El mayor elemento es: %d",10, 0
	msj4	db	"El menor elemento es: %d", 0
	fmt		db	"%d", 0

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	n		resd	1
	vec		resd	50
	mayor	resd	1
	menor 	resd	1
segment .text 				
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	sub rsp, 0x20
	mov rcx, msj
	call printf
	
	mov rcx, msj1
	call printf
	
	mov rcx, fmt
	mov rdx, n
	call scanf
	
	mov r12, vec
	xor r13, r13		;indice
	for: ;for (i = 0; i < 5)
		cmp r13d, [n]
		jl	cierto
		jmp fin
		cierto:
		mov rcx, msj2
		mov rdx, r13
		call printf
		
		mov rcx, fmt
		mov	rdx, r12
		call scanf
		add r12, 4
		inc r13
		jmp for
	fin:
	
	mov ecx, [n]
	mov rdx, vec
	call Mayor
	mov [mayor], eax
	
	mov rcx, msj3
	mov rdx, [mayor]
	call printf
	
	mov ecx, [n]
	mov rdx, vec
	call Menor
	mov [menor], eax
	
	mov rcx, msj4
	mov rdx, [menor]
	call printf
	
	add rsp, 0x20
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
	Mayor:
		mov eax, [rdx]
		add rdx, 4
		dec ecx
		while:
			mov ebx, [rdx]
			cmp ebx, eax
			jg cierto1
				jmp falso
			cierto1:
				mov eax, ebx
			falso:
				add rdx, 4
		loop while
	ret
	
	Menor:
		mov eax, [rdx]
		add rdx, 4
		dec ecx
		while1:
			mov ebx, [rdx]
			cmp ebx, eax
			jl cierto2
				jmp falso1
			cierto2:
				mov eax, ebx
			falso1:
				add rdx, 4
		loop while1
	ret