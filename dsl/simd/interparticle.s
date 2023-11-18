	.file	"interparticle.cpp"
	.text
	.p2align 4
	.globl	_Z16evaluate_gravityiiPA3_dS0_PdS0_
	.type	_Z16evaluate_gravityiiPA3_dS0_PdS0_, @function
_Z16evaluate_gravityiiPA3_dS0_PdS0_:
.LFB9123:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L12
	vmovsd	.LC1(%rip), %xmm10
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	xorl	%r10d, %r10d
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdx, %rcx
	movq	%r9, %rbx
	vxorpd	%xmm11, %xmm11, %xmm11
	leal	-1(%rsi), %r11d
	.p2align 4,,10
	.p2align 3
.L6:
	vmovsd	(%rcx), %xmm7
	vmovsd	8(%rcx), %xmm8
	vmovsd	16(%rcx), %xmm9
	testl	%esi, %esi
	jle	.L7
	movq	%rbp, %rdx
	vmovapd	%xmm11, %xmm5
	vmovapd	%xmm11, %xmm6
	xorl	%eax, %eax
	vmovapd	%xmm11, %xmm4
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r9, %rax
.L5:
	cmpl	%eax, %r10d
	je	.L4
	vmovsd	(%rdx), %xmm2
	vmovsd	8(%rdx), %xmm1
	vmovsd	16(%rdx), %xmm0
	vsubsd	%xmm7, %xmm2, %xmm2
	vsubsd	%xmm8, %xmm1, %xmm1
	vsubsd	%xmm9, %xmm0, %xmm0
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm3
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm1, %xmm12
	vaddsd	%xmm12, %xmm3, %xmm3
	vmulsd	%xmm0, %xmm0, %xmm12
	vaddsd	%xmm12, %xmm3, %xmm3
	vdivsd	%xmm3, %xmm10, %xmm3
	vmulsd	(%r8,%rax,8), %xmm3, %xmm12
	vmulsd	%xmm3, %xmm12, %xmm12
	vmulsd	%xmm3, %xmm12, %xmm3
	vmulsd	%xmm3, %xmm2, %xmm2
	vmulsd	%xmm3, %xmm1, %xmm1
	vmulsd	%xmm3, %xmm0, %xmm3
	vaddsd	%xmm2, %xmm4, %xmm4
	vaddsd	%xmm1, %xmm6, %xmm6
	vaddsd	%xmm3, %xmm5, %xmm5
.L4:
	leaq	1(%rax), %r9
	addq	$24, %rdx
	cmpq	%r11, %rax
	jne	.L8
.L3:
	vunpcklpd	%xmm6, %xmm4, %xmm4
	addl	$1, %r10d
	addq	$24, %rcx
	addq	$24, %rbx
	vmovups	%xmm4, -24(%rbx)
	vmovsd	%xmm5, -8(%rbx)
	cmpl	%r10d, %edi
	jne	.L6
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	vmovapd	%xmm11, %xmm5
	vmovapd	%xmm11, %xmm6
	vmovapd	%xmm11, %xmm4
	jmp	.L3
.L12:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	ret
	.cfi_endproc
.LFE9123:
	.size	_Z16evaluate_gravityiiPA3_dS0_PdS0_, .-_Z16evaluate_gravityiiPA3_dS0_PdS0_
	.p2align 4
	.globl	_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_
	.type	_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_, @function
_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_:
.LFB9124:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	movq	48(%rbp), %r11
	.cfi_offset 13, -24
	movq	32(%rbp), %r13
	pushq	%r12
	.cfi_offset 12, -32
	movq	64(%rbp), %r12
	pushq	%rbx
	.cfi_offset 3, -40
	movq	56(%rbp), %rbx
	testl	%edi, %edi
	jle	.L24
	leal	-1(%rsi), %eax
	vmovapd	.LC2(%rip), %ymm10
	xorl	%r9d, %r9d
	salq	$5, %rax
	leaq	32(%r13,%rax), %r10
	.p2align 4,,10
	.p2align 3
.L20:
	vmovapd	(%rdx,%r9,8), %ymm7
	vmovapd	(%rcx,%r9,8), %ymm8
	vmovapd	(%r8,%r9,8), %ymm9
	testl	%esi, %esi
	jle	.L21
	vxorpd	%xmm4, %xmm4, %xmm4
	movq	%r13, %rax
	vmovapd	%ymm4, %ymm5
	vmovapd	%ymm4, %ymm6
	.p2align 4,,10
	.p2align 3
