	.file	"pyker_check.cpp"
	.text
	.p2align 4
	.globl	_Z6kerneliPA3_dS0_PdS1_S0_
	.type	_Z6kerneliPA3_dS0_PdS1_S0_, @function
_Z6kerneliPA3_dS0_PdS1_S0_:
.LFB7327:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	andq	$-32, %rsp
	subq	$32, %rsp
	.cfi_offset 3, -24
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	testl	%edi, %edi
	jle	.L2
	leal	-1(%rdi), %r10d
	vxorpd	%xmm11, %xmm11, %xmm11
	movq	%rsi, %r11
	vmovapd	.LC0(%rip), %ymm10
	movl	%r10d, %eax
	vcmppd	$0, %ymm11, %ymm11, %ymm11
	vmovdqa	.LC2(%rip), %xmm12
	shrl	$2, %eax
	leaq	(%rax,%rax,2), %rax
	salq	$5, %rax
	leaq	96(%r9,%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L4:
	vmovapd	%ymm11, %ymm7
	vmovapd	%ymm11, %ymm6
	movq	%rdx, %rsi
	xorl	%eax, %eax
	vgatherdpd	%ymm7, (%r11,%xmm12,8), %ymm9
	vmovapd	%ymm11, %ymm7
	vgatherdpd	%ymm7, 8(%r11,%xmm12,8), %ymm8
	vgatherdpd	%ymm6, 16(%r11,%xmm12,8), %ymm7
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovapd	%ymm6, %ymm4
	vmovapd	%ymm6, %ymm5
	.p2align 4,,10
	.p2align 3
.L3:
	vbroadcastsd	(%rsi), %ymm3
	vbroadcastsd	8(%rsi), %ymm2
	movq	%rax, %rdi
	addq	$24, %rsi
	vbroadcastsd	-8(%rsi), %ymm1
	vbroadcastsd	(%r8,%rax,8), %ymm0
	vsubpd	%ymm3, %ymm9, %ymm3
	vsubpd	%ymm2, %ymm8, %ymm2
	vbroadcastsd	(%rcx,%rax,8), %ymm13
	addq	$1, %rax
	vsubpd	%ymm1, %ymm7, %ymm1
	vmulpd	%ymm3, %ymm3, %ymm14
	vfmadd231pd	%ymm2, %ymm2, %ymm14
	vfmadd231pd	%ymm1, %ymm1, %ymm14
	vaddpd	%ymm14, %ymm0, %ymm0
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm0, %ymm13, %ymm13
	vmulpd	%ymm0, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm13, %ymm0
	vfmadd231pd	%ymm0, %ymm3, %ymm5
	vfmadd231pd	%ymm0, %ymm2, %ymm4
	vfmadd231pd	%ymm0, %ymm1, %ymm6
	cmpq	%rdi, %r10
	jne	.L3
	vunpcklpd	%xmm4, %xmm5, %xmm7
	vunpckhpd	%xmm5, %xmm5, %xmm3
	vunpckhpd	%xmm4, %xmm4, %xmm0
	addq	$96, %r9
	vmovups	%xmm7, -96(%r9)
	vunpcklpd	%xmm3, %xmm6, %xmm7
	vextractf128	$0x1, %ymm5, %xmm5
	addq	$96, %r11
	vextractf128	$0x1, %ymm4, %xmm4
	vmovups	%xmm7, -80(%r9)
	vmovsd	%xmm0, %xmm6, %xmm7
	vextractf128	$0x1, %ymm6, %xmm6
	vmovups	%xmm7, -64(%r9)
	vunpcklpd	%xmm4, %xmm5, %xmm7
	vunpckhpd	%xmm5, %xmm5, %xmm5
	vunpckhpd	%xmm4, %xmm4, %xmm4
	vunpcklpd	%xmm5, %xmm6, %xmm5
	vmovsd	%xmm4, %xmm6, %xmm4
	vmovups	%xmm7, -48(%r9)
	vmovups	%xmm5, -32(%r9)
	vmovups	%xmm4, -16(%r9)
	cmpq	%rbx, %r9
	jne	.L4
	vzeroupper
.L2:
	movq	24(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L10
	movq	-8(%rbp), %rbx
	xorl	%eax, %eax
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L10:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7327:
	.size	_Z6kerneliPA3_dS0_PdS1_S0_, .-_Z6kerneliPA3_dS0_PdS1_S0_
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7328:
	.cfi_startproc
	endbr64
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	xorl	%edi, %edi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	leaq	4(%rsp), %rsi
	leaq	_ZSt3cin(%rip), %rdi
	movl	$0, 4(%rsp)
	call	_ZNSirsERi@PLT
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L14
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L14:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7328:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS1_S0_, @function
_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS1_S0_:
.LFB7809:
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
.LFE7809:
	.size	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS1_S0_, .-_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS1_S0_
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z6kerneliPA3_dS0_PdS1_S0_
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.quad	12884901888
	.quad	38654705670
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
