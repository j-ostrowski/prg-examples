.global _start
_start:
	MOV R7, #4 @ syscall: write
	MOV R0, #2
	MOV R2, #19
	LDR R1, =str
	SWI #0

	MOV R7, #1 @ syscall: exit
	SWI #0

.data
str:
	.ASCII "Hello world string\n"

