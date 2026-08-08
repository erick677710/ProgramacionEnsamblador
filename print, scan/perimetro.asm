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

;perimetro.asm
;cálculo del Perímetro de un rectángulo de base "b" y altura "h": ->  p = 2*(b + h) 
;el Perímetro de un rectángulo es igual a la suma de todos sus lados.

extern printf, scanf

section .data					
    msj1	db      "ingresar base b: ", 0
	msj2	db		"ingresar altura h: ", 0
	msj3	db		"perimetro = %lld", 10, 0
	fmt		db		"%lld", 0		 ; 64 bits -> %lld (long long)	
	
section .bss
base		resq	1
altura		resq	1    
perimetro	resq	1
	
section .text							
    global main					
main:	
;--- printf -------
sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
    mov rcx, msj1	; string to display in rcx
    call printf
	
;--- scanf --------
	mov rdx, base	; referencia -> "C/C++" scanf("%lld", &base)
	mov rcx, fmt	; referencia
	call scanf
	
;--- printf -------
;;sub rsp, 0x20		; 32 bytes (4 argumentos) -> shadow space
    mov rcx, msj2	; string to display in rcx
    call printf
	
;--- scanf --------
	mov rdx, altura	; referencia -> "C/C++" scanf("%lld", &altura)
	mov rcx, fmt	; referencia
	call scanf
	
;------------------------
	mov rax, [base]
	add rax, [altura]
	shl rax, 1
	mov [perimetro], rax ;perimetro = 2*(base + altura)
;-----------------------
	
;--- printf perimetro -------	
	mov rdx, [perimetro]; valor
	mov rcx, msj3	 	; string to display in rcx
    call printf
add rsp, 0x20		 	; 32 bytes (4 argumentos) -> shadow space
	ret