/* para mirar el codigo ensamblador generado por el compilador del lenguaje C,
usar la opción “-S” en la linea de comandos: gcc -O -S programa.c -masm=intel*/

/* gcc -O0 -o 001 001.c*/
//file: ia32logicas.c

#include <stdio.h>

// código en lenguaje C
char x = 'a';  		//a = 0x61  -> 'a'


int main() 
{

	x  = x & 0x20;	//	a = 0x41
	x &= 0x20;
  
  return 0;
}









