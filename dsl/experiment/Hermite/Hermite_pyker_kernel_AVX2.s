	.file	"Hermite_pyker_kernel_AVX2.cpp"
	.text
	.p2align 4
	.globl	_Z6kerneliPA3_dS0_S0_S0_PdS1_S0_S0_
	.type	_Z6kerneliPA3_dS0_S0_S0_PdS1_S0_S0_, @function
_Z6kerneliPA3_dS0_S0_S0_PdS1_S0_S0_:
.LFB5766:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	movq	%r8, %r13
	pushq	%r12
	.cfi_offset 12, -48
	movq	%rcx, %r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$320, %rsp
	.cfi_offset 3, -56
	movq	16(%rbp), %r8
	movq	24(%rbp), %r10
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	movq	32(%rbp), %rcx
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %r11d
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	16(%rdx), %r14
	movl	%r11d, %eax
	vcmppd	$0, %ymm0, %ymm0, %ymm7
	vmovdqa	.LC3(%rip), %xmm0
	leaq	16(%rsi), %rbx
	shrl	$2, %eax
	vmovaps	%xmm0, 288(%rsp)
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	vmovapd	%ymm7, (%rsp)
	leaq	96(%r10,%rax), %r15
	.p2align 4,,10
	.p2align 3
.L4:
	vmovapd	(%rsp), %ymm7
	vxorpd	%xmm13, %xmm13, %xmm13
	movq	%r12, %rsi
	movq	%r13, %rdx
	vmovapd	%ymm13, %ymm11
	vmovapd	%ymm13, %ymm12
	vmovapd	%ymm13, %ymm14
	xorl	%eax, %eax
	vmovdqa	288(%rsp), %xmm2
	vmovapd	%ymm7, %ymm1
	vgatherdpd	%ymm1, -16(%rbx,%xmm2,8), %ymm3
	vmovdqa	%xmm2, %xmm6
	vmovapd	%ymm3, 32(%rsp)
	vmovapd	%ymm7, %ymm3
	vgatherdpd	%ymm3, -8(%rbx,%xmm6,8), %ymm2
	vmovapd	%ymm7, %ymm3
	vmovapd	%ymm2, 64(%rsp)
	vgatherdpd	%ymm3, (%rbx,%xmm6,8), %ymm2
	vmovapd	%ymm2, 96(%rsp)
	vmovapd	%ymm7, %ymm2
	vgatherdpd	%ymm2, -16(%r14,%xmm6,8), %ymm3
	vmovapd	%ymm3, 128(%rsp)
	vmovapd	%ymm7, %ymm3
	vgatherdpd	%ymm3, -8(%r14,%xmm6,8), %ymm1
	vmovapd	%ymm1, 160(%rsp)
	vgatherdpd	%ymm7, (%r14,%xmm6,8), %ymm3
	vmovapd	%ymm13, 224(%rsp)
	vmovapd	%ymm3, 192(%rsp)
	vmovapd	%ymm13, 256(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	vbroadcastsd	(%rsi), %ymm3
	vmovapd	32(%rsp), %ymm4
	movq	%rax, %rdi
	addq	$24, %rsi
	vmovapd	64(%rsp), %ymm1
	vbroadcastsd	-16(%rsi), %ymm2
	addq	$24, %rdx
	vsubpd	%ymm3, %ymm4, %ymm3
	vmovapd	96(%rsp), %ymm6
	vmovapd	128(%rsp), %ymm4
	vsubpd	%ymm2, %ymm1, %ymm2
	vbroadcastsd	-24(%rdx), %ymm7
	vbroadcastsd	-8(%rsi), %ymm1
	vmovapd	192(%rsp), %ymm5
	vmovsd	(%r9,%rax,8), %xmm8
	vsubpd	%ymm1, %ymm6, %ymm1
	vsubpd	%ymm7, %ymm4, %ymm7
	vbroadcastsd	-16(%rdx), %ymm6
	vmulpd	%ymm3, %ymm3, %ymm0
	vmovapd	160(%rsp), %ymm4
	vsubpd	%ymm6, %ymm4, %ymm6
	vbroadcastsd	-8(%rdx), %ymm4
	vmulpd	%ymm7, %ymm3, %ymm15
	vsubpd	%ymm4, %ymm5, %ymm4
	vmulpd	%ymm2, %ymm2, %ymm5
	vmulpd	%ymm6, %ymm2, %ymm9
	vaddpd	%ymm0, %ymm5, %ymm5
	vmulpd	%ymm1, %ymm1, %ymm0
	vaddpd	%ymm9, %ymm15, %ymm9
	vmulpd	%ymm4, %ymm1, %ymm15
	vaddpd	%ymm0, %ymm5, %ymm0
	vbroadcastsd	(%r8,%rax,8), %ymm5
	addq	$1, %rax
	vaddpd	%ymm15, %ymm9, %ymm9
	vaddpd	%ymm5, %ymm0, %ymm0
	vmovapd	.LC0(%rip), %ymm5
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm5, %ymm0
	vbroadcastsd	%xmm8, %ymm5
	vmulsd	.LC1(%rip), %xmm8, %xmm8
	vbroadcastsd	%xmm8, %ymm8
	vmulpd	%ymm0, %ymm0, %ymm10
	vmulpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm0, %ymm5, %ymm5
	vmulpd	%ymm10, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm7, %ymm7
	vmulpd	%ymm8, %ymm0, %ymm0
	vmulpd	%ymm5, %ymm6, %ymm6
	vmulpd	%ymm5, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm9, %ymm9
	vmulpd	%ymm5, %ymm3, %ymm0
	vaddpd	256(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, 256(%rsp)
	vmulpd	%ymm5, %ymm2, %ymm0
	vaddpd	224(%rsp), %ymm0, %ymm0
	vmulpd	%ymm9, %ymm3, %ymm3
	vmulpd	%ymm9, %ymm2, %ymm2
	vmulpd	%ymm9, %ymm1, %ymm9
	vmovapd	%ymm0, 224(%rsp)
	vmulpd	%ymm5, %ymm1, %ymm0
	vsubpd	%ymm3, %ymm7, %ymm7
	vsubpd	%ymm2, %ymm6, %ymm6
	vsubpd	%ymm9, %ymm4, %ymm9
	vaddpd	%ymm0, %ymm14, %ymm14
	vaddpd	%ymm7, %ymm12, %ymm12
	vaddpd	%ymm6, %ymm11, %ymm11
	vaddpd	%ymm9, %ymm13, %ymm13
	cmpq	%rdi, %r11
	jne	.L3
	addq	$96, %r10
	addq	$96, %rcx
	addq	$96, %r14
	addq	$96, %rbx
	vmovapd	256(%rsp), %ymm6
	vmovapd	224(%rsp), %ymm7
	vunpckhpd	%xmm6, %xmm6, %xmm2
	vunpcklpd	%xmm7, %xmm6, %xmm1
	vextractf128	$0x1, %ymm7, %xmm0
	vunpcklpd	%xmm2, %xmm14, %xmm2
	vmovups	%xmm1, -96(%r10)
	vextractf128	$0x1, %ymm6, %xmm1
	vmovups	%xmm2, -80(%r10)
	vunpckhpd	%xmm7, %xmm7, %xmm2
	vmovsd	%xmm2, %xmm14, %xmm3
	vextractf128	$0x1, %ymm14, %xmm14
	vmovups	%xmm3, -64(%r10)
	vunpcklpd	%xmm0, %xmm1, %xmm3
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vunpcklpd	%xmm1, %xmm14, %xmm7
	vmovups	%xmm3, -48(%r10)
	vmovsd	%xmm0, %xmm14, %xmm2
	vunpckhpd	%xmm12, %xmm12, %xmm3
	vmovups	%xmm7, -32(%r10)
	vunpckhpd	%xmm11, %xmm11, %xmm0
	vunpcklpd	%xmm11, %xmm12, %xmm7
	vunpcklpd	%xmm3, %xmm13, %xmm3
	vextractf128	$0x1, %ymm12, %xmm12
	vextractf128	$0x1, %ymm11, %xmm11
	vmovups	%xmm2, -16(%r10)
	vmovsd	%xmm0, %xmm13, %xmm1
	vunpcklpd	%xmm11, %xmm12, %xmm2
	vextractf128	$0x1, %ymm13, %xmm13
	vunpckhpd	%xmm12, %xmm12, %xmm12
	vmovups	%xmm3, -80(%rcx)
	vunpckhpd	%xmm11, %xmm11, %xmm11
	vmovups	%xmm1, -64(%rcx)
	vunpcklpd	%xmm12, %xmm13, %xmm3
	vmovsd	%xmm11, %xmm13, %xmm1
	vmovups	%xmm7, -96(%rcx)
	vmovups	%xmm2, -48(%rcx)
	vmovups	%xmm3, -32(%rcx)
	vmovups	%xmm1, -16(%rcx)
	cmpq	%r15, %r10
	jne	.L4
	vzeroupper
.L2:
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L10
	leaq	-40(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L10:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5766:
	.size	_Z6kerneliPA3_dS0_S0_S0_PdS1_S0_S0_, .-_Z6kerneliPA3_dS0_S0_S0_PdS1_S0_S0_
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5767:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE5767:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1074266112
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC3:
	.quad	12884901888
	.quad	38654705670
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
