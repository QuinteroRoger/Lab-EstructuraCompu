.data
 mensaje1: .asciiz"¿Cuantos numeros desea generar?"
 linea: .asciiz "\n"                                   # En este apartado tenemos los mensajes que se imprimiran cuando se ejecute todo el codigo
 result: .asciiz"El numero en serie Fibonacci es: "
 
 .text
 .globl main
 main:
  li $v0,4     # Esta parte hasta syscall, se utiliza para imrpirmir los mensejas anteriores, colocando el nombre de la variable donde se guardaron.
  la $a0,mensaje1
  syscall
  
  li $v0,5
  syscall        # Este pequeño codigo, se usa para recibir el numero que ingrese el usuario y se guardara en $t0
  move $t0, $v0
  
  li $t1,0    #Aqui da inicio a los dos primeros numeros de la serie Fibonacci
  li $t2,1
  li $v0,4    # En esta parte imprime el mensaje guardado en "result"
  la $a0,result
  syscall
  
  move $a0,$t1   # Aca carga el valor guardado en $t1 a $a0
  
  li $v0,1    # Aqui lo imprime
  syscall
  
  li $v0,4
  la $a0, linea    # Se imprime "linea" que es para realizar un salto de linea
  syscall
  
  blez $t0,fin   # En este apartado se determina si el usuario pide mas de un numero, en caso de que sea 0 o un numero negativo, se termina el programa
  
  li $v0,4
  la $a0, result
  syscall
  
  move $a0, $t2  # Guarda el segundo numero en $a0
  li $v0,1
  syscall
  
  li $v0,4
  la $a0,linea
  syscall
  
  li $t3,2  # Aca se inicia un contador para conocer cuantos numeros se han imprimido
  
 inicio: #Inicio de un ciclo
  beq $t3, $t0, fin   #Aqui se verifica si ya se imprimieron los numeros que pidio el usuario
  
  add $t4, $t1, $t2   
  move $t1, $t2     # En esta parte se inicia el calculo de los siguientes numeros de fibonacci y se van actualizando
  move $t2, $t4
  
  li $v0,4
  la $a0, result
  syscall
  
  move $a0, $t4
  
  li $v0,1
  syscall
  
  li $v0,4
  la $a0, linea
  syscall
  
  addi $t3, $t3,1 #Aca se incrementa el contador
  j inicio  # Repite el ciclo
  
 fin:
  li $v0,10   #Termina el programa
  syscall
  
