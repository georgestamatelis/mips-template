###################################################
	.text
	.globl __start
__start:



####Very Basic Switch Case
##################################################
#li $t1,11
#case2:
#    li $t0,2
#    div $t1,$t0
#    mfhi $t0
#    bne $t0,$zero,case3
#    la $a0,two
#    li $v0,4
#    syscall
#    j Exit
#case3:
#    li $t0,3
#    div $t1,$t0
#    mfhi $t0
#    bne $t0,$zero,case5
#    la $a0,three
#    li $v0,4
#    syscall
#    j Exit
#case5:
#    li $t0,5
#    div $t1,$t0
#    mfhi $t0
#    bne $t0,$zero,default
#    la $a0,five
#    li $v0,4
#    syscall
#    j Exit
#default:
#    la $a0,def
#    li $v0,4
#    syscall

######################################################################3
##### Calculate The Hamming Distance between two 32 bit words
#################################################################
#la $t1,word1
#la $t2,word2
#xor $s0,$t1,$t2
#li $a0,0
#li $a1,2
#loop:
#beq $s0,$zero,End
#div $s0,$s0,$a1
#mfhi $s2
#mflo $s0
#beq $s2,1,addone
#j loop
#addone:
#addi $a0,$a0,1
#j loop
#End: 
#    li $v0,1
#    syscall

########################################################
# Capitalize an Input String 
######################################################
la $a0,inputStr
li $t1,0
loop:lbu $t0,inputStr($t1)
    beq $t0,$zero,End 
    sub $t0,$t0,32
    sb $t0,capitals($t1)
    addi $t1,$t1,1
    j loop
End:
la $a0,capitals
li $v0,4
syscall
Exit:
    li $v0,10
    syscall
###########################################
.data
    endl: .asciiz"\n"
    two: .asciiz"DividedByTwo\n"
    three: .asciiz "DividedByThree\n"
    five: .asciiz"DividedByFahhhve\n"
    def: .asciiz"Fuck You\n"
    word1:  .word 0xFF
    word2:  .word 0XFE
    inputStr: .asciiz "abcdefg" 
    capitals: .space 80