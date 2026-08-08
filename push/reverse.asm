;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: reverse.asm

segment .data
array	DQ 10, 20, 30, 40  ;array to be reversed
n		DQ 2			   ; n/2
			
segment .bss

segment .text 
global main 					
main:
	mov rsi, array		;move first element address to esi
	mov rdi, array + 24	;move last element address to edi
	
	mov rcx, [n]	    ;sets the counter in the reverseLoop

reverseLoop:
	mov rax, [rsi]	    ;move the element in esi to eax
	mov rbx, [rdi]		;move the element in edi to ebx

	xchg rax, rbx	    ;exchange the two elements

	mov [rsi], rax	    ;move the element in eax, to the address in esi
	mov [rdi], rbx		;move the element in ebx, to the address in edi

	add rsi, 8			;increase esi to take the next element in the array (from the left)
	sub rdi, 8			;decrease edi to take the next element in the array (from the right)

	loop reverseLoop	
ret
	




