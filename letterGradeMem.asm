#Names: Catalina Davis, Kenneth Hung, Ayanna Sanges-Chu
#Class 2640.02
#Date: May 7, 2023
#Objectives for Task 1:
# - given array int scores = [32, 56, 78, 66, 88, 90, 93, 100, 101, 82]
# - return a grade for each element
# - a main label, a looping label, and an exit label
# - a loop counter
# - a separate case for grades above 100 (i.e. prints out "A with Extra Credit")
# - your name printed out after all the grades are read 
# 	before the program exits

.macro exitMess
#print out exit message
li $v0, 4
.data
student: .asciiz "Catalina Davis\nKenneth Hung\nAyanna Sanges-Chu"
exiting: .asciiz "\nThe program will now exit."
newLine: .asciiz "\n"
.text
la $a0, newLine
syscall	
#print out name at end of program
li $v0, 4
la $a0, student
syscall	
#print out exitmessage
li $v0, 4
la $a0, exiting
syscall
.end_macro	

.data 
intScores: .word 32, 56, 78, 66, 88, 90, 93, 100, 101, 82
newLine: .asciiz "\n"
msg: .asciiz "The score for "
is: .asciiz " is: "
exiting: .asciiz "\nThe program will now exit."

#buffer for yes or no loop
yesOrNo: .space 32

#Letter Grades:
a: .asciiz "A\n"
b: .asciiz "B\n"
c: .asciiz "C\n"
d: .asciiz "D\n"
f: .asciiz "F\n"
extraCredit: .asciiz "A with Extra Credit!\n"
.text
main:
	#initialize loop counter and array index
	li $t0, 0	#loop index
	li $t1, 0	#array index
loop:
	#check if loop counter is equal to
	#the number of elements in the array
	li $t2, 10
	beq $t1, $t2, exitMessage
	
	#get score at index
	lw $t3, intScores($t0)
	
	#print message string and score
	li $v0, 4
	la $a0, msg
	syscall
	
	la $v0, 1
	move $a0, $t3
	syscall
	
	li $v0, 4
	la $a0, is
	syscall
	
	#get letter grades
	bgt $t3, 100, EC
	
	bgt $t3, 89, A
	bgt $t3, 79, B
	bgt $t3, 69, C
	bgt $t3, 59, D
	
	#when grade is f
	li $v0, 4
	la $a0, f
	syscall
	
	j Increment
A: 
	#display letter grade 'A'
	li $v0, 4
	la $a0, a
	syscall
	
	j Increment
B:
	#display letter grade 'B'
	li $v0, 4
	la $a0, b
	syscall
	
	j Increment
C:
	#display letter grade 'C'
	li $v0, 4
	la $a0, c
	syscall

	j Increment
D:
	#display letter grade 'D'
	li $v0, 4
	la $a0, d
	syscall
	
	j Increment
EC:
	#extra credit case
	li $v0, 4
	la $a0, extraCredit
	syscall
	
	j Increment
Increment:

	#increment loop counter and array index
	addi $t0, $t0, 4	#increment loop counter by 4 bytes
	addi $t1, $t1, 1	#increment array index by 1
	
	j loop

exitMessage:
	#call macro
	exitMess
	j exit
exit:
	#exit the program
	li $v0, 10
	syscall
