;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;.text=   0X00401550
;.data=   0x00403010

segment .data
bNumA db 63
bNumB db 17
bNumC db 5

;..............
wNumA dw 4321
wNumB dw 1234
wNumC dw 167

;..............
dNumA dd 42000
dNumB dd 3157
dNumC dd 293

;..............
qNumA dq 730000
qNumB dq 13456
qNumC dq 1279


;bAns1 = bNumA / 3		 ; unsigned
;bAns2 = bNumA / bNumB	 ; unsigned
;bRem2 = bNumA % bNumB	 ; % is modulus
;bAns3 = (bNumA * bNumC) / bNumB ; unsigned
;wAns1 = wNumA / 5 ; unsigned
;wAns2 = wNumA / wNumB	 ; unsigned
;wRem2 = wNumA % wNumB	 ; % is modulus
;wAns3 = (wNumA * wNumC) / wNumB ; unsigned
;dAns = dNumA / 7 ; signed
;dAns3 = dNumA * dNumB	 ; signed
;dRem1 = dNumA % dNumB	 ; % is modulus
;dAns3 = (dNumA * dNumC) / dNumB ; signed
;qAns = qNumA / 9		 ; signed
;qAns4 = qNumA * qNumB	 ; signed
;qRem1 = qNumA % qNumB	 ; % is modulus
;qAns3 = (qNumA * qNumC) / qNumB ; signed
		
segment .bss
bAns1 resb 1
bAns2 resb 1
bRem2 resb 1
bAns3 resb 1

;...........
wAns1 resw 1
wAns2 resw 1
wRem2 resw 1
wAns3 resw 1

;...........
dAns1 resd 1
dAns2 resd 1
dRem2 resd 1
dAns3 resd 1

;...........
qAns1 resq 1
qAns2 resq 1
qRem2 resq 1
qAns3 resq 1

segment .text 

global main 					
main:
;------------------------------------	
;   example byte operations, unsigned

; bAns1 = bNumA / 3 (unsigned)
mov al, [bNumA]
mov ah, 0
mov bl, 3
div bl			 ; al = ax / 3
mov [bAns1], al

; bAns2 = bNumA / bNumB (unsigned)
mov ax, 0
mov al, [bNumA]
div byte [bNumB] ; al = ax / bNumB
mov [bAns2], al
mov [bRem2], ah  ; ah = ax % bNumB

; bAns3 = (bNumA * bNumC) / bNumB (unsigned)
mov al, [bNumA]
mul byte [bNumC] ; result in ax
div byte [bNumB] ; al = ax / bNumB
mov [bAns3], al	 ; cociente

; -----
; example word operations, unsigned

; wAns1 = wNumA / 5 (unsigned)
mov ax, [wNumA]
mov dx, 0
mov bx, 5
div bx ; ax = dx:ax / 5
mov word [wAns1], ax

; wAns2 = wNumA / wNumB (unsigned)
mov dx, 0
mov ax, [wNumA]
div word [wNumB] ; ax = dx:ax / wNumB
mov [wAns2], ax
mov [wRem2], dx

; wAns3 = (wNumA * wNumC) / wNumB (unsigned)
mov ax, [wNumA]
mul word [wNumC] ; result in dx:ax
div word [wNumB] ; ax = dx:ax / wNumB
mov [wAns3], ax

;--------------------------------------------
;example doubleword operations, signed

; dAns1 = dNumA / 7 (signed)
mov eax, [dNumA]
cdq ; eax → edx:eax
mov ebx, 7
idiv ebx ; eax = edx:eax / 7
mov dword [dAns1], eax

; dAns2 = dNumA / dNumB (signed)
mov eax, [dNumA]
cdq ; eax → edx:eax
idiv dword [dNumB] ; eax = edx:eax/dNumB
mov [dAns2], eax
mov [dRem2], edx   ; edx = edx:eax%dNumB

; dAns3 = (dNumA * dNumC) / dNumB (signed)
mov eax, [dNumA]
imul dword [dNumC] ; result in edx:eax
idiv dword [dNumB] ; eax = edx:eax/dNumB
mov [dAns3], eax

; -----
;example quadword operations, signed
; qAns1 = qNumA / 9 (signed)
mov rax, [qNumA]
cqo ; rax → rdx:rax
mov rbx, 9
idiv rbx ; eax = edx:eax / 9
mov [qAns1], rax

; qAns2 = qNumA / qNumB (signed)
mov rax, [qNumA]
cqo ; rax → rdx:rax
idiv qword [qNumB] ; rax = rdx:rax/qNumB
mov [qAns2], rax
mov [qRem2], rdx   ; rdx = rdx:rax%qNumB

; qAns3 = (qNumA * qNumC) / qNumB (signed)
mov rax, [qNumA]
imul qword [qNumC] ; result in rdx:rax
idiv qword [qNumB] ; rax = rdx:rax/qNumB
mov [qAns3], rax

ret






