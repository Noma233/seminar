	.file	"pyker_check.cpp"
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
	subq	$256, %rsp
	.cfi_offset 3, -56
	movq	16(%rbp), %r8
	movq	24(%rbp), %r10
	movq	%fs:40, %rax
	movq	%rax, 248(%rsp)
	xorl	%eax, %eax
	movq	32(%rbp), %rcx
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %r11d
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	16(%rdx), %r14
	movl	%r11d, %eax
	vcmppd	$0, %ymm0, %ymm0, %ymm1
	vmovdqa	.LC3(%rip), %xmm0
	leaq	16(%rsi), %rbx
	shrl	$2, %eax
	vmovaps	%xmm0, 224(%rsp)
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	vmovapd	%ymm1, (%rsp)
	leaq	96(%r10,%rax), %r15
	.p2align 4,,10
	.p2align 3
.L4:
	vmovapd	(%rsp), %ymm3
	vxorpd	%xmm13, %xmm13, %xmm13
	movq	%r12, %rsi
	movq	%r13, %rdx
	vmovapd	%ymm13, %ymm10
	vmovapd	%ymm13, %ymm11
	vmovapd	%ymm13, %ymm14
	xorl	%eax, %eax
	vmovapd	%ymm3, %ymm1
	vmovapd	%ymm13, %ymm12
	vmovapd	%ymm13, %ymm15
	vmovdqa	224(%rsp), %xmm6
	vgatherdpd	%ymm1, -16(%rbx,%xmm6,8), %ymm2
	vmovapd	%ymm3, %ymm1
	vmovdqa	%xmm6, %xmm7
	vmovapd	%ymm2, 32(%rsp)
	vgatherdpd	%ymm1, -8(%rbx,%xmm6,8), %ymm2
	vmovapd	%ymm2, 64(%rsp)
	vmovapd	%ymm3, %ymm2
	vgatherdpd	%ymm2, (%rbx,%xmm6,8), %ymm1
	vmovapd	%ymm1, 96(%rsp)
	vmovapd	%ymm3, %ymm1
	vgatherdpd	%ymm1, -16(%r14,%xmm6,8), %ymm2
	vmovapd	%ymm2, 128(%rsp)
	vmovapd	%ymm3, %ymm2
	vgatherdpd	%ymm2, -8(%r14,%xmm7,8), %ymm6
	vmovapd	%ymm6, 160(%rsp)
	vgatherdpd	%ymm3, (%r14,%xmm7,8), %ymm2
	vmovapd	%ymm2, 192(%rsp)
	.p2align 4,,10
	.p2align 3
