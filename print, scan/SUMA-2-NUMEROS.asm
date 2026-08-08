;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI (Application Binary Interface):
;rcx, rdx, r8, r9 	->   for integers 		   (left to right)-->> primeros 4 parametros enteros
;Remaining arguments are passed via the stack  (right to left)-->> [rsp+0x20],[rsp+0x28]......
;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:		-> 	 rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.					   	 
;VOLATILE(scratch): ->   rax, rcx, rdx, r8, r9, r10, r11
;Integers are returned in rax or rdx:rax.

;suma-2-numeros.asm

extern printf, scanf

section .data					
    msj1	db   10,"ingresar primer numero: ", 0
	msj2	db      "ingresar segundo numero: ", 0
	msj3	db		"la suma es: %lld", 10, 0
	fmt		db		"%lld", 0		 ; 64 bits -> %lld (long long)	
	
section .bss
	numero1	resq	1
	numero2	resq	1
	suma	resq    1
	
section .text							
    global main					
main:	
;--- printf("ingresar primer numero: "); -------
sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
    mov rcx, msj1	; cadena a desplegar en rcx por "referencia"
    call printf
	
;--- scanf("%lld",numero1) --------
	mov rdx, numero1; referencia -> "C/C++" scanf("%lld",numero)
	mov rcx, fmt	; referencia
	call scanf
	
;--- printf("ingresar segundo numero: "); -------
    mov rcx, msj2	; cadena a desplegar en rcx por "referencia"
    call printf
	
;--- scanf("%lld",numero2) --------
	mov rdx, numero2; referencia -> "C/C++" scanf("%lld",numero)
	mov rcx, fmt	; referencia
	call scanf
	
;----------------------
	mov rax, [numero1]	
	add rax, [numero2]
	mov [suma], rax

;--- printf("la suma es: %lld", suma); ------	
	mov rdx, [suma]	 ; valor
	mov rcx, msj3	 ; cadena a desplegar en rcx por "referencia"
    call printf
add rsp, 0x20		 ; 32 bytes (4 argumentos) -> shadow space
	ret