;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: idiv.asm (nombre programa)
;registro
;nombres y apellidos

segment .data
		
segment .bss

segment .text 
global main 					
main:	
	mov    rax,  0x8000000000000000   	; INT64_MIN = -9223372036854775808
	mov    ecx,  10           			; implicit zero-extension is fine for positive numbers
	cqo                       			; sign-extend into RDX, in this case = -1 = 0xFF...FF
	idiv   rcx
										; quotient  = RAX = -922337203685477580 = 0xf333333333333334
										; remainder = RDX = -8                  = 0xfffffffffffffff8
ret





