
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;nasm -f win64 -o %1.o %1.asm -l %1.lst
;x86_64-w64-mingw32-gcc.exe -o %1.exe %1.o
;x86_64-w64-mingw32-gcc.exe %1.c -o %1.exe
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;Microsoft x64 ABI:
;rcx, rdx, r8, r9 -->> for integers ;(left to right)-->> primeros 4 parametros enteros windows
;Remaining arguments are passed via the stack (right to left)-->> [rsp+0x20],[rsp+0x28]......
;xmm0, xmm1, xmm2, xmm3 -->> for floats

;The only registers that the called function is required to preserve (the calle-save registers) are: 
;NON VOLATILE:	rbx, ,rsi, rdi, rbp, rsp, r12, r13, r14, r15. All others are free to be changed by the called function.
;				xmm6 - xmm15


;VOLATILE(scratch): rax, rcx, rdx, r8, r9, r10, r11
;					xmm0 - xmm5

;Integers are returned in rax or rdx:rax, and floating point values are returned in xmm0 or xmm1:xmm0.

;file: %1.asm

;.text=   0X004016E0
;.data=   0x00403000

%macro  prologue 0
        push    rbp
        mov     rbp,rsp
        push    rbx
        push    r12
        push    r13
        push    r14
        push    r15
%endmacro

%macro  epilogue 0
        pop     r15
        pop     r14
        pop     r13
        pop     r12
        pop     rbx
        pop     rbp	;leave
%endmacro

extern printf, scanf		

segment .data

segment .rodata
		
segment .bss

segment .text 

global main 					
main:
;---------------------------------------	

ret
;---------------------------------------
;..........subrutina....................	




