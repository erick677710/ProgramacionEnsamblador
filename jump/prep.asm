;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o prep.o prep.asm -l prep.lst
;link:	   -->> gcc -o prep prep.o
;run:      -->> prep
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: negativoSF

;INSTRUCCIÓN -> JS (jump if negative) SF=1		

segment .data
		
segment .bss
num_neg	RESB  1

segment .text 
global main 					
main:
;--------------------------
xor rax,rax
xor rbx,rbx
xor rcx,rcx
mov rax,0
mov rcx,2
sub rax,10
    JS pala
    jmp fin
pala:
	idiv cl
	cmp dx,0
	jz xd
	jmp fin
xd:
    mov rax,10
fin:	
	RET