.L3:
	vbroadcastsd	(%rsi), %ymm3
	vmovapd	32(%rsp), %ymm4
	movq	%rax, %rdi
	addq	$24, %rsi
	vbroadcastsd	-16(%rsi), %ymm2
	vmovapd	96(%rsp), %ymm5
	addq	$24, %rdx
	vsubpd	%ymm3, %ymm4, %ymm3
	vmovapd	64(%rsp), %ymm4
	vbroadcastsd	-8(%rsi), %ymm1
	vbroadcastsd	-24(%rdx), %ymm6
	vbroadcastsd	(%r8,%rax,8), %ymm7
	vsubpd	%ymm2, %ymm4, %ymm2
	vsubpd	%ymm1, %ymm5, %ymm1
	vbroadcastsd	-16(%rdx), %ymm5
	vmovapd	128(%rsp), %ymm4
	vmovapd	192(%rsp), %ymm0
	vbroadcastsd	(%r9,%rax,8), %ymm9
	vsubpd	%ymm6, %ymm4, %ymm6
	vmovapd	160(%rsp), %ymm4
	vsubpd	%ymm5, %ymm4, %ymm5
	vbroadcastsd	-8(%rdx), %ymm4
	vsubpd	%ymm4, %ymm0, %ymm4
	vmulpd	%ymm3, %ymm3, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vfmadd231pd	%ymm1, %ymm1, %ymm0
	vaddpd	%ymm0, %ymm7, %ymm0
	vmovapd	.LC0(%rip), %ymm7
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm7, %ymm0
	vmulpd	%ymm6, %ymm3, %ymm7
	vfmadd231pd	%ymm5, %ymm2, %ymm7
	vfmadd231pd	%ymm4, %ymm1, %ymm7
	vmulpd	%ymm0, %ymm0, %ymm8
	vmulpd	%ymm0, %ymm8, %ymm0
	vmulpd	%ymm8, %ymm0, %ymm8
	vmulpd	%ymm0, %ymm9, %ymm0
	vmovsd	.LC1(%rip), %xmm9
	vmulsd	(%r9,%rax,8), %xmm9, %xmm9
	addq	$1, %rax
	vmulpd	%ymm0, %ymm6, %ymm6
	vfmadd231pd	%ymm0, %ymm3, %ymm15
	vmulpd	%ymm0, %ymm5, %ymm5
	vfmadd231pd	%ymm0, %ymm2, %ymm12
	vbroadcastsd	%xmm9, %ymm9
	vmulpd	%ymm8, %ymm9, %ymm8
	vfmadd231pd	%ymm0, %ymm1, %ymm14
	vmulpd	%ymm0, %ymm4, %ymm0
	vmulpd	%ymm7, %ymm8, %ymm8
	vfnmadd231pd	%ymm8, %ymm3, %ymm6
	vfnmadd231pd	%ymm8, %ymm2, %ymm5
	vfnmadd132pd	%ymm1, %ymm0, %ymm8
	vaddpd	%ymm6, %ymm11, %ymm11
	vaddpd	%ymm5, %ymm10, %ymm10
	vaddpd	%ymm8, %ymm13, %ymm13
	cmpq	%rdi, %r11
	jne	.L3
	vunpcklpd	%xmm12, %xmm15, %xmm1
	vunpckhpd	%xmm15, %xmm15, %xmm3
	addq	$96, %r10
	addq	$96, %rcx
	vmovups	%xmm1, -96(%r10)
	vunpcklpd	%xmm3, %xmm14, %xmm1
	addq	$96, %r14
	addq	$96, %rbx
	vmovups	%xmm1, -80(%r10)
	vunpckhpd	%xmm12, %xmm12, %xmm1
	vextractf128	$0x1, %ymm15, %xmm0
	vextractf128	$0x1, %ymm12, %xmm12
	vmovsd	%xmm1, %xmm14, %xmm2
	vextractf128	$0x1, %ymm14, %xmm14
	vmovups	%xmm2, -64(%r10)
	vunpcklpd	%xmm12, %xmm0, %xmm2
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vunpckhpd	%xmm12, %xmm12, %xmm12
	vmovups	%xmm2, -48(%r10)
	vunpcklpd	%xmm0, %xmm14, %xmm3
	vmovsd	%xmm12, %xmm14, %xmm2
	vunpckhpd	%xmm10, %xmm10, %xmm0
	vmovups	%xmm3, -32(%r10)
	vmovsd	%xmm0, %xmm13, %xmm1
	vunpckhpd	%xmm11, %xmm11, %xmm3
	vmovups	%xmm2, -16(%r10)
	vunpcklpd	%xmm10, %xmm11, %xmm2
	vextractf128	$0x1, %ymm11, %xmm11
	vextractf128	$0x1, %ymm10, %xmm10
	vunpcklpd	%xmm3, %xmm13, %xmm3
	vmovups	%xmm1, -64(%rcx)
	vextractf128	$0x1, %ymm13, %xmm13
	vunpcklpd	%xmm10, %xmm11, %xmm1
	vunpckhpd	%xmm11, %xmm11, %xmm11
	vunpckhpd	%xmm10, %xmm10, %xmm10
	vmovups	%xmm2, -96(%rcx)
	vmovups	%xmm3, -80(%rcx)
	vmovsd	%xmm10, %xmm13, %xmm2
	vunpcklpd	%xmm11, %xmm13, %xmm3
	vmovups	%xmm1, -48(%rcx)
	vmovups	%xmm3, -32(%rcx)
	vmovups	%xmm2, -16(%rcx)
	cmpq	%r15, %r10
	jne	.L4
	vzeroupper
.L2:
	movq	248(%rsp), %rax
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
