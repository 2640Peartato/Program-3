#CS 2640 Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Date 5/04/23
#Objectives Task 3
#- open file 'practiceFile.txt'
#- append to file answering the question
#-  "What have you enjoyed the most about the class so far?"

.data
fileName: .asciiz "practiceFile.txt"
aBuffer: .space 301
newItems: .asciiz "\nWhat have you enjoyed the most about the class so far?\nThe class always gives a thorough explanation of each coding concept with examples."

.text
main:
	#open practiceFile.txt
	li $v0, 13
	la $a0, fileName
	li $a1, 9 #flag to write and append to existing file
	li $a2, 0 #ignored
	syscall
	move $s3, $v0
	
	#appended to gradedItems.txt
	li $v0, 15
	move $a0, $s3
	la $a1, newItems
	li $a2, 150
	syscall
	
	#close gradeditems.txt
	li $v0, 16
	move $a0, $s3
	syscall
exit:
	li $v0, 10
	syscall
