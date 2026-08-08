;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o dancing.o dancing.asm -l dancing.lst
;link:	   -->> gcc -o dancing dancing.o
;run:      -->> dancing
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: dancing.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dw -29
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
xor rcx,rcx
xor rax,rax
xor rbx,rbx

mov ax,111

push AX
PUSH word[a]
pop bx
inc bx
sub ax,cx
push ax
nop
pop cx
pop bx
ret
;---------------------------------------
;..........subrutinas....................	
