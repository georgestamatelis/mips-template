###################################################
# 	                    x.x                       #
###################################################

###################################################
#                 text segment                    #
###################################################
	.text
	.globl __start
__start:



lwc1 $f1,pi
####the code bellow should store the (biased) exponent in $s0
###if you want the bias just substract 127
mfc1 $t1,$f1
sll $t1,$t1,1
srl $t1,$t1,24
add $s0,$t1,$zero
##########################################
###the code bellow counts the ones of the non biased exponent stored in s0
###it should store the zeros in a0
##########################################
li $a0,0
beq $s0,$zero,Exit

######################################################
####the code bellow prints(integer form ) the mantisa of $f1
#mov.s $f12,$f1
#mfc1 $t1,$f12
#add $a0,$t1,$zero
#li $v0,1
#syscall
#la $a0,endl
#li $v0,4
#syscall
#sll $t1,$t1,9
#srl $t1,$t1,9
#move $a0,$t1
#li $v0,1
#syscall
###alternative solution much smaller stores mantissa bits in $t1 assuming float is in $f1
lwc1 $f1,pi
mfc1 $t1,$f1
li $t2,8388607
and $t1,$t1,$t2
Exit:
li $v0,1
syscall
li $v0,10
syscall
#################################################
#                 data segment                  #
#################################################

.data
 endl: .asciiz "\n"
 tester: .word 0x00FF
 res: .word 0x00FF
 pi : .float 55.567