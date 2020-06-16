###############################################
###
###############################################
	.text
	.globl __start
__start:

ouputEndlessLoop:
la $a0,testStr
jal strLenCount
li $t1,0
loop:
    beq $t1,$v0,End
    lbu $t0,testStr($t1)
    addi $t1,$t1,1
    sb $t0,outputStr($t1)
    j loop
End:
    lbu $t0,testStr($t1)
    li $t1,0
    sb $t0,outputStr($t1)
    la $a0,outputStr
    li $v0,4
    syscall
Exit:
    li $v0,10
    syscall
strLenCount:
    li $v0,0
    lengthLoop: lbu $t0,testStr($v0)
        beqz $t0,endLengthLoop
        addi $v0,$v0,1
        j lengthLoop
    endLengthLoop:
        addi $v0,$v0,-1
        jr $ra
#################################################
#                 data segment                  #
#################################################

.data   
    testStr: .asciiz "abcdefghijklmnopqrstuvwxyz"
    outputStr: .space 80