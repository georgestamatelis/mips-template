##################################################3
###Playing Around with strings the daskalos has put in other years
########################################################3
	.text
	.globl __start
__start:

#la $t1,tester
#li $v0,5
#syscall
#add $t2,$v0,$zero
#addi $t2,$t2,1
#li $t1,0
#loop:lbu $t0,tester($t1)
#    beq $t1,$t2,End 
#    sb $t0,copy($t1)
#    addi $t1,$t1,1
#    j loop
#End:
#    li $t0,'*'
#    loop2: 
#    beq $t1,20,End2
#        sb $t0,copy($t1)
#        addi $t1,$t1,1
#        j loop2
#    End2:
#    sb $zero,copy($t1)
#    la $a0,copy
#    li $v0,4
#    syscall
###################################################################
### program to rate a string for example:
##aaaa -> .aaa->a.aa->aa.a->aaa.->.aaa->(...) endless
###################################################################
#li $t3,0
#OuterLoop:
#bne $t3,4,cont
#li $t3,0
#cont:
#li $t2,'*'
#li $t1,0
#loop:lbu $t0,manyAs($t1)
#    beq $t0,$zero,End
#    sb $t0,copy($t1)
#    addi $t1,$t1,1
#    j loop
#End:
#    sb $t2,copy($t3)
#    addi $t3,$t3,1
#    la $a0,copy
#    li $v0,4
#    syscall
#    la $a0,endl
#    li $v0,4
#    syscall
#    j OuterLoop
#Exit:
#li $v0,10
#syscall

#################################################
#                 data segment                  #
#################################################

.data
        tester: .asciiz"12345678901234567890\n"
        copy: .space 21
        manyAs: .asciiz "aaaa"
        endl: .asciiz "\n"
        