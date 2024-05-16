# fatorial: calcula o fatorial de n
# Entrada: n em $a0
# Saída: fatorial de n em $v0

.data
fmt: .asciiz "%d\n"

.text
.globl main

fatorial:
    addi $sp, $sp, -8        # Aloca espaço na pilha
    sw   $ra, 4($sp)         # Salva o registrador de retorno
    sw   $a0, 0($sp)         # Salva o argumento n

    li   $v0, 1              # Carrega o valor 1 em $v0 (retorno default)
    ble  $a0, 1, fatorial_end # Se n <= 1, retorna 1

    sub  $a0, $a0, 1         # n - 1
    jal  fatorial            # Chama fatorial(n-1)

    lw   $a0, 0($sp)         # Restaura o argumento n
    lw   $ra, 4($sp)         # Restaura o registrador de retorno
    addi $sp, $sp, 8         # Desaloca espaço na pilha
    mul  $v0, $a0, $v0       # n * fatorial(n-1)

    jr   $ra                 # Retorna

fatorial_end:
    lw   $ra, 4($sp)         # Restaura o registrador de retorno
    lw   $a0, 0($sp)         # Restaura o argumento n
    addi $sp, $sp, 8         # Desaloca espaço na pilha
    jr   $ra                 # Retorna

main:
    addi $sp, $sp, -8        # Aloca espaço na pilha
    sw   $ra, 4($sp)         # Salva o registrador de retorno
    sw   $s0, 0($sp)         # Salva o registrador $s0

    li   $a0, 10             # Passa 10 como argumento
    jal  fatorial            # Chama fatorial(10)

    move $s0, $v0            # Salva o resultado em $s0

    li   $v0, 4              # Prepara para chamada de impressão
    la   $a0, fmt            # Carrega o endereço do formato
    syscall                  # Chama o sistema para imprimir o formato

    move $a0, $s0            # Move o resultado para $a0
    li   $v0, 1              # Chamada de impressão de inteiro
    syscall                  # Chama o sistema para imprimir o inteiro

    lw   $s0, 0($sp)         # Restaura o registrador $s0
    lw   $ra, 4($sp)         # Restaura o registrador de retorno
    addi $sp, $sp, 8         # Desaloca espaço na pilha

    li   $v0, 10             # Chamada para encerrar o programa
    syscall                  # Chama o sistema para encerrar

