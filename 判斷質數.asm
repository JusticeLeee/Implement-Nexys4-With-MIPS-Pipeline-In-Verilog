.data
msg_changeline:.asciiz "\n"

.text
.globl main
main:
	#$a0-$a3=引數(argument)暫存器
	#$v0-$v1=數值(value)暫存器
	#$t0-t9=整數(integer)暫存器
	
	#initial可實現
	li $t0,0
	li $t1,1
	li $t2,1
	li $t3,127
	li $t4,123
	li $t5,0
	li $t6,0		#t6=rest;
	
plus :	add $t3,$t3,$t1		# t3=t3+1;
	add $t2,$t1,$t0
ptest:	add $t4,$t3,$t0		# t4=t3;
	add $t2,$t2,$t1		#t2=t2+1
	beq $t2,$t3,flag	#跳到flag 代表t3是要找的質數
rest:	sub $t4,$t4,$t2		#t4=t4-t2;
	slt $t5,$t4,$t0		#if t4<0 t5=1;
	beq $t5,$t0,rest	#若t3還沒<0 就繼續扣
	add $t6,$t4,$t2		#t6是餘數
	beq $t6,$t0 plus	#餘數如果是0 就直接檢查下一個數
	j   ptest		#若餘數不是0還需要繼續檢查下面的數字
flag:	add,$a0,$t2,$zero	
	li,$v0,1
	syscall
	li $v0,4
	la $a0, msg_changeline
	syscall
	
	li $t2 ,1
	li $t3,127
sub:	sub $t3,$t3,$t1		# t3=t3-1;
	add $t2 $t1 $t0
ptest1:	add $t4,$t3,$t0		# t4=t3;
	add $t2,$t2,$t1		#t2=t2+1
	beq $t2,$t3,flag1	#跳到flag 代表t3是要找的質數
rest1:	sub $t4,$t4,$t2		#t4=t4-t2;
	slt $t5,$t4,$t0		#if t4<0 t5=1;
	beq $t5,$t0,rest1	#若t3還沒<0 就繼續扣
	add $t6,$t4,$t2		#t6是餘數
	beq $t6,$t0 sub		#餘數如果是0 就直接檢查下一個數
	j   ptest1		#若餘數不是0還需要繼續檢查下面的數字
flag1:	add,$a0,$t2,$zero
	li,$v0,1
	syscall
	li $v0,4
	la $a0, msg_changeline
	syscall	
	
	
	
	
