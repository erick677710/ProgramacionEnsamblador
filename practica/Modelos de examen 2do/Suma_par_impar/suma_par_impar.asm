;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o suma_par_impar.o suma_par_impar.asm -l suma_par_impar.lst
;link:	   -->> gcc -o suma_par_impar suma_par_impar.o
;run:      -->> suma_par_impar
;debugger: -->> x64dbg suma_par_impar
;Direccion de incicio 401550
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: suma_par_impar.asm (nombre programa)
;registro:
;nombres y apellidos:

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
	msj		db	10, "Bienvenido", 10, "------------", 10, 0
	msj1	db	"Ingrese la cantidad de elementos (max 50): ", 0
	msj2	db	"Ingrese el elementos %d: ", 0
	msj3	db	"La suma de los elementos pares es: %d", 10, 0
	msj4	db	"La suma de los elementos impares es: %d", 10, 0
	fmt		db	"%d",0
	
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
	cant	resd	1
	vec		resd	50
	sump	resd	1
	sumimp	resd	1
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
	mov rdx, cant
	call scanf
	


	mov rbx, vec
	xor	r13, r13
	
	for:
		cmp	r13d, [cant]
		jl cierto
		jmp fin
		cierto:
		
		mov rcx, msj2
		mov rdx, r13
		call printf
		
		mov rcx, fmt
		mov rdx, rbx
		call scanf
		
		add rbx, 4
		inc r13
		jmp for
	fin:
	
	mov ecx, [cant]
	mov rdx, vec
	call sumaPar
	mov [sump], eax
	
	mov rcx, msj3
	mov rdx, [sump]
	call printf
	
	mov ecx, [cant]
	mov rdx, vec
	call sumaImpar
	mov [sumimp], eax
	
	mov rcx, msj4
	mov rdx, [sumimp]
	call printf
	
	add rsp, 0x20
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------

	sumaPar:
		xor ebx, ebx	;acumulador	
		mov r8, rdx
		while:
			mov r11d, [r8]
			mov eax, r11d
			mov r13d, 2
			cdq
			idiv r13d
			cmp edx, 1
			je npar
				add ebx, r11d
			npar:
			add r8, 4
		loop while
		mov eax, ebx
	ret
	
	sumaImpar:
		xor ebx, ebx	;acumulador	
		mov r8, rdx
		while1:
			mov r11d, [r8]
			mov eax, r11d
			mov r13d, 2
			cdq
			idiv r13d
			cmp edx, 0
			je npar1
				add ebx, r11d
			npar1:
			add r8, 4
		loop while1
		mov eax, ebx
	ret