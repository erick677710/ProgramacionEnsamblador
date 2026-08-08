;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;rcx, rdx, r8, r9 (left to right)-->> primeros 4 parametros enteros windows
;Remaining arguments are passed via the stack (right to left).
;file: push1.asm

segment .data
dato	DQ	0xabcdefabcdefabcd	
	
segment .bss

segment .text 
global main 					
main:
;---------------------------------------
; solo valores de 16 o 64 bits	
	mov rax, 0x1234567812345678

	push rax
	push 0xFFFFFFFFFFFFFFFF		 ; -->> There is no push imm64    0x1234567812345678
	;;push 0x8000000000000000	 ; NO solo inm8, inm16, inm32
	;;push 0x7FFFFFFFFFFFFFFF	 ; NO solo inm8, inm16, inm32	 
	push 18446744073709551615	 ;largest possible 64-bit number
	push qword[dato]
	;push eax -> no soportado (32 bits) en modo 64 bits
	push ax

	ret
                                                                                                                                      




