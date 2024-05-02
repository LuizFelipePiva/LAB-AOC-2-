.data
	inputNum: .asciiz "Digite um numero: "
	inputNum2: .asciiz "Digite outro numero: "
	menu: .asciiz "1-Soma\n2-Subtracao\n3-Multiplicacao\n4-Divisao"
	inputMenu: .asciiz "Digite sua opcao: "
	pulaLinha: .asciiz "\n"
	res: .asciiz "O resultado eh: "
	erro: .asciiz "Nao eh possivel dividir por 0"
	resto: .asciiz "O resto eh: "
	
.text

.globl main

main:
	li $a1, 0	# Primeiro valor
	li $a2, 0	# Segundo valor
	li $t0, 0	# Valor do menu
	
	li $v0, 4
	la $a0, inputNum   # Pede o primeiro valor
	syscall
	
	li $v0, 5	# Salva o primeiro valor
	syscall
	
	move $a1, $v0
	
	li $v0, 4
	la $a0, inputNum2	# Pede o segundo valor
	syscall
	
	li $v0, 5	# Salva o segundo valor
	syscall
	
	move $a2, $v0
	
	li $v0, 4
	la $a0, pulaLinha  # Pula linha
	syscall
	
	li $v0, 4
	la $a0, menu	# Print menu
	syscall
	
	li $v0, 4
	la $a0, pulaLinha  # Pula linha
	syscall
	
	li $v0, 4
	la $a0,inputMenu # Print opcao 
	syscall
	
	li $v0, 5	# Salva o valor escolhido pelo usuario
	syscall
	
	move $t0, $v0   # Move para a variavel
	
	
	bne $t0, 1, validacao2
	jal soma
	j print
	
	validacao2:
	
	bne $t0, 2, validacao3
	jal subtracao
	j print
	
	validacao3:
	
	bne $t0, 3, validacao4
	jal multiplicacao
	j print
	
	validacao4:
	
	bne $t0, 4, exit
	jal divisao
	j print
	
  	

	soma:
	
	add $s0, $a1, $a2  # soma os valores de a + b
	jr $ra 	# retorna o valor da soma
	
	
	subtracao:
	
	sub $s0, $a1, $a2  # subtrai os valores de a - b
	jr $ra  # retonar o valor da subtracao
	
	
	multiplicacao:
	
	mult $a1, $a2 # multiplica os valores de a * b
	mflo $s0
	jr $ra # retorna o valor da mutliplicacao
	
	
	divisao:
	
	beqz $a2, erroDivisao
	div $a1, $a2 
	mflo $s0	# Dividi os valores de a / b e salva o resultado em s0 e o resto em s1
	mfhi $s1
	jr $ra
	
	erroDivisao:
	
	li $v0, 4
	la $a0, pulaLinha  # Pula linha
	syscall
	
	li $v0, 4
	la $a0, erro	# Erro divisao por 0
	syscall
	
	j exit
	
	print:
	
	li $v0, 4
	la $a0, pulaLinha # Pula linha
	syscall
	
	li $v0, 4
	la $a0, res	
	syscall
			# printa o resultado da conta
	li $v0, 1
	move $a0, $s0
	syscall
	
	
	beqz $s1, exit
	
	li $v0, 4
	la $a0, pulaLinha  # Pula linha
	syscall
	
    	li $v0, 4
    	la $a0, resto	
    	syscall
   			# Printa o resto da divisao, se existir
    	li $v0, 1
    	move $a0, $s1
    	syscall
	
	j exit
	
	exit:
	li $v0,10
	syscall