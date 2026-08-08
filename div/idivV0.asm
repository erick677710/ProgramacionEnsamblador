;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;debugger  -->> x64dg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;programa de division (CS).
;Signed division requires some help
;We extended an unsigned 16 bit number to 32 bits by placing zeros in the upper 16 bits
;This will not work for signed numbers
;To extend signed numbers, you have to copy the sign bit into those upper bit positions
;Intel provides three instructions in aiding sign extension
;All three take no operands

;CBW    converts byte to word (extends AL into AH)
;CWD    converts word to doubleword (extends AX into DX)-->>DX:AX
;CDQ    converts doubleword to quadword (extends EAX into EDX) 	
;CQO	converts quadword to octaword (extends RAX into RDX) 			
;----------------------------------------------------------------

;file: idiv.asm

extern printf, scanf		

segment .data
dividendo1	dq	922337203685477585
divisor1	dd  2147483647

dividendo2	ddq	0x1922337203685477585085
divisor2	dq  0x21474836470851

segment .bss
cociente1 resd 1
residuo1  resd 1

cociente2 resq 1
residuo2  resq 1
		
segment .text 
global main 					
main:
;divisiones co signo(CS) IMUL (CS): -95/12
;dividir: -95/12
	NOP
	MOV AX, -95			;AX=0xFFA1
	MOV CL, +12			;CL=0xC
	IDIV CL				;AX=0xF5F9
;produce -7d=0xF9 como cociente en AL y -11d=0xF5 como residuo en AH
;-------------------------------------------------------------------
	NOP
	MOV AL, -95			;AL=0xA1
	CBW					;AH=0xFF -->> AX=0xFFA1
	MOV CL, 12			;CL=0xC
	IDIV CL				;AX=0xF5F9
;produce -7d=0xF9 como cociente en AL y -11d=0xF5 como residuo en AH
;-------------------------------------------------------------------

	NOP
	MOV AX, -5147		;AX=0XEBE5
	CWD             	;DX=0XFFFF
	MOV CX, 300			;CX=0X12C
	IDIV CX				;AX=0xFFEF:DX=0xFFD1
;produce -17d= 0xFFEF como cociente en AX y -47d= 0xFFD1 como residuo en DX

;-----------------------------------------------------------------------
	NOP
	MOV EAX, -514732	;EAX=0XFFF82554
	CDQ					;EBX=0XFFFFFFFF
	MOV ECX, 3000		;ECX=0XBB8
	IDIV ECX 
; cociente EAX= 0xFFFF_FF55= - 171
; residuo  EDX= 0xFFFF_F93C= -1732

;----------------------------------------------------
	NOP
	MOV EAX, [dividendo1]	;EAX=0xCCCCCCD1
	MOV EDX, [dividendo1+4]	;EBX=0xCCCCCCC
	MOV ECX, [divisor1]		;ECX=0x7FFFFFFF
	IDIV ECX 
; cociente EAX= 0x19999999= 429496729
; residuo  EDX= 0x6666666A= 1717986922
	MOV [cociente1], eax
	MOV [residuo1], edx 

;------------------------------------------
	NOP
	MOV RAX, [dividendo2]	;RAX=0x7203685477585085
	MOV RDX, [dividendo2+8]	;RBX=0x0000000000192233
	MOV RCX, [divisor2]		;RCX=0x0021474836470851
	IDIV RCX 
; cociente EAX= 0x
; residuo  EDX= 0x
	MOV [cociente2], RAX	;0X00000000C1582A51
	MOV [residuo2], RDX		;0X000BCBE3B6A964E4
ret




