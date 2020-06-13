#################
####
###################
	.text
	.globl __start
__start:

li $a0,5
jal fuck
move $a0,$v0
#li $v0,1
#syscall

Exit:
    li $v0,10
    syscall




fuck:
addi $sp, $sp, -8 # adjust stack for 2 items
sw $ra, 4($sp) # save return address
sw $a0, 0($sp) # save argument

slti $t0, $a0, 1 # test for n < 1
beq $t0, $zero, L
addi $v0, $zero, 1 # if so, result is 1
addi $sp, $sp, 8 # pop 2 items from stack
jr $ra # and return

L: addi $a0, $a0, -1 # else decrement n
jal printNumber
#li $v0,1
#syscall
jal fuck # recursive call

lw $a0, 0($sp) # restore original n
lw $ra, 4($sp) # and return address
addi $sp, $sp, 8 # pop 2 items from stack
jr $ra

printNumber:
lbu $t1,str($a0)
add $t0,$a0,$zero
add $a0,$t1,$zero
li $v0,11
syscall
la $a0,endl
li $v0,4
syscall
add $a0,$t0,$zero
jr $ra



#############################################
#############################################
.data
 endl: .asciiz "\n"
 str: .asciiz "12345"