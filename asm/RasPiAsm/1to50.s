.global _start

_start:
	MOV	R8, #1
loop:
	MOV	R0, R8
	CMP	R0, #9
	BHI	first_digit
	MOV	R1, #' '
	LDR	R2, =str
	STR	R1, [R2]
	BLS	second_digit
first_digit:
	MOV	R1, #'1'
	CMP	R0, #19
	MOVHI	R1, #'2'
	CMP	R0, #29
	MOVHI	R1, #'3'
	CMP	R0, #39
	MOVHI	R1, #'4'
	CMP	R0, #49
	MOVHI	R1, #'5'
	LDR	R2, =str
	STR	R1, [R2]
second_digit:
	CMP	R0, #9
	BLS	cleared
	SUB	R0, R0, #10
	BAL	second_digit
cleared:
	ADD	R0, R0, #'0' 
	LDR	R1, =str
	STR	R0, [R1, #1]
eol:
	MOV	R0, #'\n'
	STR	R0, [R1, #2]
write:
	MOV	R7, #4
	MOV	R0, #1
	MOV	R2, #3
	SWI	#0

	ADD	R8, R8, #1
	CMP	R8, #51
	BNE	loop

exit:
	MOV	R7, #1
	MOV	R0, R8 
	SWI	#0	

.data
.balign	4
str:	.byte	4	
