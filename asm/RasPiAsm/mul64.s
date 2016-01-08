/* Manually implement UMULL R3, R4, R1, R2 */

.global main

main:
	LDR	R1, =0xAABBCCDD
	LDR	R2, =0x11223344

	MOV	R4, R1, LSR #16		@ R4 = higher 16 bits of R1
	BIC	R1, R1, R4, LSL #16	@ R1 = lower 16 bits of R1
	MOV	R5, R2, LSR #16		@ R5 = higher 16 bits of F2
	BIC	R2, R2, R5, LSL #16	@ R2 = lower 16 bits of R2

	MUL	R3, R1, R2		@ low partial product
	MUL	R2, R4, R2		@ middle product 1
	MUL	R1, R5, R1		@ middle product 2
	MUL	R4, R5, R4		@ high partial product

	ADDS	R1, R1, R2		@ add mid products
	ADDCS	R4, R4, #0x10000	@ add shifted carry to high product
	ADDS	R3, R3, R1, LSL #16
	ADC	R4, R4, R1, LSR #16

	MOV	PC, LR	

