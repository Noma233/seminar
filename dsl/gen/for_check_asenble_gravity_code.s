	.file	"for_check_asenble_gravity_code.cpp"
	.text
	.p2align 4
	.globl	_Z6kerneliPA3_dS0_PdS0_dd
	.type	_Z6kerneliPA3_dS0_PdS0_dd, @function
_Z6kerneliPA3_dS0_PdS0_dd:
.LFB9122:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdx, 48(%rsp)
	movsd	%xmm0, 40(%rsp)
	movsd	%xmm1, (%rsp)
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %eax
	movq	%rcx, %r12
	movq	%rsi, %r15
	movq	%r8, %rbx
	leaq	(%rax,%rax,2), %rdx
	leaq	8(%r12,%rax,8), %r14
	leaq	24(%r8,%rdx,8), %rcx
	movq	%rcx, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L4:
	movq	48(%rsp), %r13
	movq	%r12, %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	8(%r13), %xmm4
	movsd	(%rsp), %xmm5
	addq	$8, %rbp
	addq	$24, %r13
	mulsd	-8(%rbp), %xmm5
	movsd	-24(%r13), %xmm2
	movapd	%xmm4, %xmm7
	subsd	8(%r15), %xmm7
	subsd	(%r15), %xmm2
	movsd	-8(%r13), %xmm3
	movq	.LC0(%rip), %rax
	movapd	%xmm7, %xmm0
	movapd	%xmm3, %xmm6
	subsd	16(%r15), %xmm6
	movsd	%xmm7, 8(%rsp)
	mulsd	%xmm2, %xmm5
	movq	%rax, %xmm1
	mulsd	%xmm7, %xmm0
	mulsd	%xmm2, %xmm2
	movsd	%xmm6, 24(%rsp)
	movsd	%xmm5, 32(%rsp)
	addsd	%xmm0, %xmm2
	movapd	%xmm6, %xmm0
	mulsd	%xmm6, %xmm0
	addsd	%xmm0, %xmm2
	addsd	40(%rsp), %xmm2
	movapd	%xmm2, %xmm0
	movsd	%xmm2, 16(%rsp)
	call	pow@PLT
	movsd	32(%rsp), %xmm5
	movsd	(%rsp), %xmm4
	movsd	8(%rsp), %xmm7
	movq	.LC0(%rip), %rax
	divsd	%xmm0, %xmm5
	movsd	16(%rsp), %xmm2
	movq	%rax, %xmm1
	movapd	%xmm2, %xmm0
	addsd	(%rbx), %xmm5
	movsd	%xmm5, (%rbx)
	mulsd	-8(%rbp), %xmm4
	mulsd	%xmm7, %xmm4
	movsd	%xmm4, 8(%rsp)
	call	pow@PLT
	movsd	8(%rsp), %xmm4
	movsd	(%rsp), %xmm3
	movsd	24(%rsp), %xmm6
	movq	.LC0(%rip), %rax
	divsd	%xmm0, %xmm4
	movsd	16(%rsp), %xmm2
	movq	%rax, %xmm1
	movapd	%xmm2, %xmm0
	addsd	8(%rbx), %xmm4
	movsd	%xmm4, 8(%rbx)
	mulsd	-8(%rbp), %xmm3
	mulsd	%xmm6, %xmm3
	movsd	%xmm3, 8(%rsp)
	call	pow@PLT
	movsd	8(%rsp), %xmm3
	divsd	%xmm0, %xmm3
	addsd	16(%rbx), %xmm3
	movsd	%xmm3, 16(%rbx)
	cmpq	%rbp, %r14
	jne	.L3
	addq	$24, %r15
	addq	$24, %rbx
	cmpq	%rbx, 56(%rsp)
	jne	.L4
.L2:
	addq	$72, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9122:
	.size	_Z6kerneliPA3_dS0_PdS0_dd, .-_Z6kerneliPA3_dS0_PdS0_dd
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9123:
	.cfi_startproc
	endbr64
	subq	$584, %rsp
	.cfi_def_cfa_offset 592
	movsd	.LC1(%rip), %xmm1
	movsd	.LC2(%rip), %xmm0
	movl	$10, %edi
	leaq	80(%rsp), %rsi
	movq	%rsp, %rcx
	leaq	320(%rsp), %r8
	movq	%fs:40, %rax
	movq	%rax, 568(%rsp)
	xorl	%eax, %eax
	movq	%rsi, %rdx
	call	_Z6kerneliPA3_dS0_PdS0_dd
	movq	568(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L12
	xorl	%eax, %eax
	addq	$584, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE9123:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS0_dd, @function
_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS0_dd:
.LFB9640:
	.cfi_startproc
	endbr64
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE9640:
	.size	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS0_dd, .-_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS0_dd
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS0_dd
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1073217536
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1067450368
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
