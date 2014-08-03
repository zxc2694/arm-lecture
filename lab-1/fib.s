	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
        SUBS R4, R0, #0
	@ if(R0 <= 0) goto .L3 (which returns 0)
        BLE .L3

	@ Compare R4 wtih 1
        CMP R4, #1
	@ If R4 == 1 goto .L4 (which returns 1)
        BEQ .L4

	@ R0 = R4 - 1
        SUB R0, R4, #1
	@ Recursive call to fibonacci with R4 - 1 as parameter
        BL fibonacci


	@ R5 = R0
        MOV R5, R0
	@ R0 = R4 - 2
        SUB R0, R4, #2
	@ Recursive call to fibonacci with R4 - 2 as parameter
        BL fibonacci

	@ R0 = R5 + R0 (update flags)
        ADD R0, R5

	pop {r3, r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
