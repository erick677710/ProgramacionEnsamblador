;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

segment .data
wNumA dw  1200
wNumB dw -2000

dNumA dd  42000
dNumB dd -13000

qNumA dq  1200000
qNumB dq -2300000

;Realizar las siguientes operaciones de multiplicación:

;wAns1 = wNumA * -13
;wAns2 = wNumA * wNumB
;dAns1 = dNumA * 113
;dAns2 = dNumA * dNumB
;qAns1 = qNumA * 7096
;qAns2 = qNumA * qNumB
		
segment .bss
wAns1 resw 1
wAns2 resw 1
dAns1 resd 1
dAns2 resd 1
qAns1 resq 1
qAns2 resq 1

segment .text 

global main 					
main:
;---------------------------------------
	xor rax, rax
; wAns1 = wNumA * -13
	mov ax, [wNumA]
	imul ax, -13		  ; resultado en ax = 0xC310
	mov [wAns1], ax		  ; cuidado con el OVERFLOW
	
; wAns2 = wNumA * wNumB
	mov ax, [wNumA]
	imul ax, word [wNumB] ; resultado en ax = 0x6100
	mov [wAns2], ax		  ; cuidado con el OVERFLOW
	
; dAns1 = dNumA * 113
	mov eax, [dNumA]
	imul eax, 113		 ; resultado en eax = 0x00486B10
	mov [dAns1], eax	 ; cuidado con el OVERFLOW
	
; dAns2 = dNumA * dNumB
	mov eax, [dNumA]
	imul eax, [dNumB]    ; resultado en eax = 0xDF74B380
	mov [dAns2], eax	 ; cuidado con el OVERFLOW
	
; qAns1 = qNumA * 7096
	mov rax, [qNumA]
	imul rax, 7096		 ; resultado en rax = 0x00000001FB8BA400
	mov [qAns1], rax	 ; cuidado con el OVERFLOW
	
; qAns2 = qNumA * qNumB
	mov rax, [qNumA]
	imul rax, [qNumB]    ; resultado en rax = 0xFFFFFD7D632E3000
	mov [qAns2], rax	 ; cuidado con el OVERFLOW
	
;-----------------------
;3 operandos (destino y 2 operandos fuentes).
;The three-operand form is the only form where the destination register
;is not one of the factors in the product.
;this simply adds another factor to the multiplication:
	mov ebx, [dNumB]
	imul eax, ebx, 50	; resultado en eax = 0xFFF614F0
						; cuidado con el OVERFLOW
;eax= ebx*50 = -13000*50 = -650000 = 0xFFF614F0
;upper 32 bit are discarded but they are 0 anyways, so:
;eax = -650000 = 0xFFF614F0
	ret




