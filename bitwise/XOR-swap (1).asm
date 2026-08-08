;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CMP resta pero no guarda
;-----------------------------------------

;file: XOR-swap.asm

;two values A and B are to be exchanged. The
;following algorithm could be used:
;A = A  xor  B
;B = A  xor  B
;A = A  xor  B

extern printf, scanf		

segment .data
A	DD	0xF631024C ; load some data
B	DD	0x17539ABD ; load some data
		

segment .text 
global main 					
main:
mov eax, [A]
mov ebx, [B]
	xor eax, ebx  ; A XOR B
	xor ebx, eax  ; B XOR A
	xor eax, ebx  ; A XOR B
mov [A], eax
mov [B], ebx
ret



