.global _start
_start:
	MOV R1, #-3
	MOV R2, #3
	CMN R1, R2
	BEQ equal
	MOV R0, #0
	MOV R7, #1
	SWI #0
equal:
	MOV R0, #111
	MOV R7, #1
	SWI #0

