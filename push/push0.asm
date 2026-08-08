;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: push-FINAL.asm

;.text=   0X004016E0
;.data=   0x00403000

; Formatos válidos:
;	PUSH reg
;	PUSH tamaño mem
;El operando ha de ser de 16 o 64 bits.

;PUSH imm
;El valor inmediato puede ser de 8, 16 o 32 bits.

segment .data
variable	dq 0xABCDEFABCDEFABCD
			
segment .bss
x RESQ 1

segment .text 

global main 					
main:
;--------------------------
MOV RAX, 0x1234567812345678
MOV RBX, variable
;--------------------------	
	PUSH RAX	
	PUSH qword[variable]
	PUSH 65535		
	PUSH 65536		;32-bit immediate sign-extended to 64 bits
	PUSH +2147483647
	PUSH -2147483648
	
;--------------------------
		POP R10
		POP R12
		POP qword[x]
	PUSH WORD [variable]
	PUSH QWORD [RBX]
	PUSH 0xA0
	PUSH 0xA0B0
ret




