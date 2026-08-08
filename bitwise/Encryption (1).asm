;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: String Encryption  (encrypt.asm)

global main
extern printf

segment .data
mensaje		DB    "Mensaje Top Secret!", 0	; mensaje
key         DB    0b00010010				; clave 0x12

msj1		db	"Mensaje original:   %s", 10, 0
msj2		db	"Mensaje encriptado: %s", 10, 0			

segment .text
main:
sub rsp, 0x20
	mov rdx, mensaje
	mov rcx, msj1
	call printf
	
    mov  al,  [key]     ; pass the parameters
    mov  ecx, 20		; SIZEOF string
    dec  ecx            ; don't count the null char
    lea  rdx, [mensaje]
    call encrypt        ; Encrypt the string	
;------ print mensaje -------
	mov rdx, mensaje
	mov rcx, msj2
	call printf
;--------------------------------------------------
	mov  al,  [key]     ; pass the parameters
    mov  ecx, 20		; SIZEOF string
    dec  ecx            ; don't count the null char
    lea  rdx, [mensaje]
    call encrypt        ; Encrypt the string	
;------ print mensaje -------
	mov rdx, mensaje
	mov rcx, msj1
	call printf
add rsp, 0x20	
    ret

; Encrypt a string pointed by EDX according to an 8-bit key passed in AL
; Receives: AL  = 8-bit key
;           ECX = length of string to be encrypted
;           RDX = address of string to be encrypted
; Returns:  replace string pointed by EDX with the encrypted one

encrypt: 
L1:
    xor  [rdx], AL          ; encrypt char pointed by edx
    inc  rdx                ; point to next character
    loop L1
    ret                     ; return
