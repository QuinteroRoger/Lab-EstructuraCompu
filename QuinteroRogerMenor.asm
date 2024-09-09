.data
 mensaje1: .asciiz "Ingresa el primer numero: "        # Se definen los mensajes a imprimir por consola, con el fin de, guiar al usuario con los pasos a seguir
 mensaje2: .asciiz "\nIngresa el segundo numero: "
 mensaje3: .asciiz "\nIngresa el tercer numero: "
 result: .asciiz"\El menor numero es: " 
 
.text
.globl main
 
 main:
   li $v0,4       # Desde li hasta syscall, es el codigo que se utiliza en todo el script, para imprimir los mensajes.
   la $a0,mensaje1
   syscall
   
   li $v0,5     # Este apartado se emplea para recibir los datos que ingrese el usuario, en este caso, aca la consola recibe el primer numero y lo guarda en $t0 
   syscall
   move $t0, $v0
   
   li $v0,4
   la $a0,mensaje2
   syscall
   
   li $v0,5    # Nuevamente aqui, la consola recibe el segundo numero que digite el usuario y se almacena en $t1
   syscall
   move $t1, $v0
   
   li $v0,4
   la $a0,mensaje3
   syscall
   
   li $v0,5     # Aca se recibe el tercer numero y se almacena en $t2
   syscall
   move $t2, $v0
   
   move $t3, $t0 # el primer numero ingresado, se guarda en $t3
   
   bgt $t3, $t1, segundo_menor  #se procede a comparar entre el primer numero y el segundo, para determinar cual es mayor.
   
   bgt $t3, $t2, tercero_menor  # se compara entre el primero y tercer numero.
   j resultado    
 segundo_menor:
   move $t3, $t1       # En este apartado de segundo_menor, en caso de que $t1 sea menor, $t3 toma el valor de $t1.
   
   bgt $t3, $t2, tercero_menor   # se compara el valor guardado en $t3 con el tercer numero.
   j resultado
   
 tercero_menor:
   move $t3, $t2   # Aqui se realiza lo mismo que en segundo_menor
   
 resultado: 
   li $v0,4            #en esta parte se imprimira el mensaje de cual numero es el menor
   la $a0, result
   syscall
   
   move $a0, $t3     # El numero que haya sido el menor, se guarda en $v0 y se imprime en la consola
   li $v0,1
   syscall
   
   li $v0,10   #Este apartado se usa para terminar el programa.
   syscall
