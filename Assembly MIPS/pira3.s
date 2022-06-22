.data


espaco: .asciiz " "
pulalinha: .asciiz "\n" 
asterisco: .asciiz "*"


.text

main:

#s0 = numero digitado, s1 = i, s2 = comparador, s3 = k, s4 = j, s5 = manipular s1

#ler o numero digitado
li      $v0, 5
syscall
move    $s0, $v0

#inicializar a primeira variavel de loop em 0
add $s1, $zero, 1
add $s7, $s0, 1

# verifica se i<= numero digitado, serve para o numero de linhas
For1:      
            slt $s2, $s1, $s7
            beq $s2, $zero, EncerraMain
            add $s3, $s0, $zero


#verifica se k(variavel do segundo "for")>i, serve para o numero de espacos
For2:      
            slt $s2, $s1, $s3
            add $s4, $zero, $zero
            beq $s2, $zero, For3
            li          $v0, 4
            la          $a0, espaco
            syscall
            addi $s3, $s3, -1



            j For2

#verifica se j(variavel do terceiro "for")<(2*i)-1,serve para o numero de asteriscos
For3:
            add $s5, $s1, $zero
            sll    $s5, $s5, 1
            addi $s5, $s5, -1

            slt $s2, $s4, $s5
            beq $s2, $zero, Encerra
            li  $v0, 4
            la  $a0, asterisco
            syscall 
            addi $s4, $s4, 1 
            j For3

Encerra:

            addi $s1, $s1, 1
            slt $s2, $s1, $s7
            beq $s2, $zero, EncerraMain
            li      $v0, 4
            la      $a0, pulalinha
            syscall

            j For1
EncerraMain: 



#encerra o programa
li      $v0, 10
syscall