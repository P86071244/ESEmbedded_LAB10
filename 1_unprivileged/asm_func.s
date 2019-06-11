.syntax unified // thumb-2 declaration

.global	read_sp
read_sp:
	mov r0, sp
	bx lr

.global	read_msp
read_msp:
	mrs r0, msp
	bx lr

.global	read_psp
read_psp:
	mrs r0, psp
	bx lr

.global	read_ctrl
read_ctrl:
	mrs r0, control
	bx lr

.global	start_user
start_user:
	msr psp, r1	// assign psp
	movs r2, #0b11 
	msr control, r2 // switch to privilege mode and use process stack pointer
	bx r0 // branch to task_addr
	isb // clear pipeline

.global	sw_priv
sw_priv:
	movs r2, #0b00 // switch to privilege
	msr control, r2
	isb // clear pipeline
	bx lr
