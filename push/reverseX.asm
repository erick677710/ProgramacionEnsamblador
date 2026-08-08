;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: reverseX.asm

	

segment .data
array	DQ 10, 20, 30, 40  ;array to be reversed
n		DQ 2			   ; n/2
			
segment .bss

segment .text 
global main 					
main:

    xor rsi, rsi
	xor rdi, rdi
	xor rax, rax
	xor rbx, rbx

	mov rcx, [n]			    ;sets the counter in the reverseLoop
	xor rdx, rdx				;indice
reverseLoop:
	mov rax, [array+rdx*8]	    ;move the element to eax
	mov rbx, [array+rdx*8+24]	;move the element to ebx

	xchg rax, rbx			    ;exchange the two elements

	mov [array+rdx*8], rax	    ;move the element in eax, to the array
	mov [array+rdx*8+24], rbx	;move the element in ebx, to the array

	inc rdx						;increase esi to take the next element in the array (from the left)
				
	loop reverseLoop	
ret
	




