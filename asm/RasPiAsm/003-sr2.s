.global _start
_start:
	mov r0, #0xFFFFFFFF
	adds r2, r0, #1
	bcs  tu
	mov r0, #0
	mov r7, #1
	swi #0
tu:
	mov r0, #100
	mov r7, #1
	swi #0

