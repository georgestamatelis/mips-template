#################
####
###################
	.text
	.globl __start
__start:
############

#la $a0,give
#jal printStrng
#la $a0,endl
#jal printStrng
li $t0,4
jal calculateFactiorial
add $v1,$s0,$zero
move $a0,$s0
li $v0,1
syscall
li $t0,5
li $t1,3
la $a0,endl
jal printStrng
jal calculatePower
add $t7,$s0,$zero
move $a0,$s0,
li $v0,1
syscall
Exit:
    li $v0,10
    syscall #au revoir
printStrng:
    li $v0,4
    syscall
    jr $ra
calculatePower: 
#n in $t0
# x in $t1
add $s0,$t1,$zero
li $s1,1
powLoop:
    beq $s1,$t0,endPow
    mul $s0,$s0,$t1
    addi $s1,$s1,1
    j powLoop
endPow:
 jr $ra
calculateFactiorial:
#n in $t0
li $s0,1
li $s1,1
factLoop:
    beq $s1,$t0,endF
    mul $s0,$s0,$s1  
    addi $s1,$s1,1
    j factLoop                
endF:
    mul $s0,$s0,$t0
    jr $ra
##########################
##########################
.data
    endl: .asciiz"\n"
    give: .asciiz"Give me a number"