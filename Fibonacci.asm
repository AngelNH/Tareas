.data
.text
main:
	add $a0,$zero,6
	jal fibonacci
	j exit
	
fibonacci:
	addi $sp,$sp,-20
	sw $a0 ,16($sp)
	sw $t0, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	slti $t0,$a0,2
	bne $t0,$zero,base
	
general:
	addi $a0,$a0,-1
	jal fibonacci
	addi $a0,$a0,-1
	add $s0,$v0,$zero
	jal fibonacci
	add $v0,$s0,$v0
	j exitFibonacci
base:
	add $v0,$a0,$zero

exitFibonacci:
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $t0, 8($sp)
	lw $a0, 16($sp)	
	addi $sp,$sp,20
	jr $ra
	
exit:
	
