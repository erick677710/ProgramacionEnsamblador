;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o %1.o %1.asm -l %1.lst
;x86_64-w64-mingw32-gcc.exe -o %1.exe %1.o
;x86_64-w64-mingw32-gcc.exe %1.c -o %1.exe
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: mul-shift.asm
;segment.text=   0X00401550
;segment.data=   0x00403010

;ejemplo:

;				0011
;		*)		0101
;				----
;				0011
;		+) 	   0000
;		  	  0011
;            0000
;		 	--------
;			00001111

segment .data
a	db		255
b	db		255

c   dw		65535
d   dw		65535

e	dd 		4294967295
f	dd		4294967295

segment .bss

segment .text 
global main 					
main: 
;----------- 8 bits -------	
			nop
			xor eax, eax
			xor ebx, ebx
			xor ecx, ecx
			
			mov bl, [a]
			mov dl, [b]
			mov cl, 8
ciclo0:		shr dl, 1
			jnc nosumar0
				add ax, bx
nosumar0:	shl bx,1
			loop ciclo0

;----------- 16 bits ------
			nop
			xor eax, eax
			xor ebx, ebx
			xor ecx, ecx
			
			mov bx, [c]
			mov dx, [d]
			mov cx, 16
ciclo:		shr dx, 1
			jnc nosumar
				add eax, ebx
nosumar:	shl ebx,1
			loop ciclo
			
;------------ 32 bits ------
			nop
			xor rax, rax
			xor rbx, rbx
			xor rcx, rcx
			
			mov ebx, [e]
			mov edx, [f]
			mov ecx, 32
ciclo1:		shr edx, 1
			jnc nosumar1
				add rax, rbx
nosumar1:	shl rbx,1
			loop ciclo1
ret