.L19:
	vbroadcastsd	(%rax), %ymm3
	vbroadcastsd	8(%rax), %ymm2
	addq	$32, %rax
	vbroadcastsd	-16(%rax), %ymm1
	vsubpd	%ymm7, %ymm3, %ymm3
	vsubpd	%ymm8, %ymm2, %ymm2
	vsubpd	%ymm9, %ymm1, %ymm1
	vmulpd	%ymm2, %ymm2, %ymm11
	vmulpd	%ymm3, %ymm3, %ymm0
	vaddpd	%ymm11, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm1, %ymm11
	vaddpd	%ymm11, %ymm0, %ymm0
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm11
	vmulpd	%ymm0, %ymm11, %ymm0
	vbroadcastsd	-8(%rax), %ymm11
	vmulpd	%ymm11, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm2, %ymm2
	vmulpd	%ymm0, %ymm1, %ymm0
	vaddpd	%ymm3, %ymm6, %ymm6
	vaddpd	%ymm2, %ymm5, %ymm5
	vaddpd	%ymm0, %ymm4, %ymm4
	cmpq	%rax, %r10
	jne	.L19
.L18:
	vmovapd	%ymm6, (%r11,%r9,8)
	vmovapd	%ymm5, (%rbx,%r9,8)
	vmovapd	%ymm4, (%r12,%r9,8)
	addq	$4, %r9
	cmpl	%r9d, %edi
	jg	.L20
	vzeroupper
.L24:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L21:
	.cfi_restore_state
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	%ymm4, %ymm5
	vmovapd	%ymm4, %ymm6
	jmp	.L18
	.cfi_endproc
.LFE9124:
	.size	_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_, .-_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_
	.section	.text._ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E,"axG",@progbits,_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	.type	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E, @function
_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E:
.LFB9584:
	.cfi_startproc
	endbr64
	testq	%rsi, %rsi
	je	.L42
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
.L30:
	movq	24(%rbp), %rsi
	movq	%r12, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	movq	32(%rbp), %rdi
	movq	16(%rbp), %rbx
	testq	%rdi, %rdi
	je	.L28
	call	_ZdlPv@PLT
	movq	%rbp, %rdi
	call	_ZdlPv@PLT
	testq	%rbx, %rbx
	je	.L40
.L29:
	movq	%rbx, %rbp
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L28:
	movq	%rbp, %rdi
	call	_ZdlPv@PLT
	testq	%rbx, %rbx
	jne	.L29
.L40:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L42:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE9584:
	.size	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E, .-_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	.section	.rodata._ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_.str1.1,"aMS",@progbits,1
.LC3:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.type	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, @function
_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_:
.LFB9601:
	.cfi_startproc
	endbr64
	movabsq	$1152921504606846975, %rcx
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
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	8(%rdi), %r12
	movq	(%rdi), %r8
	movq	%r12, %rax
	subq	%r8, %rax
	sarq	$3, %rax
	cmpq	%rcx, %rax
	je	.L60
	movq	%rdx, %r15
	movq	%rsi, %rdx
	movq	%rdi, %rbx
	movq	%rsi, %r13
	subq	%r8, %rdx
	testq	%rax, %rax
	je	.L55
	movabsq	$9223372036854775800, %r14
	leaq	(%rax,%rax), %rsi
	cmpq	%rsi, %rax
	jbe	.L61
.L47:
	movq	%r14, %rdi
	movq	%rdx, 8(%rsp)
	movq	%r8, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %r8
	movq	8(%rsp), %rdx
	movq	%rax, %rbp
	addq	%rax, %r14
.L54:
	vmovsd	(%r15), %xmm0
	leaq	8(%rbp,%rdx), %r9
	subq	%r13, %r12
	leaq	(%r9,%r12), %r15
	vmovsd	%xmm0, 0(%rbp,%rdx)
	testq	%rdx, %rdx
	jg	.L62
	testq	%r12, %r12
	jg	.L50
	testq	%r8, %r8
	jne	.L53
.L51:
	vmovq	%rbp, %xmm1
	movq	%r14, 16(%rbx)
	vpinsrq	$1, %r15, %xmm1, %xmm0
	vmovups	%xmm0, (%rbx)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
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
	.p2align 4,,10
	.p2align 3
.L62:
	.cfi_restore_state
	movq	%r8, %rsi
	movq	%rbp, %rdi
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	call	memmove@PLT
	testq	%r12, %r12
	movq	(%rsp), %r8
	movq	8(%rsp), %r9
	jg	.L50
.L53:
	movq	%r8, %rdi
	call	_ZdlPv@PLT
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L61:
	testq	%rsi, %rsi
	jne	.L48
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r9, %rdi
	movq	%r8, (%rsp)
	call	memcpy@PLT
	movq	(%rsp), %r8
	testq	%r8, %r8
	je	.L51
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L55:
	movl	$8, %r14d
	jmp	.L47
