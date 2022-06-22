.data 


constante: .double 100.00 #para calculo da procentagem
        
.text

main: 


#f1 custo, f2  Lucro, f0  imposto

#le o primeiro numero, que indica o valor do custo de fábrica

li      $v0, 7
syscall
mov.d   $f14,$f0

#le o segundo numero, que indica a porcentagem de lucro
li     $v0, 7 
syscall
mov.d   $f2,$f0

#le o segundo numero, que indica o valor da porcentagem de impostos

li     $v0, 7
syscall

la          $t0, constante
ldc1        $f16, 0($t0)#carrega a constante

#calculo da procentagem de Lucro

div.d $f2,$f2,$f16

#calculo da porcentagem de Impostos

div.d $f0,$f0,$f16

#calculo do lucro

mul.d $f18,$f2,$f14

#calculo dos impostos

mul.d $f4,$f0,$f14

#calculo do custo total

add.d $f22,$f18,$f4  #porcentagens
add.d $f6,$f22,$f14  #porcentagens + custo da fabrica

#print do custo total

li         $v0, 3
mov.d      $f12, $f6
syscall

#encerra o programa
li      $v0,10
syscall

