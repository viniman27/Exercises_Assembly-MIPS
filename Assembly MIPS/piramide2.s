.data 

espaco: .asciiz " "
pulalinha: .asciiz "\n"
asterisco: .asciiz "*"


.text 

main:

#le o tamanho da piramide
    li $v0, 5
	syscall

#tamanho da piramide
    move $s0, $v0
	move $s1, $v0

#numero de espacos vazios antes de cada linha
	addi $s1, $s1, -1 

	#li $v0, 4
	#la $a0, pulalinha
	#syscall

	mul $s3, $s0,2

	li $t0, 1

	printlinha:
		bgt $t0, $s3, encerra
		
		# print espacos
		move $a1, $s1
		jal printespacos
		addi $s1, $s1, -2

		# print asteriscos
		move $a1, $t0
		jal printasteriscos
		addi $t0, $t0, 2

		j printlinha

	encerra: li $v0, 10
	syscall

printasteriscos:
	# print $a1 asteriscos
	addi $sp, $sp, -12
	sw $ra, ($sp)
	sw $v0, 4($sp)
	sw $a0, 8($sp)
	li $v0, 4
	asterisco_loop:
		beq $a1, $zero, returnasteriscos
		la $a0, asterisco
		syscall
		la $a0, espaco
		syscall
		addi $a1, $a1, -1
		j asterisco_loop
	returnasteriscos: la $a0, pulalinha
	syscall
	lw $ra, ($sp)
	lw $v0, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

printespacos:
	# print $a1 espacos
	addi $sp, $sp, -12
	sw $ra, ($sp)
	sw $v0, 4($sp)
	sw $a0, 8($sp)
	li $v0, 4
	la $a0, espaco
	printextra:
		beq $a1, $zero, returnespacos
		syscall
		addi $a1, $a1, -1
		j printextra
	returnespacos: lw $ra, ($sp)
	lw $v0, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12
	jr $ra