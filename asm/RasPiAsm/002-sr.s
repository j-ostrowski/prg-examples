.global _start

_start:
	movs	r0, #0
	bne	tu
	mov	r0, #100
	mov	r7, #1
	swi	#0
tu:
	mov	r0, #0
	mov	r7, #1
	swi	#0
		
