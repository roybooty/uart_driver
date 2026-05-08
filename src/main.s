	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	USART1_IRQHandler
	.syntax unified
	.arm
	.type	USART1_IRQHandler, %function
USART1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L10
	ldr	r3, [r2]
	tst	r3, #32
	bxeq	lr
	ldr	r1, [r2, #4]
.L3:
	ldr	r3, [r2]
	tst	r3, #128
	beq	.L3
	and	r3, r1, #255
	str	r3, [r2, #4]
	bx	lr
.L11:
	.align	2
.L10:
	.word	1073821696
	.size	USART1_IRQHandler, .-USART1_IRQHandler
	.align	2
	.global	USART1_putc
	.syntax unified
	.arm
	.type	USART1_putc, %function
USART1_putc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L16
.L13:
	ldr	r3, [r2]
	tst	r3, #128
	beq	.L13
	str	r0, [r2, #4]
	bx	lr
.L17:
	.align	2
.L16:
	.word	1073821696
	.size	USART1_putc, .-USART1_putc
	.align	2
	.global	USART1_puts
	.syntax unified
	.arm
	.type	USART1_puts, %function
USART1_puts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldrb	r1, [r0]	@ zero_extendqisi2
	cmp	r1, #0
	bxeq	lr
	ldr	r2, .L28
.L20:
	ldr	r3, [r2]
	tst	r3, #128
	beq	.L20
	str	r1, [r2, #4]
	ldrb	r1, [r0, #1]!	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L20
	bx	lr
.L29:
	.align	2
.L28:
	.word	1073821696
	.size	USART1_puts, .-USART1_puts
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L32
	ldr	r0, [r1, #24]
	orr	r0, r0, #16384
	str	r0, [r1, #24]
	ldr	r0, [r1, #24]
	orr	r0, r0, #4
	str	r0, [r1, #24]
	ldr	r2, .L32+4
	ldr	r0, [r2, #4]
	bic	r0, r0, #240
	str	r0, [r2, #4]
	ldr	r0, [r2, #4]
	bic	r0, r0, #3840
	str	r0, [r2, #4]
	ldr	r0, [r2, #4]
	orr	r0, r0, #224
	str	r0, [r2, #4]
	ldr	r0, [r2, #4]
	orr	r0, r0, #1024
	str	r0, [r2, #4]
	ldr	r3, .L32+8
	ldr	r2, [r3, #12]
	orr	r2, r2, #8
	str	r2, [r3, #12]
	ldr	r2, [r3, #12]
	orr	r2, r2, #4
	str	r2, [r3, #12]
	ldr	r2, [r3, #12]
	orr	r2, r2, #32
	str	r2, [r3, #12]
	ldr	r2, [r3, #12]
	orr	r2, r2, #8192
	ldr	r1, .L32+12
	str	r2, [r3, #12]
	ldr	r3, [r1, #644]
	orr	r3, r3, #32
	str	r3, [r1, #644]
	ldr	r3, [r1, #260]
	orr	r3, r3, #32
	str	r3, [r1, #260]
	ldr	r3, [r1, #1060]
	orr	r3, r3, #20480
	str	r3, [r1, #1060]
	.syntax divided
@ 58 "main.c" 1
	cpsie i
@ 0 "" 2
	.arm
	.syntax unified
.L31:
	.syntax divided
@ 60 "main.c" 1
	wfi
@ 0 "" 2
	.arm
	.syntax unified
	b	.L31
.L33:
	.align	2
.L32:
	.word	1073876992
	.word	1073809408
	.word	1073821696
	.word	-536813568
	.size	main, .-main
	.text
	.align	2
	.global	_reset
	.syntax unified
	.arm
	.type	_reset, %function
_reset:
	@ Function supports interworking.
	@ Naked Function: prologue and epilogue provided by programmer.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L37
	ldr	r1, .L37+4
	cmp	r1, r3
	bcs	.L35
	sub	r2, r3, #1
	sub	r2, r2, r1
	bic	r2, r2, #3
	mov	r1, #0
	ldr	r0, .L37+4
	add	r2, r2, #4
	bl	memset
.L35:
	ldr	r3, .L37+8
	ldr	r1, .L37+12
	cmp	r1, r3
	bcs	.L36
	sub	r2, r3, #1
	sub	r2, r2, r1
	bic	r2, r2, #3
	mov	r0, r1
	add	r2, r2, #4
	ldr	r1, .L37+16
	bl	memcpy
.L36:
	bl	main
.L38:
	.align	2
.L37:
	.word	_ebss
	.word	_sbss
	.word	_edata
	.word	_sdata
	.word	_sidata
	.size	_reset, .-_reset
	.global	tab
	.section	.vectors,"a"
	.align	2
	.type	tab, %object
	.size	tab, 236
tab:
	.word	_estack
	.word	_reset
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	USART1_IRQHandler
	.space	20
	.ident	"GCC: (Arch Repository) 14.2.0"
