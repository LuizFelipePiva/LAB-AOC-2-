.data
.text

.globl main

main:

	li $a1, 3 # int exp
	
	jal powerBase2
	
	move $t0, $v0
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
.globl powerBase2

powerBase2:

	li $t1, 2 # valor 2
	
	sllv $v0, $t1, $a1 # 2 << exp
	jr $ra
	
	