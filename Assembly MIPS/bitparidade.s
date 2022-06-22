bitparidade:
    move $t0, $a0
    #t0 = numero inserido, t1 = contador, t2 = exponenciais de 2, t3 = int i, t4 = 7 (comparador), t5 = comparador de ifs, t6 = resultado da div, #t8 = bit paridade, #t9 = novo numero

    move $t1, $zero
    addi $t2, $zero, 1

    move $t3, $zero

    addi $t4, $zero, 7

Loop:
    
    #i < 7(bits de dados)

    slt $t5, $t3, $t4
    beq $t5, $zero, Encerra
    and $t5, $a0, $t2 

    #verifica quantidade de bits 1
If:
    addi $t3, $t3, 1
    sll $t2, $t2, 1
    beq $t5, $zero, Loop
    addi $t1, $t1, 1
    j Loop

    #verifica paridade
Encerra:

    div $t6, $t1, 2
    mfhi    $t7

    beq $t7, $zero, Saida
    addi $t8, $zero, 1
    j Saida2

    #caso o bit de paridade seja 0
Saida:
    move $t8, $zero

    #retorna o numero resultante
Saida2:

    add $t9, $a0, $zero

    beq $t8, $zero, Saidamain
    ori $t9, $a0, 128
    #retorna os dados para a main
Saidamain: 

    move $v0, $t8
    move $v1, $t9

    jr $ra
