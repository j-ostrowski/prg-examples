.global _start

_start:
	MOV	R6, #15
	MOV	R9, #0x80
	LDR	R1, =str
_bits:
	TST	R6, R9
	MOVEQ	R0, #'0'
	MOVNE	R0, #'1'
	STR	R0, [R1]
	MOV	R8, R6
	BL	_write
	MOV	R6, R8
	MOVS	R9, R9, LSR #1
	BNE	_bits
	MOV	R0, #'\n'
	STR	R0, [R1]
	BL	_write
_exit:
	MOV	R7, #1
	MOV	R0, #0
	SWI	#0

_write:
	MOV	R7, #4
	MOV	R0, #1
	MOV	R2, #1
	SWi	#0

	BX	LR

.data
str:	.ASCII	" "	
