;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;set path
;path C:\emsamblador\Mingw64\bin
;assemble: -->> nasm -f win64 -o huevos.o huevos.asm -l huevos.lst
;link:	   -->> gcc -o huevos huevos.o
;run:      -->> huevos
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: huevos.asm (nombre programa)

extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
a dw 10,20,30,40,50,60
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
xor rcx,rcx
mov rcx,6
xor rbx,rbx
mov rbx,0
no:
push qword[a,rbx*8]
inc rbx
loop no
ret
;---------------------------------------
;..........subrutinas....................	
