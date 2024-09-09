.data
 mensaje1: .asciiz "Ingresa el primer numero: "
 mensaje2: .asciiz "\nIngresa el segundo numero: "   # Se definen los mensajes a imprimir por consola, con el fin de, guiar al usuario con los pasos a seguir
 mensaje3: .asciiz "\nIngresa el tercer numero: "
 result: .asciiz"\El mayor numero es: " 
 
.text
.globl main
 
 main:
   li $v0,4    
   la $a0,mensaje1           # Desde li hasta syscall, es el codigo que se utiliza en todo el script, para imprimir los mensajes.
   syscall
   
   li $v0,5
   syscall                    # Este apartado se emplea para recibir los datos que ingrese el usuario, en este caso, aca la consola recibe el primer numero y lo guarda en $t0
   move $t0, $v0
   
   li $v0,4
   la $a0,mensaje2
   syscall
   
   li $v0,5
   syscall            # Nuevamente aqui, la consola recibe el segundo numero que digite el usuario y se almacena en $t1
   move $t1, $v0
   
   li $v0,4
   la $a0,mensaje3
   syscall
   
   li $v0,5
   syscall             # Aca se recibe el tercer numero y se almacena en $t2
   move $t2, $v0
   
   move $t3, $t0          # el primer numero ingresado, se guarda en $t3
   
   blt $t3, $t1, segundo_mayor     #se procede a comparar entre el primer numero y el segundo, para determinar cual es menor.
   
   blt $t3, $t2, tercero_mayor   # se compara entre el primero y tercer numero.
   j resultado
 segundo_mayor:
   move $t3, $t1          # En este apartado de segundo_mayor, en caso de que $t1 sea mayor, $t3 toma el valor de $t1.
   
   blt $t3, $t2, tercero_mayor     # se compara el valor guardado en $t3, con el tercer numero.
   j resultado
   
 tercero_mayor:
   move $t3, $t2           # Aqui se realiza lo mismo que en segundo_mayor
   
 resultado:
   li $v0,4
   la $a0, result           #en esta parte se imprimira el mensaje de cual numero es el mayor
   syscall
   
   move $a0, $t3         # El numero que haya sido el mayor, se guarda en $v0 y se imprime en la consola
   li $v0,1
   syscall
   
   li $v0,10        #Este apartado se usa para terminar el programa.
   syscall
   
