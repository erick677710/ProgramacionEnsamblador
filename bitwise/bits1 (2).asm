;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o bits1.o bits1.asm 
;gcc -c printb printb.c
;gcc64 -o bits1.exe bits1.o printb.o
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

; bits1.asm

section .data
	number1	dq	-72
 	number2 dq  1064

section .bss
section .text							
	global main						
main:
; XOR (exclusive OR)-----	
        mov rax,[number1]
        xor rax,[number2]
        mov rcx, rax
	
; OR ---------------------            
        mov rax,[number1]
        or rax,[number2]
        mov rcx, rax
	
; AND  -------------------              		
        mov rax, [number1]
        and rax, [number2]
        mov rcx, rax
	
; NOT  -------------------             		

	mov rax, [number1]
	not rax
	mov rcx, rax
	
; SHL (shift left)--------              	
	mov rax, [number1]
	shl al, 2
 	mov rcx, rax
	
; SHR (shift right)-------            		
	mov rax, [number1]
	shr al, 2
 	mov rcx, rax
	
; SAL (shift arithmetic left)----------------              	

	mov rax, [number1]
	sal al, 2
  	mov rcx, rax
	
; SAR (shift arithmetic right)---------------              		
 	mov rax, [number1]
	sar al, 2
  	mov rcx, rax
	
; ROL (rotate left)--------------------------              		
  	mov rax, [number1]
	rol al, 2
   	mov rcx, rax
	
 	mov rax, [number2]
	rol al, 2
 	mov rcx, rax
		
; ROR (rotate right)-------------------------             	
 	mov rax, [number1]
	ror al, 2
  	mov rcx, rax
	
  	mov rax, [number2]
	ror al, 2
  	mov rcx, rax
	
ret		


