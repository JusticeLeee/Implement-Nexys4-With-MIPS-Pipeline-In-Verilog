.data
msg_changeline:.asciiz "\n"

.text
.globl main
main:
	#$a0-$a3=�޼�(argument)�Ȧs��
	#$v0-$v1=�ƭ�(value)�Ȧs��
	#$t0-t9=���(integer)�Ȧs��
	
	#initial�i��{
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
	beq $t2,$t3,flag	#����flag �N��t3�O�n�䪺���
rest:	sub $t4,$t4,$t2		#t4=t4-t2;
	slt $t5,$t4,$t0		#if t4<0 t5=1;
	beq $t5,$t0,rest	#�Yt3�٨S<0 �N�~��
	add $t6,$t4,$t2		#t6�O�l��
	beq $t6,$t0 plus	#�l�Ʀp�G�O0 �N�����ˬd�U�@�Ӽ�
	j   ptest		#�Y�l�Ƥ��O0�ٻݭn�~���ˬd�U�����Ʀr
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
	beq $t2,$t3,flag1	#����flag �N��t3�O�n�䪺���
rest1:	sub $t4,$t4,$t2		#t4=t4-t2;
	slt $t5,$t4,$t0		#if t4<0 t5=1;
	beq $t5,$t0,rest1	#�Yt3�٨S<0 �N�~��
	add $t6,$t4,$t2		#t6�O�l��
	beq $t6,$t0 sub		#�l�Ʀp�G�O0 �N�����ˬd�U�@�Ӽ�
	j   ptest1		#�Y�l�Ƥ��O0�ٻݭn�~���ˬd�U�����Ʀr
flag1:	add,$a0,$t2,$zero
	li,$v0,1
	syscall
	li $v0,4
	la $a0, msg_changeline
	syscall	
	
	
	
	
