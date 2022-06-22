.data

soma: .float 0.0
	
	.text

main:	

# Salva a quantidade de números
    li $v0, 5 
	syscall
	move $s0, $v0 
	
	addi $s1, $s1, 0 # contador
	l.s $f1, soma # será a soma dos numeros
	l.s $f2, soma # será a soma dos pesos
	
loop:	

# Salva o peso em f4
    li $v0, 6 
	syscall
	mov.s $f4, $f0 
	
    # Salva o número atual em f5
	li $v0, 6 
	syscall
	mov.s $f5, $f0 
	
    # multiplica peso e número
	mul.s $f6, $f4, $f5 
	
	add.s $f1, $f6, $f1 # soma os números já com seu peso
	add.s $f2, $f4, $f2 # soma dos pesos
	
	addi $s1, $s1, 1 # soma um ao contador
	
	slt $t0, $s1, $s0 # t0 = 1 se o contador < quantidade numeros
	beq $t0, 1, loop # sai do loop quando s1 >= s0
	
    # divisao da media ponderada
	div.s $f3, $f1, $f2 

	li $v0, 2 # Imprimir float = média
	mov.s $f12, $f3
	syscall
	
	li $v0, 10 # Return 0
	syscall