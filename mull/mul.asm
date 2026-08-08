;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o mul.o mul.asm -l mul.lst
;link:	   -->> gcc -o mul mul.o
;run:      -->> mul
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

; programa de multiplicacion. 
;file: mul.asm

extern printf, scanf		

segment .data
a	DB	10
b	DB	25

c	DW	0x100		;256
d	DW	0x2000		;8192
		
segment .bss
;block storage start
;aqui van las variables declaradas pero sin inicializar

segment .text 
global main 					
main:
	xor rax, rax			
;--------------MUL (Sin Signo)--------------------------------------
;multiplicación 8-bits
	mov AL, 100	;AL= 0x64
	mov DL, 25	;DL= 0x19
	MUL DL		; producto: AX = AL*DL
;produce 100*25=2500=0x09C4 en el registro AX

;---------------IMUL (Con Signo)-------------------------------------
	mov DL, 0xFF  ; DL = -1
	mov AL, 0xBE  ; AL = -66
	IMUL DL		 ; producto: AX = AL*DL
;produce (-1)*(-66)=66=0x0042 en el registro AX(resultado cabe en AL)
;si se usara MUL en vez de IMUL el resultado seria AX=0xBD42 (-> ERROR)

;-------------------------------------------------------
	nop
	mov al, [a]		; AL = 0x0A
	MUL byte[b]		; multiplicador en memoria [b] = 0x00FA

;--------------MUL (Sin Signo)--------------------------------------
;multiplicación 16-bits
	mov AX, [c]		;256
	mov CX, [d]		;8192
	MUL CX			;DX:AX = AX*CX = 0x0020_0000 = 2097152
	
;--------------MUL (Sin Signo)  --------------------------------------
;multiplicación 32-bits
	mov EAX, 0x123456
	mov ECX, 0x100000
	MUL ECX			;EDX:EAX = EAX*ECX = 0X0000_0123 : 4560_5000

;--------------MUL (Sin Signo)  --------------------------------------
;multiplicación 64-bits
	mov RAX, 0x123456789AB
	mov RCX, 0x10000000000
	MUL RCX			;RDX:RAX = RAX*RCX = 0x0000000000012345 : 6789AB0000000000
ret

