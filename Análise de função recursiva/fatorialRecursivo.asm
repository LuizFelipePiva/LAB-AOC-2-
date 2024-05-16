.data
	inputRes: .asciiz "O fatorial eh: "
	numero: .word 0 
	res: .word 0  
.text 

.globl main

	main:
	
	li $s0, 10 
	
	sw $s0, numero 
	
	lw $a0, numero
	jal fatorial  
	sw $v0, res 
	
	
	li $v0, 4
	la $a0, inputRes
	syscall
	
	li $v0, 1
	lw $a0, res 
	syscall
	
	li $v0, 10 
	syscall
	
	
.globl fatorial

fatorial:
		subu $sp, $sp, 8
		sw $ra, ($sp) 
		sw $s1, 4($sp)
		
		li $v0, 1
		beq $a0, 0, finalFatorial
		
		move $s1, $a0
		sub $a0, $a0, 1
		jal fatorial
		
		mul $v0, $s1, $v0
		
	finalFatorial:
		lw $ra, ($sp)
		lw $s1, 4($sp)
		addu $sp, $sp, 8
		jr $ra		