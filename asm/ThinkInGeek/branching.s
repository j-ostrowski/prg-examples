.text
.global main
main:
	mov	r7, #4		@ syscall 4 - write
	mov	r0, #1		@ stdout
	ldr	r1, =hello
	mov	r2, #hellolen
	swi	#0
	
	mov	r7, #4
	mov	r0, #1
	ldr	r1, =ccmsg
	mov	r2, #ccmsglen
	swi	#0

	mov	r4, #0xFFFFFFFF
	adds	r4, r4, #1
	bcs	cc1
cc0:	
	bl	print_zero
	b	ccend
cc1:
	bl	print_one
ccend:
	
	mov	r7, #1 		@ syscall 1 - exit
	mov	r0, #0		@ return code
	swi	#0

print_zero:
	mov 	r7, #4
	mov	r0, #1
	ldr	r1, =zero
	mov	r2, #2
	swi	#0
	mov	pc, lr

print_one:
	mov	r7, #4
	mov	r0, #0
	ldr	r1, =one
	mov	r2, #2
	swi	#0
	mov	pc, lr
	
.data
.balign 4
hello:	.ascii	"Hello!\n"
hellolen = . - hello
ccmsg:	.ascii	"After FFFF FFFF + 1, C = "
ccmsglen = . - ccmsg
zero:	.ascii	"0\n"
one:	.ascii	"1\n"
