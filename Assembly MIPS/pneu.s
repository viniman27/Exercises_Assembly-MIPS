.data   

        
.text
    

main: 

#le a pressao desejada
li      $v0, 5 
syscall
move $s0, $v0

#le a pressao lida pela bomba
li       $v0, 5 
syscall
move $s1, $v0

#com os dois valores 

sub		$t0,$s0,$s1	

#printa o resultado
li      $v0, 1
move $a0, $t0
syscall

#encerra o programa
li      $v0,10
syscall

