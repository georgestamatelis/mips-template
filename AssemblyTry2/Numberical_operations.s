#################
####shit regarding bit operation
###################
	.text
	.globl __start
__start:
############Reads a number and rotates it right one spot until given zero
#BigLoop:
 #   lw $t0,one_right
 #   move $a0,$t0
 #   li $v0,5
 #   syscall
 #   beq $v0,$zero,Exit
 #   li $a1,2
 #   move $t1,$v0
 #   div $t1,$a1
 #   mfhi $a1
 #   beq $a1,1,number
 #   move $a0,$t1
 #   li $v0,1
 #   syscall
 #   j BigLoop

  #  number:
  #  srl $t1,$t1,1
 # or $t1,$t1,$t0
 #move $a0,$t1
 #   li $v0,1
 #   syscall
 #   j BigLoop  
 ######################################################
 ###Inverts the bits of an integer
 ########################################
# BigLoop:
#   lw $t0,one_right
#  li $v0,5
#    syscall
#    beq $v0,$zero,Exit
#    li $s0,1
#    move $t1,$v0
#    loop1:
#        beq $s0,32,End
#        li $a1,2
#        div $t1,$a1
#        mfhi $a1
#        beq $a1,1,number
#        srl $t1,$t1,1
#        addi $s0,$s0,1
#        j loop1
#        number:
#        srl $t1,$t1,1
#        or $t1,$t1,$t0
#        addi $s0,$s0,1
#        j loop1
#End:
# move $a0,$t0
# li $v0,1
# syscall
# j BigLoop
#########################################################################
#counts the aces and the zeros of a number // number should be in to / remove li $t0,452 instruction 
###############################################
#li $t0,452
#li $a1,2
#li $a3,0
#loop1:
#    beq $t0,$zero,End
#    div $t0,$a1
#    mflo $t0 ##to=to/2
#    mfhi $a2 ##a2=to mod 2
#    beq $a2,1,number 
#    j loop1
#    number:
#    addi $a3,$a3,1
#    j loop1

#End:
#    move $a0,$a3
#    li $v0,1
#    syscall
 #####################################################################
#####Calculates the largest octal digit of an input number
#########################################################

#li $v0,5
#syscall
#li $t1,8
#li $t2,0
#add $t0,$v0,$zero
#loop:
#    beq $t0,$zero,End
#    div $t0,$t1
#    mfhi $t3
#    mflo $t0
#    bge $t3,$t2,swapN
#    j loop
#    swapN:
#    add $t2,$t3,$zero
#    j loop
#End:
#    add $a0,$t2,$zero
#    li $v0,1
#    syscall
####################################################################
## Prints number in powers of 8
################################################################333
#li $t0,5349
#li $t1,0
#li $t2,0
#li $t3,8
#loop:
#    beq $t0,$zero,End
#    div $t0,$t3
#    mfhi $t1
#    mflo $t0
#    jal printSumbol
#    addi $t2,$t2,1
#   j loop

#printSumbol:
#add $a0,$t1,$zero
#li $v0,1
#syscall
#li $a0,'*'
#li $v0,11
#syscall
#li $a0,8
#li $v0,1
#syscall
#li $a0,'^'
#li $v0,11
#syscall
#add $a0,$t2,$zero
#li $v0,1
#syscall
#beq $t0,$zero,End
#li $a0,'+'
#li $v0,11
#syscall
#jr $ra
#End:
#la $a0,endl
#li $v0,4
#syscall
####################################################3
#same shit but reverse
#################################################
li $t0,1073741824
li $t1,210
li $t3,8
loop:
    beq $t0,$zero,End
    div $t1,$t0
    mflo $a0
    mfhi $t1
    beqz $a0,cont 
    li $v0,1
    syscall
    cont:
        div $t0,$t3
        mflo $t0
        j loop
End:
Exit:
    li $v0,10
    syscall #au revoir
##############################
#############################
.data
  numb: .word 0xFFFFFFFF
  one_right:.word 0x10000000
  endl : .asciiz"\n" 