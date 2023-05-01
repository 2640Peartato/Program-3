#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date: 05/07/23
#Objectives: open a programmer-defined filename and print and close it

.data
fileName: .asciiz "practiceFile.txt"
aBuffer: .space 301

.text
main:
	#open the file
	li $v0, 13
	la $a0, fileName
	li $a1, 0 #read the file
	li $a2, 0 #gets ignored
	syscall
	move $s0, $v0 #store file desriptor in $s0
	
	#read from the file
	li $v0, 14
	move $a0, $s0
	la $a1, aBuffer
	li $a2, 300
	syscall
	move $s2, $v0
		
	#print contents to the user
	li $v0, 4
	la $a0, aBuffer
	syscall
	
	#Close the file
	li $v0, 16
	move $a0, $s0
	syscall
	
exit:
	li $v0, 10
	syscall
