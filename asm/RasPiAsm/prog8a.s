.global _start

_start:
_read:
	MOV	R7, #3		@ read syscall
	MOV	R0, #0		@ stdin handle
	LDR	R1, =str
	MOV	R2, #1
	SWI	#0

_lowercase:
	LDR	R1, =str
	LDR	R0, [R1]
	ORR	R0, R0,#0x20
	STR	R0, [R1]

_write:
	MOV	R7, #4		@ write syscall
	MOV	R0, #1		@ stdout handle
	LDR	R1, =str
	MOV	R2, #2
	SWI	#0

_exit:
	MOV	R7, #1		@ exit syscall
	MOV	R0, #0		@ exit(0)
	SWI	#0

.data
	str:	.ascii " \n"
	

