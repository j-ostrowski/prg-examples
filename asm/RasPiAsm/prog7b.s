.global _start
_start:
_read:
	MOV R7, #3 @ syscall: read
	MOV R0, #0
	MOV R2, #5
	LDR R1, =str
	SWI #0
_write:
	MOV R7, #4 @ syscall: write
	MOV R0, #2
	MOV R2, #19
	LDR R1, =str
	SWI #0

_exit:
	MOV R7, #1 @ syscall: exit
	SWI #0

.data
str:
	.ASCII "Hello world string\n"

