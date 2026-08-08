;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o ex2.o ex2.asm -l ex2.lst
;link:	   -->> gcc -o ex2 ex2.o
;run:      -->> ex2
;debugger: -->> x64dbg ex2
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: ex2.asm (nombre programa)
;registro:
;nombres y apellidos:

global main 
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas
  arreglo dd 1,-2,10,-20,6,20,40,10
  msj1 db 10,"INGRESAR NUMERO DE ELEMENTOS DEL ARREGLO: ",0
  msj2 db 10,"EL PROMEDIO DEL ARREGLO ES: %d", 0
  fmt db "%d",0

segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
  numero resd 1
  promedio resd 1
segment .text 				
main:
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
;...
;...

  sub rsp,0x20
  
  mov rcx,msj1
  call printf
  
  mov rcx,fmt
  mov rdx,numero
  call scanf
  
  mov ecx,[numero]
  mov rdx,arreglo
  
  call CalcPromedio
  mov [promedio],eax
  
  mov rcx,msj2
  mov edx,[promedio]
  call printf
   
   add rsp,0x20
ret


;--------------------------------------
;============ subrutina ===============
;--------------------------------------
;aqui instrucciones subrutina (funcion)
;...
;...

   CalcPromedio:
         xor rsi,rsi 
		 xor r10,r10  
		 xor r11,r11 
		 xor r12,r12   
		 xor r13,r13  
		 xor r14,r14   
		 xor rax,rax
		 
		 
		 ciclo:
		     
			  
			   mov r10d,[rdx+rsi]
			   mov r11d,r10d
			   shl r11d,1
			   jnc poner
			   jmp avanzar
			   
			   
			   poner:
			     mov r11d,r10d
				 sar r11d,1
				 jc avanzar
				 
				 mov r11d,r10d
				 add r12d,r11d
				 inc r13d
			   
			   
			   
			   avanzar:
	           add rsi,4
			   inc r14b
			   cmp r14b,cl
			   jl ciclo
			   
			   
		  cmp r13d,0 ; para que no divida entre 0
          je salto
		  
		   mov eax,r12d	 
           cdq
           idiv r13d
        		   
          salto:			   
			   
		 
ret