.data  

inputNum :.asciiz "Digite um numero: "
pulaLinha: .asciiz "\n"
inputExp: .asciiz "Digite o expoente: "
printRes: .asciiz "O resultado eh: "



.text

.globl main

main:

	li $v0, 4
	la $a0, inputNum 
	syscall
			# int num
	li $v0, 5 
	syscall
	move $a1, $v0
		
	li $v0, 4
	la $a0, inputExp
	syscall
			# int exp
	li $v0, 5
	syscall
	move $a2, $v0
	
	jal powerBase2
	
	move $t0, $v0
	
	li $v0, 4
	la $a0, pulaLinha
	syscall
			
	li $v0, 4
	la $a0, printRes
	syscall
			# print res
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 10
	syscall
	
	
.globl powerBase2

powerBase2:

	li $t1, 2
	li $t2, 1
	
	bnez $a2, exp1
	
	move $v0, $a1
	jr $ra
	
	exp1:
	bne $a2, 1, while
	
	mul $v0, $a1, 2
	jr $ra
	
	while:
	beq $t2, $a2, fim
	
	mul $t1, $t1, 2
	addi $t2, $t2, 1
	
	j while
	 
	fim:
	
	mul $v0, $t1, $a1
	jr $ra 	