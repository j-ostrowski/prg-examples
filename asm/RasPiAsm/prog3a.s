	.global _start
_start:
	MOV R1, #60
	MOV R2, #2
	ADD R2, R2
	MUL R0, R1, R2
	MOV R7, #1
	SWI 0

