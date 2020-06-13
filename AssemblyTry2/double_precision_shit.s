###################################################
#                 text segment                    #
###################################################
	.text
	.globl __start
__start:

li.d $f4,0.0
#li $v0,7
#syscall
li.d $f0,3.14
c.eq.d $f0,$f4
bc1t Fuck
mfc1.d $t0,$f0
sll $t1,$t1,1
srl $t1,$t1,21
sub $t1,$t1,1023
li $a1,2
li $a3,0
loop1:
    beq $t1,$zero,End
    div $t1,$t1,$a1
    mfhi $s2
    mflo $t1
    beq $s2,1,addone
    j loop1  
    addone:
    addi $a3,$a3,1
    j loop1

End:
move $a0,$a3
li $v0,1
syscall
j Exit
Fuck:
la $a0,fuck
li $v0,4
syscall
mfc1.d $t0,$f0
Exit:
li $v0,10
syscall
#################################################
#                 data segment                  #
#################################################
.data
fuck: .asciiz"fuck you\n"