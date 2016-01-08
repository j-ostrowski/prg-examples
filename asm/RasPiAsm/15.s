.global _start

_start:
	MOV	R11, #15
loop:
	MOV	R7, #4
	MOV	R0, #1
	LDR	R1, =str
	MOV	R2, #4	
	SWI	#0
	SUBS	R11, R11, #1
	BNE	loop

exit:
	MOV	R7, #1
	MOV	R0, #0
	SWI	#0

.data
str:	.ASCII	"Hi!\n"