.L60:
	leaq	.LC3(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L48:
	cmpq	%rcx, %rsi
	cmovbe	%rsi, %rcx
	movq	%rcx, %r14
	salq	$3, %r14
	jmp	.L47
	.cfi_endproc
.LFE9601:
	.size	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, .-_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.section	.text._ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_,"axG",@progbits,_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_
	.type	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_, @function
_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_:
.LFB9696:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	16(%rdi), %rbx
	testq	%rbx, %rbx
	je	.L93
	movq	8(%rsi), %rdi
	movq	(%rsi), %r9
	movq	%rdi, %rsi
	subq	%r9, %rsi
	.p2align 4,,10
	.p2align 3
.L66:
	movq	40(%rbx), %r10
	movq	32(%rbx), %r8
	movq	%r10, %r11
	movq	%r8, %rdx
	subq	%r8, %r11
	leaq	(%r9,%r11), %rcx
	cmpq	%rsi, %r11
	cmovge	%rdi, %rcx
	cmpq	%rcx, %r9
	je	.L69
	movq	%r9, %rax
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L90:
	vcomisd	%xmm0, %xmm1
	ja	.L72
	addq	$8, %rax
	addq	$8, %rdx
	cmpq	%rax, %rcx
	je	.L69
.L73:
	vmovsd	(%rax), %xmm1
	vmovsd	(%rdx), %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L90
.L70:
	movq	16(%rbx), %rax
	movl	$1, %edx
	testq	%rax, %rax
	je	.L67
.L94:
	movq	%rax, %rbx
	jmp	.L66
	.p2align 4,,10
	.p2align 3
.L69:
	cmpq	%rdx, %r10
	jne	.L70
.L72:
	movq	24(%rbx), %rax
	xorl	%edx, %edx
	testq	%rax, %rax
	jne	.L94
.L67:
	movq	%rbx, %rax
	testb	%dl, %dl
	jne	.L65
.L75:
	leaq	(%r8,%rsi), %rdx
	cmpq	%r11, %rsi
	cmovl	%rdx, %r10
	cmpq	%r10, %r8
	jne	.L83
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L91:
	vcomisd	%xmm0, %xmm1
	ja	.L82
	addq	$8, %r8
	addq	$8, %r9
	cmpq	%r8, %r10
	je	.L79
.L83:
	vmovsd	(%r8), %xmm1
	vmovsd	(%r9), %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L91
.L80:
	xorl	%r8d, %r8d
	movq	%rax, %rdx
.L77:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%r8, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L93:
	.cfi_restore_state
	leaq	8(%rdi), %rbx
.L65:
	xorl	%r8d, %r8d
	movq	%rbx, %rdx
	cmpq	%rbx, 24(%r12)
	je	.L77
	movq	%rbx, %rdi
	call	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base@PLT
	movq	8(%rbp), %rdi
	movq	0(%rbp), %r9
	movq	40(%rax), %r10
	movq	32(%rax), %r8
	movq	%rax, %rdx
	movq	%rbx, %rax
	movq	%rdi, %rsi
	movq	%rdx, %rbx
	movq	%r10, %r11
	subq	%r9, %rsi
	subq	%r8, %r11
	jmp	.L75
.L79:
	cmpq	%r9, %rdi
	jne	.L80
.L82:
	movq	%rbx, %r8
	xorl	%edx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%r8, %rax
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9696:
	.size	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_, .-_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_
	.section	.text._ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,"axG",@progbits,_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_
	.type	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_, @function
_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_:
.LFB9715:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA9715
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	$1, %r15d
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rcx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	testq	%rsi, %rsi
	je	.L117
.L96:
	movl	$56, %edi
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	movq	0(%rbp), %rsi
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rax, %r12
	movq	8(%rbp), %rax
	movq	$0, 48(%r12)
	movq	%rax, %rbx
	vmovups	%xmm0, 32(%r12)
	subq	%rsi, %rbx
	movq	%rbx, %rdx
	sarq	$3, %rdx
	je	.L118
	movabsq	$1152921504606846975, %rax
	cmpq	%rax, %rdx
	ja	.L119
	movq	%rbx, %rdi
.LEHB1:
	call	_Znwm@PLT
	movq	%rax, %rcx
	movq	8(%rbp), %rax
	movq	0(%rbp), %rsi
	movq	%rax, %rbp
	subq	%rsi, %rbp
.L102:
	vmovq	%rcx, %xmm2
	addq	%rcx, %rbx
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movq	%rbx, 48(%r12)
	vmovups	%xmm0, 32(%r12)
	cmpq	%rax, %rsi
	je	.L104
	movq	%rcx, %rdi
	movq	%rbp, %rdx
	call	memmove@PLT
	movq	%rax, %rcx
.L104:
	addq	%rbp, %rcx
	movzbl	%r15b, %edi
	movq	%r14, %rdx
	movq	%r12, %rsi
	movq	%rcx, 40(%r12)
	leaq	8(%r13), %rcx
	call	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_@PLT
	addq	$1, 40(%r13)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r12, %rax
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
	.p2align 4,,10
	.p2align 3
.L117:
	.cfi_restore_state
	leaq	8(%rdi), %rax
	cmpq	%rax, %rdx
	je	.L96
	movq	40(%rdx), %rdi
	movq	8(%rcx), %rcx
	movq	0(%rbp), %rax
	movq	32(%rdx), %rdx
	movq	%rcx, %r9
	movq	%rdi, %rsi
	subq	%rdx, %rsi
	subq	%rax, %r9
	leaq	(%rax,%rsi), %r8
	cmpq	%rsi, %r9
	cmovg	%r8, %rcx
	cmpq	%rcx, %rax
	jne	.L100
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L114:
	vcomisd	%xmm0, %xmm1
	ja	.L110
	addq	$8, %rax
	addq	$8, %rdx
	cmpq	%rax, %rcx
	je	.L98
.L100:
	vmovsd	(%rax), %xmm1
	vmovsd	(%rdx), %xmm0
	vcomisd	%xmm1, %xmm0
	jbe	.L114
	movl	$1, %r15d
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L118:
	movq	%rbx, %rbp
	xorl	%ecx, %ecx
	jmp	.L102
	.p2align 4,,10
	.p2align 3
.L98:
	cmpq	%rdx, %rdi
	setne	%r15b
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L110:
	xorl	%r15d, %r15d
	jmp	.L96
.L119:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE1:
.L111:
	endbr64
	movq	%rax, %rdi
.L105:
	vzeroupper
	call	__cxa_begin_catch@PLT
	movq	%r12, %rdi
	call	_ZdlPv@PLT
.LEHB2:
	call	__cxa_rethrow@PLT
.LEHE2:
.L112:
	endbr64
	movq	%rax, %rbp
.L106:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	%rbp, %rdi
.LEHB3:
	call	_Unwind_Resume@PLT
.LEHE3:
	.cfi_endproc
.LFE9715:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,"aG",@progbits,_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,comdat
	.align 4
.LLSDA9715:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT9715-.LLSDATTD9715
.LLSDATTD9715:
	.byte	0x1
	.uleb128 .LLSDACSE9715-.LLSDACSB9715
.LLSDACSB9715:
	.uleb128 .LEHB0-.LFB9715
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB9715
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L111-.LFB9715
	.uleb128 0x1
	.uleb128 .LEHB2-.LFB9715
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L112-.LFB9715
	.uleb128 0
	.uleb128 .LEHB3-.LFB9715
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE9715:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT9715:
	.section	.text._ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,"axG",@progbits,_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_,comdat
	.size	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_, .-_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_
	.section	.text._ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,"axG",@progbits,_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,comdat
	.p2align 4
	.weak	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.type	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, @function
_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_:
.LFB9772:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	vxorps	%xmm8, %xmm8, %xmm8
	movl	$2, %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	leaq	1792(%rdi), %rsi
	vpxor	%xmm2, %xmm2, %xmm2
	movl	$2567483615, %r9d
	leaq	4984(%rdi), %rcx
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	vmovsd	.LC1(%rip), %xmm7
	movq	4992(%rdi), %rdx
	vmovdqa	.LC5(%rip), %ymm6
	vmovdqa	.LC6(%rip), %ymm5
	vmovdqa	.LC7(%rip), %ymm4
	vmovdqa	.LC8(%rip), %ymm3
	vmovsd	%xmm7, -8(%rsp)
	cmpq	$623, %rdx
	ja	.L121
.L149:
	movq	%rdx, %rax
	addq	$1, %rdx
.L122:
	movq	(%rdi,%rax,8), %rax
	movq	%rdx, 4992(%rdi)
	movq	%rax, %r10
	shrq	$11, %r10
	movl	%r10d, %r10d
	xorq	%r10, %rax
	movq	%rax, %r10
	salq	$7, %r10
	andl	$2636928640, %r10d
	xorq	%r10, %rax
	movq	%rax, %r10
	salq	$15, %r10
	andl	$4022730752, %r10d
	xorq	%r10, %rax
	movq	%rax, %r10
	shrq	$18, %r10
	xorq	%r10, %rax
	js	.L130
	vcvtsi2sdq	%rax, %xmm8, %xmm1
.L131:
	vmulsd	-8(%rsp), %xmm1, %xmm1
	flds	.LC9(%rip)
	fmull	-8(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm0
	fstpl	-8(%rsp)
	cmpl	$1, %r8d
	jne	.L135
	vdivsd	-8(%rsp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm7
	vmovsd	.LC4(%rip), %xmm1
	vblendvpd	%xmm7, %xmm1, %xmm0, %xmm0
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	.cfi_restore_state
	movl	$1, %r8d
	cmpq	$623, %rdx
	jbe	.L149
.L121:
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L123:
	vmovdqu	8(%rax), %xmm11
	vmovdqu	(%rax), %xmm1
	addq	$32, %rax
	vinserti128	$0x1, -16(%rax), %ymm1, %ymm1
	vinserti128	$0x1, -8(%rax), %ymm11, %ymm9
	vmovdqu	3144(%rax), %xmm12
	vpand	%ymm9, %ymm5, %ymm9
	vpand	%ymm1, %ymm6, %ymm1
	vpor	%ymm9, %ymm1, %ymm1
	vinserti128	$0x1, 3160(%rax), %ymm12, %ymm9
	vpsrlq	$1, %ymm1, %ymm10
	vpand	%ymm4, %ymm1, %ymm1
	vpcmpeqq	%ymm2, %ymm1, %ymm1
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm3, %ymm10, %ymm9
	vpblendvb	%ymm1, %ymm10, %ymm9, %ymm1
	vmovups	%xmm1, -32(%rax)
	vextracti128	$0x1, %ymm1, -16(%rax)
	cmpq	%rsi, %rax
	jne	.L123
	movq	1800(%rdi), %rax
	movq	1792(%rdi), %rdx
	movq	%rax, %r10
	andq	$-2147483648, %rdx
	andl	$2147483647, %r10d
	orq	%r10, %rdx
	movq	%rdx, %r10
	shrq	%r10
	xorq	4968(%rdi), %r10
	andl	$1, %edx
	je	.L124
	xorq	%r9, %r10
.L124:
	movq	1808(%rdi), %rdx
	movq	%r10, 1792(%rdi)
	andq	$-2147483648, %rax
	movq	%rdx, %r10
	andl	$2147483647, %r10d
	orq	%r10, %rax
	movq	%rax, %r10
	shrq	%r10
	xorq	4976(%rdi), %r10
	testb	$1, %al
	je	.L125
	xorq	%r9, %r10
.L125:
	movq	1816(%rdi), %rax
	andq	$-2147483648, %rdx
	movq	%r10, 1800(%rdi)
	andl	$2147483647, %eax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	xorq	4984(%rdi), %rdx
	testb	$1, %al
	jne	.L126
.L128:
	movq	%rdx, 1808(%rdi)
	leaq	1816(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L127:
	vmovdqu	8(%rax), %xmm13
	vmovdqu	(%rax), %xmm1
	addq	$32, %rax
	vinserti128	$0x1, -16(%rax), %ymm1, %ymm1
	vinserti128	$0x1, -8(%rax), %ymm13, %ymm9
	vmovdqu	-1848(%rax), %xmm14
	vpand	%ymm9, %ymm5, %ymm9
	vpand	%ymm1, %ymm6, %ymm1
	vpor	%ymm9, %ymm1, %ymm1
	vinserti128	$0x1, -1832(%rax), %ymm14, %ymm9
	vpsrlq	$1, %ymm1, %ymm10
	vpand	%ymm4, %ymm1, %ymm1
	vpcmpeqq	%ymm2, %ymm1, %ymm1
	vpxor	%ymm9, %ymm10, %ymm10
	vpxor	%ymm3, %ymm10, %ymm9
	vpblendvb	%ymm1, %ymm10, %ymm9, %ymm1
	vmovups	%xmm1, -32(%rax)
	vextracti128	$0x1, %ymm1, -16(%rax)
	cmpq	%rax, %rcx
	jne	.L127
	movq	4984(%rdi), %rax
	movq	(%rdi), %rdx
	andq	$-2147483648, %rax
	andl	$2147483647, %edx
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	xorq	3168(%rdi), %rdx
	testb	$1, %al
	je	.L129
	xorq	%r9, %rdx
.L129:
	movq	%rdx, 4984(%rdi)
	xorl	%eax, %eax
	movl	$1, %edx
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L130:
	movq	%rax, %r10
	andl	$1, %eax
	shrq	%r10
	orq	%rax, %r10
	vcvtsi2sdq	%r10, %xmm8, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L131
	.p2align 4,,10
	.p2align 3
.L126:
	xorq	%r9, %rdx
	jmp	.L128
	.cfi_endproc
.LFE9772:
	.size	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, .-_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC11:
	.string	"N = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC13:
	.string	"evaluate_gravity of elapsed time = %lfsec\n"
	.align 8
.LC14:
	.string	"evaluate_gravity_simd of elapsed time = %lfsec\n"
	.section	.rodata.str1.1
.LC15:
	.string	"correct"
.LC16:
	.string	"false"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB17:
	.section	.text.startup,"ax",@progbits
.LHOTB17:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9125:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA9125
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1192, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	$1, %ecx
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$5489, %eax
	leaq	-5056(%rbp), %rbx
	movq	$5489, -5056(%rbp)
	movq	%rax, %rdx
	.p2align 4,,10
	.p2align 3
.L151:
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	$1812433253, %rax, %rax
	leal	(%rax,%rcx), %edx
	movq	%rdx, (%rbx,%rcx,8)
	addq	$1, %rcx
	cmpq	$624, %rcx
	jne	.L151
	leaq	-237568(%rsp), %rax
	movq	$624, -64(%rbp)
	cmpq	%rax, %rsp
	je	.L153
.L245:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L245
.L153:
	subq	$2432, %rsp
	orq	$0, 2424(%rsp)
	movq	%rsp, -5312(%rbp)
	leaq	-77824(%rsp), %rax
.L155:
	cmpq	%rax, %rsp
	je	.L156
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L155
.L156:
	subq	$2176, %rsp
	orq	$0, 2168(%rsp)
	movq	%rsp, -5264(%rbp)
	leaq	-237568(%rsp), %rax
.L158:
	cmpq	%rax, %rsp
	je	.L159
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L158
.L159:
	subq	$2432, %rsp
	orq	$0, 2424(%rsp)
	movq	%rsp, -5320(%rbp)
	leaq	-77824(%rsp), %rax
.L161:
	cmpq	%rax, %rsp
	je	.L162
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L161
.L162:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %r13
	leaq	-77824(%rsp), %rax
	andq	$-32, %r13
.L164:
	cmpq	%rax, %rsp
	je	.L165
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L164
.L165:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %r15
	leaq	-77824(%rsp), %rax
	andq	$-32, %r15
	movq	%r15, -5272(%rbp)
.L167:
	cmpq	%rax, %rsp
	je	.L168
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L167
.L168:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %r12
	leaq	-77824(%rsp), %rax
	andq	$-32, %r12
	movq	%r12, -5280(%rbp)
.L170:
	cmpq	%rax, %rsp
	je	.L171
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L170
.L171:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5288(%rbp)
	leaq	-77824(%rsp), %rax
.L173:
	cmpq	%rax, %rsp
	je	.L174
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L173
.L174:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5296(%rbp)
	leaq	-77824(%rsp), %rax
.L176:
	cmpq	%rax, %rsp
	je	.L177
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L176
.L177:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5304(%rbp)
	leaq	-319488(%rsp), %rax
.L179:
	cmpq	%rax, %rsp
	je	.L180
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L179
.L180:
	subq	$544, %rsp
	orq	$0, 536(%rsp)
	xorl	%r15d, %r15d
	movq	-5312(%rbp), %r14
	movq	%r14, %r12
	movq	%r15, %r14
	leaq	31(%rsp), %r10
	andq	$-32, %r10
	movq	%r10, %r15
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%rbx, %rdi
	addq	$24, %r12
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	%rbx, %rdi
	vaddsd	%xmm6, %xmm0, %xmm3
	vmovsd	%xmm3, -5256(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	%rbx, %rdi
	vaddsd	%xmm7, %xmm0, %xmm2
	vmovsd	%xmm2, -5248(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	%rbx, %rdi
	vaddsd	%xmm6, %xmm0, %xmm1
	vmovsd	%xmm1, -5240(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	-5264(%rbp), %rax
	vmovsd	-5248(%rbp), %xmm2
	vaddsd	%xmm7, %xmm0, %xmm0
	vmovsd	-5256(%rbp), %xmm3
	vmovsd	-5240(%rbp), %xmm1
	vunpcklpd	%xmm2, %xmm3, %xmm4
	vmovsd	%xmm3, 0(%r13,%r14)
	vmovsd	%xmm0, (%rax,%r14)
	movq	-5272(%rbp), %rax
	vmovaps	%xmm4, (%r15,%r14,4)
	vmovsd	%xmm2, (%rax,%r14)
	movq	-5280(%rbp), %rax
	vmovsd	%xmm1, 16(%r15,%r14,4)
	vmovsd	%xmm1, (%rax,%r14)
	vmovsd	%xmm0, 24(%r15,%r14,4)
	addq	$8, %r14
	vmovups	%xmm4, -24(%r12)
	vmovsd	%xmm1, -8(%r12)
	cmpq	$80000, %r14
	jne	.L182
	call	clock@PLT
	movq	%r15, %r12
	movl	$10000, %esi
	movq	-5312(%rbp), %rcx
	movq	-5320(%rbp), %r14
	movq	-5264(%rbp), %r15
	movl	$10000, %edi
	movq	%rax, -5240(%rbp)
	movq	%rcx, %rdx
	movq	%r14, %r9
	movq	%r15, %r8
	call	_Z16evaluate_gravityiiPA3_dS0_PdS0_
	call	clock@PLT
	movl	$10000, %edx
	movl	$1, %edi
	leaq	.LC11(%rip), %rsi
	movq	%rax, %rbx
	xorl	%eax, %eax
.LEHB4:
	call	__printf_chk@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$1, %edi
	subq	-5240(%rbp), %rbx
	leaq	.LC13(%rip), %rsi
	movl	$1, %eax
	vcvtsi2sdq	%rbx, %xmm4, %xmm0
	vdivsd	.LC12(%rip), %xmm0, %xmm0
	call	__printf_chk@PLT
	call	clock@PLT
	subq	$8, %rsp
	movq	%r13, %r9
	movq	%r13, %rdx
	movq	-5280(%rbp), %r8
	movq	-5272(%rbp), %rcx
	pushq	-5304(%rbp)
	movq	%rax, %rbx
	pushq	-5296(%rbp)
	movl	$10000, %esi
	movl	$10000, %edi
	leaq	-5216(%rbp), %r13
	pushq	-5288(%rbp)
	pushq	%r15
	leaq	-5104(%rbp), %r15
	pushq	%r12
	movq	%r14, %r12
	leaq	-5152(%rbp), %r14
	pushq	%r8
	pushq	%rcx
	call	_Z21evaluate_gravity_simdiiPdS_S_S_S_S_PA4_dS_S_S_S_
	addq	$64, %rsp
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$1, %edi
	leaq	.LC14(%rip), %rsi
	subq	%rbx, %rax
	xorl	%ebx, %ebx
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	movl	$1, %eax
	vdivsd	.LC12(%rip), %xmm0, %xmm0
	call	__printf_chk@PLT
.LEHE4:
	leaq	-5144(%rbp), %rax
	movl	$0, -5144(%rbp)
	movq	%rax, -5248(%rbp)
	movq	%rax, -5128(%rbp)
	movq	%rax, -5120(%rbp)
	leaq	-5096(%rbp), %rax
	movq	$0, -5136(%rbp)
	movq	$0, -5112(%rbp)
	movl	$0, -5096(%rbp)
	movq	$0, -5088(%rbp)
	movq	%rax, -5080(%rbp)
	movq	%rax, -5072(%rbp)
	movq	$0, -5064(%rbp)
	.p2align 4,,10
	.p2align 3
.L199:
	vpxor	%xmm5, %xmm5, %xmm5
	movq	%r12, %rdx
	xorl	%esi, %esi
	movq	%r13, %rdi
	movq	$0, -5200(%rbp)
	movq	$0, -5168(%rbp)
	vmovaps	%xmm5, -5216(%rbp)
	vmovaps	%xmm5, -5184(%rbp)
.LEHB5:
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5208(%rbp), %rsi
	movq	-5200(%rbp), %r8
	cmpq	%r8, %rsi
	je	.L183
	vmovsd	8(%r12), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5208(%rbp)
.L184:
	cmpq	%rsi, %r8
	je	.L185
	vmovsd	16(%r12), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5208(%rbp)
.L186:
	movq	-5176(%rbp), %rsi
	movq	-5168(%rbp), %r8
	movq	-5288(%rbp), %rax
	cmpq	%r8, %rsi
	je	.L187
	vmovsd	(%rax,%rbx,8), %xmm0
	addq	$8, %rsi
	movq	-5296(%rbp), %rax
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5176(%rbp)
	cmpq	%r8, %rsi
	je	.L189
.L248:
	vmovsd	(%rax,%rbx,8), %xmm0
	addq	$8, %rsi
	movq	-5304(%rbp), %rax
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5176(%rbp)
	cmpq	%rsi, %r8
	je	.L191
.L249:
	vmovsd	(%rax,%rbx,8), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5176(%rbp)
.L192:
	movq	%r13, %rsi
	movq	%r14, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_
	movq	%rax, %rsi
	testq	%rdx, %rdx
	je	.L193
	leaq	-5224(%rbp), %r8
	movq	%r13, %rcx
	movq	%r14, %rdi
	movq	%r14, -5224(%rbp)
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_
.L193:
	leaq	-5184(%rbp), %rcx
	movq	%r15, %rdi
	movq	%rcx, %rsi
	movq	%rcx, -5240(%rbp)
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE24_M_get_insert_unique_posERKS2_
	movq	%rax, %rsi
	testq	%rdx, %rdx
	je	.L194
	movq	-5240(%rbp), %rcx
	leaq	-5224(%rbp), %r8
	movq	%r15, %rdi
	movq	%r15, -5224(%rbp)
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE10_M_insert_IRKS2_NS8_11_Alloc_nodeEEESt17_Rb_tree_iteratorIS2_EPSt18_Rb_tree_node_baseSG_OT_RT0_
.LEHE5:
.L194:
	movq	-5184(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L195
	call	_ZdlPv@PLT
.L195:
	movq	-5216(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L196
	call	_ZdlPv@PLT
	addq	$1, %rbx
	addq	$24, %r12
	cmpq	$10000, %rbx
	jne	.L199
.L197:
	movq	-5128(%rbp), %rdi
	cmpq	-5248(%rbp), %rdi
	je	.L200
.L210:
	movq	32(%rdi), %rax
	movq	40(%rdi), %rdx
	cmpq	%rdx, %rax
	jne	.L203
	jmp	.L201
	.p2align 4,,10
	.p2align 3
.L246:
	addq	$8, %rax
	cmpq	%rax, %rdx
	je	.L201
.L203:
	vmovsd	(%rax), %xmm0
	vucomisd	%xmm0, %xmm0
	jp	.L202
	je	.L246
.L202:
	movl	$5, %edx
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB6:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L241:
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.LEHE6:
	movq	-5088(%rbp), %rsi
	movq	%r15, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	movq	-5136(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L247
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
	.p2align 4,,10
	.p2align 3
.L196:
	.cfi_restore_state
	addq	$1, %rbx
	addq	$24, %r12
	cmpq	$10000, %rbx
	jne	.L199
	jmp	.L197
	.p2align 4,,10
	.p2align 3
.L187:
	leaq	(%rax,%rbx,8), %rdx
	leaq	-5184(%rbp), %rdi
.LEHB7:
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5176(%rbp), %rsi
	movq	-5168(%rbp), %r8
	movq	-5296(%rbp), %rax
	cmpq	%r8, %rsi
	jne	.L248
	.p2align 4,,10
	.p2align 3
.L189:
	leaq	(%rax,%rbx,8), %rdx
	leaq	-5184(%rbp), %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5176(%rbp), %rsi
	movq	-5168(%rbp), %r8
	movq	-5304(%rbp), %rax
	cmpq	%rsi, %r8
	jne	.L249
	.p2align 4,,10
	.p2align 3
.L191:
	leaq	(%rax,%rbx,8), %rdx
	leaq	-5184(%rbp), %rdi
	movq	%r8, %rsi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L185:
	leaq	16(%r12), %rdx
	movq	%r8, %rsi
	movq	%r13, %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	jmp	.L186
	.p2align 4,,10
	.p2align 3
.L183:
	leaq	8(%r12), %rdx
	movq	%r13, %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
.LEHE7:
	movq	-5208(%rbp), %rsi
	movq	-5200(%rbp), %r8
	jmp	.L184
.L201:
	call	_ZSt18_Rb_tree_incrementPKSt18_Rb_tree_node_base@PLT
	movq	%rax, %rdi
	cmpq	-5248(%rbp), %rax
	jne	.L210
.L200:
	movl	$7, %edx
	leaq	.LC15(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB8:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE8:
	jmp	.L241
.L247:
	call	__stack_chk_fail@PLT
.L213:
	endbr64
	movq	%rax, %r12
	jmp	.L205
.L214:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L208
	.section	.gcc_except_table,"a",@progbits
.LLSDA9125:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9125-.LLSDACSB9125
.LLSDACSB9125:
	.uleb128 .LEHB4-.LFB9125
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB5-.LFB9125
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L213-.LFB9125
	.uleb128 0
	.uleb128 .LEHB6-.LFB9125
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L214-.LFB9125
	.uleb128 0
	.uleb128 .LEHB7-.LFB9125
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L213-.LFB9125
	.uleb128 0
	.uleb128 .LEHB8-.LFB9125
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L214-.LFB9125
	.uleb128 0
.LLSDACSE9125:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC9125
	.type	main.cold, @function
main.cold:
.LFSB9125:
.L205:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	movq	-5184(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L242
	vzeroupper
	call	_ZdlPv@PLT
.L206:
	movq	-5216(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L208
	call	_ZdlPv@PLT
.L208:
	movq	-5088(%rbp), %rsi
	movq	%r15, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	movq	-5136(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZNSt8_Rb_treeISt6vectorIdSaIdEES2_St9_IdentityIS2_ESt4lessIS2_ESaIS2_EE8_M_eraseEPSt13_Rb_tree_nodeIS2_E
	movq	%r12, %rdi
.LEHB9:
	call	_Unwind_Resume@PLT
.LEHE9:
.L242:
	vzeroupper
	jmp	.L206
	.cfi_endproc
.LFE9125:
	.section	.gcc_except_table
.LLSDAC9125:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC9125-.LLSDACSBC9125
.LLSDACSBC9125:
	.uleb128 .LEHB9-.LCOLDB17
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
.LLSDACSEC9125:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE17:
	.section	.text.startup
.LHOTE17:
	.p2align 4
	.type	_GLOBAL__sub_I__Z16evaluate_gravityiiPA3_dS0_PdS0_, @function
_GLOBAL__sub_I__Z16evaluate_gravityiiPA3_dS0_PdS0_:
.LFB9972:
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
.LFE9972:
	.size	_GLOBAL__sub_I__Z16evaluate_gravityiiPA3_dS0_PdS0_, .-_GLOBAL__sub_I__Z16evaluate_gravityiiPA3_dS0_PdS0_
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z16evaluate_gravityiiPA3_dS0_PdS0_
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC2:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.section	.rodata.cst8
	.align 8
.LC4:
	.long	4294967295
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC5:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC6:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC7:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC8:
	.quad	2567483615
	.quad	2567483615
	.quad	2567483615
	.quad	2567483615
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC9:
	.long	1333788672
	.section	.rodata.cst8
	.align 8
.LC12:
	.long	0
	.long	1093567616
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.rel.local.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align 8
	.type	DW.ref.__gxx_personality_v0, @object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.quad	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
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
