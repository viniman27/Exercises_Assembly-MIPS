.data   

        
.text
    

main: 

#le o primeiro numero
li      $v0, 5 
syscall
move $s0, $v0

#le o segundo numero
li       $v0, 5 
syscall
move $s1, $v0

#com os dois valores 

add $t0, $s0, $s1 #soma os dois numeros

#printa o resultado
li      $v0, 1
move $a0, $t0
syscall

#encerra o programa
li      $v0,10
syscall

