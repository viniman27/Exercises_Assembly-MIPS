.data
buffer: .space 20
constK: .double 273.15
constF: .double 1.8
const32:.double 32.0
const5: .double 5.0
const9: .double 9.0
	
.text

main: 	

    li $v0, 8 
	la $a0, buffer # buffer de teclado

    # espaço para a string
	li $a1, 3 

	syscall
	move $t0, $a0 # salvar string em t0
	
    # Salva a primeira temperatura em t1
	lb $t1, ($t0) 
	
	li $v0, 8 
	la $a0, buffer # buffer de teclado
	li $a1, 3 
	syscall
	move $t2, $a0 # salvar string em t2
	
    # Salva a segunda temperatura em t3
	lb $t3, ($t2) 
	
	li $v0, 7 # Lê double -> está salvo em f0/f1
	syscall
	
	li $t4, 'C' # salva C em t4
	li $t5, 'K' # salva K em t5
	li $t6, 'F' # salva F em t6
	
	beq $t1, $t4, Ccon # Se a primeira temp for igual a C vai para Ccon
	beq $t1, $t5, Kcon # Se a primeira temp for igual a K vai para Kcon
	beq $t1, $t6, Fcon # Se a primeira temp for igual a F vai para Fcon
		
	li $v0, 10 # Return 0
	syscall

Ccon:	
# Se for C e K irá para CconK
    beq $t3, $t5, CconK 
# Se for C e F irá para CconF
	beq $t3, $t6, CconF 

CconK:	
    l.d $f10, constK # salva em f10 273.15
	add.d $f2, $f0, $f10 # soma 273.15 para passar de C para K

	li $v0, 3 
	mov.d $f12, $f2
	syscall
	
	li $v0, 10 # Return 0
	syscall
	
CconF:	
    l.d $f10, constF # salva em f10 1.8
	l.d $f14, const32 # salva em f14 32.0
	mul.d $f2, $f0, $f10 # celsius * 1.8 
	add.d $f4, $f2, $f14 # soma 32 para converter
	
	li $v0, 3 
	mov.d $f12, $f4
	syscall
	
	li $v0, 10 # Return 0
	syscall
	
Kcon:
# Se for K e C irá para KconC
    beq $t3, $t4, KconC 
# Se for K e F irá para KconF
	beq $t3, $t6, KconF

KconC:	
    l.d $f10, constK # salva em f10 273.15
	sub.d $f2, $f0, $f10 # diminui 273.15 para passar de K para C

	li $v0, 3 
	mov.d $f12, $f2
	syscall
	
	li $v0, 10 # Return 0
	syscall
	
KconF:	
    l.d $f20, constK # salva em f20 273.15 e CONVERTE PARA CELSIUS PARA DEPOIS FAZER A CONVERSÃO PARA F
	sub.d $f2, $f0, $f20 # diminui 273.15 para passar de K para C

	l.d $f10, constF # salva em f10 1.8
	l.d $f14, const32 # salva em f14 32.0
	mul.d $f4, $f2, $f10 # celsius * 1.8 
	add.d $f6, $f4, $f14 # soma 32 para converter
	
	li $v0, 3 
	mov.d $f12, $f6
	syscall
	
	li $v0, 10 # Return 0
	syscall
	
Fcon:	
# Se for F e C irá para FconC
    beq $t3, $t4, FconC 
# Se for F e K irá para FconK  
	beq $t3, $t5, FconK 
	
FconC:	
    l.d $f8, const5
	l.d $f10, const9
	l.d $f16, const32
	
	div.d $f18, $f8, $f10 # Divide 5 por 9
	sub.d $f30, $f0, $f16 # Diminui 32 da temperatura
	mul.d $f2, $f30, $f18 # sub * 5/9 = C
	
	li $v0, 3 
	mov.d $f12, $f2
	syscall
	
	li $v0, 10 # Return 0
	syscall
	
FconK:	
    l.d $f8, const5
	l.d $f10, const9
	l.d $f16, const32
	l.d $f14, constK
	
	div.d $f18, $f8, $f10 # Divide 5 por 9
	sub.d $f30, $f0, $f16 # Diminui 32 da temperatura
	mul.d $f2, $f30, $f18 # sub * 5/9 = C
	add.d $f2, $f2, $f14 # Soma 273,15 para converter para kelvin
	
	li $v0, 3 
	mov.d $f12, $f2
	syscall
	
	li $v0, 10 # Return 0
	syscall