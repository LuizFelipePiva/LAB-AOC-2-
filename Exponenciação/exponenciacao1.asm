.data
.text

.globl main

main:
	li $a1, 2 # int base
	li $a2, 3 # int expoente
	
	jal power
	
	move $t0, $v0
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
	
.globl power

power:

	li $t1, 0 # int i
	li $v0, 1 # int res
	
	
	while:
	
	beq $t1, $a2, fim
	
	mul $v0, $v0, $a0
	addi $t1, $t1, 1
	
	j while
	
	fim:
	jr $ra
	