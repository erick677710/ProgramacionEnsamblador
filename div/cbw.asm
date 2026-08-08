;%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o P1.o P1.asm -l P1.lst
;gcc64 -o P1.exe P1.o
;%%%%%%%%%%%%%%%%%%%%%%%
;---------------------------------------

;file: cbw.asm

;programa de division (CS).
;Signed division requires some help
;We extended an unsigned 16 bit number to 32 bits by placing zeros in the upper 16 bits
;This will not work for signed numbers
;To extend signed numbers, you have to copy the sign bit into those upper bit positions
;Intel provides three instructions in aiding sign extension
;All three take no operands

;----------------------------------------------------------------
;CBW    converts byte to word (extends AL into AH)
;CWD    converts word to doubleword (extends AX into DX)-->>DX:AX
;CDQ    converts doubleword to quadword (extends EAX into EDX) 	
;CQO	converts quadword to octaword (extends RAX into RDX) 			
;----------------------------------------------------------------

segment .data
;aqui se declaran variables inicializadas
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
;---------------------------------------
		xor eax, eax
		mov al, +7
		cbw		;convierte byte ==>> word

		xor eax, eax
		mov al, -7
		cbw		;convierte byte ==>> word
		
		xor eax, eax
		mov ax, -7
		cwd		;convierte word ==>> dword

		xor eax, eax
		mov eax, -7
		cdq		;convierte dword ==>> quadword
		
		xor eax, eax
		mov rax, -7
		cqo		;convierte dword ==>> quadword


		
ret





