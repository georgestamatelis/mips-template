###################################################
# #
# lab1_1.s #
# Pseudoinstruction examples - System calls #
# t0 - holds each byte from string in turn #
# t1 - contains count of characters #
# t2 - points to the string #
# #
###################################################
###################################################
# #
# text segment #
# #
###################################################
 .text
 .globl __start
__start:

#number is in t0 given by clicking on the register button by the user
li $t1,0 #t1 is the answer , t2,t3 are  temporary registers
srl $t2,$t0,3
andi $t3,$t0,7
srl $t3,$t3,4
xor $t2,$t3,$t2
mul $t2,$t2,8
add $t1,$t1,$t2

Exit:
    li $v0,10
    syscall
#################################################
# #
# data segment #
# #
#################################################
.data

    byte00: .byte 0x01
    byte01: .byte 0x02
    byte02: .byte 0x03
    byte03: .byte 0x04
    byte04: .byte 0x81
    byte05: .byte 0x82
    byte06: .byte 0x83
    byte07: .byte 0x84
    byte08:	.word 0x12345678
	byte12: .word 0x87654321
#################################################
# #
# End of File #
# #
#################################################