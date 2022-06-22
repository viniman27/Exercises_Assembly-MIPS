        .data

msg1:   .asciiz "Digite se sera uma operacao sem sinal (0) ou com sinal (1): \n"
msg2:   .asciiz "Digite o primeiro numero: "
msg3:   .asciiz "Digite o segundo numero: "
res:    .asciiz "O resultado deu: "
ovr:    .asciiz "overflow"

        .text

main:

#s0 = '1' ou '0' 
#t0 = adicao dos dois numeros
#t1 = primeiro numero
#t2 = segundo numero
#t3 = variavel de manipulação e comparação
#s1 = complemento a dois de t1


## Imprime msg1 na tela
#        li          $v0, 4      # $v0 = 4
#        la          $a0, msg1   # carrega em $a0 o endereço de memória de msg1
#        syscall

#Le um numero inteiro
        li          $v0, 5
        syscall
        move 	    $s0, $v0		

##Imprime msg2 na tela
#        li          $v0, 4
#        la          $a0, msg2
#        syscall

#Le o primeiro numero da operação
        li          $v0, 5
        syscall
        move        $t1, $v0

##Imprime msg3 na tela
#        li          $v0, 4
#        la          $a0, msg3
#        syscall

#Le o segundo numero da operacao
        li          $v0, 5
        syscall
        move        $t2, $v0

        beq         $s0, $zero, SemSinal

#Adicao com sinal
        addu        $t0, $t1, $t2
        xor		    $t3, $t1, $t2		

        slt		    $t3, $t3, $zero
        bne         $t3, $zero, SaidaSemOVerflow

        xor         $t3, $t0, $t1
        slt         $t3, $t3, $zero
        bne         $t3, $zero, Overflow
        j SaidaSemOVerflow
        
SemSinal: 

#Adicao sem sinal

#s1 = t1
        add         $s1, $t1, $zero  

#s1 se tornará complemento a dois de t1
        nor         $s1, $s1, $zero
        #addi   $s1, $s1, 1

        slt         $t3, $s1, $t2   
        beq         $t3, $zero, Overflow

        add         $t0, $t1, $t2
SaidaSemOVerflow:

##Printar o resultado na tela
#        li          $v0, 4
#        la          $a0, res
#        syscall

        li          $v0, 1
        move        $a0, $t0
        syscall
        j SaidaPrincipal

Overflow:
#Imprime ovr na tela
        li          $v0, 4
        la          $a0, ovr
        syscall


SaidaPrincipal:

#Encerra o programa
        li          $v0, 10
        syscall