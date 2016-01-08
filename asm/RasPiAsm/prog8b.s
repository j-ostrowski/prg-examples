.global _start

_start:
	MOV	R8, #0xFF		@ number to print
	MOV	R10, #1
	MOV	R9, R10, LSL #7
	LDR	R1, =str
_bits:
	TST	R8, R9
	BEQ	_print0
_print1:
	MOV	R0, #'1'
	STR	R0, [R1]
	BL	_write
	BAL	_next
_print0:
	MOV	R0, #'0'
	STR	R0, [R1]
	BL	_write	
_next:
	MOVS	R9, R9, LSR #1
	BNE	_bits

_writeol:
	MOV	R0, #'\n'
	STR	R0, [R1]
	BL	_write

_exit:
	MOV	R7, #1
	MOV	R0, #0
	SWI	#0

_write:
	MOV	R0, #1
	MOV	R2, #1
	MOV	R7, #4
	SWI	#0
	BX	LR

.data
str:
	.ASCII " "	
