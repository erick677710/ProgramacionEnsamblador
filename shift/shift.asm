;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o P1.obj P1.asm -l P1.lst
;link:	   -->> gcc64 -o P1 P1.obj
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

; shift.asm
extern printf

section .data
	number1	dq	+8	
    number2 dq  -8

section .bss

section .text							
	global main						
main: 

;SHL			
;positive number
;"SHL 2 = OK multiply by 4"
        mov rax,[number1]
        shl rax, 2		;multiply by 4 (logic)
;negative number
;"SHL 2 = OK multiply by 4"        
        mov rax,[number2]
        shl rax, 2		;multiply by 4 (logic)
 	
;-------------------------------------------------
nop
;SAL
;positive number
;"SAL 2 = correctly multiply by 4";     
        mov rax,[number1]
        sal rax, 2		;multiply by 4 (arithmetic)	
;negative number
;"SAL 2 = correctly multiply by 4"      
        mov rax,[number2]
        sal rax, 2		;multiply by 4 (arithmetic)
	
;-------------------------------------------------
nop
;SHR
;positive number
;"SHR 2 = OK divide by 4"
        mov rax,[number1]
        shr rax, 2		;divide by 4 (logic)
;negative number
;"SHR 2 = wrong divide by 4"
        mov rax,[number2]
        shr rax, 2		;divide by 4 (logic)
	
;------------------------------------------------
nop
;SAR
;positive number
;"SAR 2 = correctly divide by 4"
        mov rax,[number1]
        sar rax, 2		;divide by 4 (arithmetic)
;negative number
;"SAR 2 = correctly divide by 4"
        mov rax,[number2]
        sar rax, 2		;divide by 4 (arithmetic)
ret

