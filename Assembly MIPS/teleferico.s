.data   

        
.text
    

main: 

#le a capacidade da cabine
    li      $v0,5
    syscall
    move    $t0, $v0

#le o numero de alunos
    li      $v0,5
    syscall
    move    $t1, $v0

#considera a presenca do monitor
    addi	$s0, $t0,-1		

#divisao para determinar o numero de viagens, sem considerar extra
    div     $t2,$t1,$s0

#armazena o resto
    mfhi    $s1

#condiciona a necessidade de uma viagem extra ou nao
    beq     $s1,$zero,viagem_adic
    addi	$s2,$t2,1
    move 	$a0,$s2
    li		$v0,1
    syscall
    j encerra
#considera a necessidade de uma viagem extra
viagem_adic:
    move 	$a0,$t2
    li		$v0,1
    syscall
    
#encerra o programa
encerra:
    li      $v0,10
    syscall

