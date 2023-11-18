	.file	"new_interparticle.cpp"
	.text
	.p2align 4
	.globl	_Z16evaluate_gravityiiPiPA3_dS1_PdS1_
	.type	_Z16evaluate_gravityiiPiPA3_dS1_PdS1_, @function
_Z16evaluate_gravityiiPiPA3_dS1_PdS1_:
.LFB9123:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L13
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	vxorpd	%xmm7, %xmm7, %xmm7
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	xorl	%r12d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$112, %rsp
	.cfi_def_cfa_offset 160
	vmovsd	.LC1(%rip), %xmm11
	movq	160(%rsp), %r14
	.p2align 4,,10
	.p2align 3
.L7:
	vmovsd	(%rcx), %xmm8
	vmovsd	8(%rcx), %xmm9
	vmovsd	16(%rcx), %xmm10
	testl	%esi, %esi
	jle	.L8
	movq	%r8, %rbp
	leal	-1(%rsi), %r13d
	vmovapd	%xmm7, %xmm5
	xorl	%ebx, %ebx
	vmovapd	%xmm7, %xmm6
	vmovapd	%xmm7, %xmm4
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L9:
	movq	%rax, %rbx
.L6:
	cmpl	%ebx, %r12d
	je	.L4
	vmovsd	0(%rbp), %xmm3
	vmovsd	8(%rbp), %xmm2
	vmovsd	16(%rbp), %xmm1
	vsubsd	%xmm8, %xmm3, %xmm3
	vsubsd	%xmm9, %xmm2, %xmm2
	vsubsd	%xmm10, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm2, %xmm12
	vmulsd	%xmm3, %xmm3, %xmm0
	vaddsd	%xmm12, %xmm0, %xmm0
	vmulsd	%xmm1, %xmm1, %xmm12
	vaddsd	%xmm12, %xmm0, %xmm0
	vucomisd	%xmm0, %xmm7
	vsqrtsd	%xmm0, %xmm0, %xmm12
	ja	.L17
.L5:
	vdivsd	%xmm12, %xmm11, %xmm12
	vmulsd	(%r9,%rbx,8), %xmm12, %xmm0
	vmulsd	%xmm12, %xmm0, %xmm0
	vmulsd	%xmm12, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm3, %xmm3
	vmulsd	%xmm0, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm1, %xmm1
	vaddsd	%xmm3, %xmm4, %xmm4
	vaddsd	%xmm2, %xmm6, %xmm6
	vaddsd	%xmm1, %xmm5, %xmm5
.L4:
	leaq	1(%rbx), %rax
	addq	$24, %rbp
	cmpq	%r13, %rbx
	jne	.L9
.L3:
	vunpcklpd	%xmm6, %xmm4, %xmm4
	addl	$1, %r12d
	addq	$24, %rcx
	addq	$24, %r14
	vmovups	%xmm4, -24(%r14)
	vmovsd	%xmm5, -8(%r14)
	cmpl	%r12d, %edi
	jne	.L7
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	.cfi_restore_state
	vmovapd	%xmm7, %xmm5
	vmovapd	%xmm7, %xmm6
	vmovapd	%xmm7, %xmm4
	jmp	.L3
.L13:
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	ret
.L17:
	.cfi_def_cfa_offset 160
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	movq	%r9, 104(%rsp)
	movq	%r8, 96(%rsp)
	movl	%esi, 92(%rsp)
	movl	%edi, 88(%rsp)
	movq	%rcx, 80(%rsp)
	vmovsd	%xmm1, 72(%rsp)
	vmovsd	%xmm2, 64(%rsp)
	vmovsd	%xmm3, 56(%rsp)
	vmovsd	%xmm10, 48(%rsp)
	vmovsd	%xmm9, 40(%rsp)
	vmovsd	%xmm8, 32(%rsp)
	vmovsd	%xmm5, 24(%rsp)
	vmovsd	%xmm6, 16(%rsp)
	vmovsd	%xmm4, 8(%rsp)
	vmovsd	%xmm12, (%rsp)
	call	sqrt@PLT
	movq	.LC1(%rip), %rax
	movq	104(%rsp), %r9
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	96(%rsp), %r8
	movl	92(%rsp), %esi
	movl	88(%rsp), %edi
	movq	80(%rsp), %rcx
	vmovq	%rax, %xmm11
	vmovsd	72(%rsp), %xmm1
	vmovsd	64(%rsp), %xmm2
	vmovsd	56(%rsp), %xmm3
	vmovsd	48(%rsp), %xmm10
	vmovsd	40(%rsp), %xmm9
	vmovsd	32(%rsp), %xmm8
	vmovsd	24(%rsp), %xmm5
	vmovsd	16(%rsp), %xmm6
	vmovsd	8(%rsp), %xmm4
	vmovsd	(%rsp), %xmm12
	jmp	.L5
	.cfi_endproc
.LFE9123:
	.size	_Z16evaluate_gravityiiPiPA3_dS1_PdS1_, .-_Z16evaluate_gravityiiPiPA3_dS1_PdS1_
	.p2align 4
	.globl	_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_
	.type	_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_, @function
_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_:
.LFB9124:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %eax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$96, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	56(%rbp), %r13
	movq	64(%rbp), %r14
	movl	%edi, 28(%rsp)
	movq	40(%rbp), %rdi
	movq	%rcx, 16(%rsp)
	movq	72(%rbp), %r15
	movq	%rdi, 8(%rsp)
	movq	%fs:40, %rdi
	movq	%rdi, 88(%rsp)
	xorl	%edi, %edi
	testl	%eax, %eax
	jle	.L18
	vmovapd	.LC2(%rip), %ymm10
	movq	%r8, %rbx
	movq	%r9, %r12
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L19:
	movq	16(%rsp), %rax
	vmovapd	(%rbx,%rdi,8), %ymm8
	vmovapd	(%r12,%rdi,8), %ymm9
	vmovapd	(%rax,%rdi,8), %ymm7
	testl	%esi, %esi
	jle	.L27
	vxorpd	%xmm4, %xmm4, %xmm4
	movq	8(%rsp), %rdx
	xorl	%eax, %eax
	leal	1(%rdi), %r8d
	vmovapd	%ymm4, %ymm5
	vmovapd	%ymm4, %ymm6
	leal	2(%rdi), %r9d
	leal	3(%rdi), %r11d
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L32:
	cmpl	%eax, %r9d
	je	.L21
	cmpl	%eax, %r11d
	je	.L21
.L22:
	vmulpd	%ymm0, %ymm3, %ymm3
	addl	$1, %eax
	addq	$32, %rdx
	vmulpd	%ymm0, %ymm2, %ymm2
	vmulpd	%ymm0, %ymm1, %ymm0
	vaddpd	%ymm3, %ymm6, %ymm6
	vaddpd	%ymm2, %ymm5, %ymm5
	vaddpd	%ymm0, %ymm4, %ymm4
	cmpl	%eax, %esi
	je	.L20
.L23:
	vbroadcastsd	(%rdx), %ymm3
	vbroadcastsd	8(%rdx), %ymm2
	vbroadcastsd	16(%rdx), %ymm1
	vsubpd	%ymm7, %ymm3, %ymm3
	vsubpd	%ymm8, %ymm2, %ymm2
	vsubpd	%ymm9, %ymm1, %ymm1
	vmulpd	%ymm3, %ymm3, %ymm11
	vmulpd	%ymm2, %ymm2, %ymm0
	vaddpd	%ymm11, %ymm0, %ymm0
	vmulpd	%ymm1, %ymm1, %ymm11
	vaddpd	%ymm11, %ymm0, %ymm0
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm11
	vmulpd	%ymm0, %ymm11, %ymm0
	vbroadcastsd	24(%rdx), %ymm11
	vmulpd	%ymm11, %ymm0, %ymm0
	vmovapd	%ymm0, 32(%rsp)
	cmpl	%edi, %eax
	je	.L21
	cmpl	%eax, %r8d
	jne	.L32
.L21:
	leal	(%rax,%r10), %ecx
	movslq	%ecx, %rcx
	movq	$0x000000000, 32(%rsp,%rcx,8)
	vmovapd	32(%rsp), %ymm0
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L27:
	vxorpd	%xmm4, %xmm4, %xmm4
	vmovapd	%ymm4, %ymm5
	vmovapd	%ymm4, %ymm6
	.p2align 4,,10
	.p2align 3
.L20:
	vmovapd	%ymm6, 0(%r13,%rdi,8)
	subl	$4, %r10d
	vmovapd	%ymm5, (%r14,%rdi,8)
	vmovapd	%ymm4, (%r15,%rdi,8)
	addq	$4, %rdi
	cmpl	%edi, 28(%rsp)
	jg	.L19
	vzeroupper
.L18:
	movq	88(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L33
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L33:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE9124:
	.size	_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_, .-_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"{id=%d, x=%lf, y=%lf, z=%lf}"
	.text
	.p2align 4
	.globl	_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE
	.type	_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE, @function
_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE:
.LFB9125:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movq	%rdx, %r15
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
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	testl	%esi, %esi
	jle	.L35
	movq	%rdi, %r12
	leal	-1(%rsi), %r14d
	leaq	.LC3(%rip), %r13
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L36:
	movq	(%r12), %rdx
	leaq	(%rbx,%rbx,2), %rax
	movl	%ebx, %ecx
	movq	%rbx, %rbp
	movl	$1, %esi
	movq	%r15, %rdi
	addq	$1, %rbx
	leaq	(%rdx,%rax,8), %rax
	movq	%r13, %rdx
	movq	(%rax), %rax
	vmovsd	16(%rax), %xmm2
	vmovsd	8(%rax), %xmm1
	vmovsd	(%rax), %xmm0
	movl	$3, %eax
	call	__fprintf_chk@PLT
	cmpq	%rbp, %r14
	jne	.L36
.L35:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	movq	%r15, %rsi
	movl	$10, %edi
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
	jmp	fputc@PLT
	.cfi_endproc
.LFE9125:
	.size	_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE, .-_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE
	.p2align 4
	.globl	_Z15check_particlesPdS_S_PA3_di
	.type	_Z15check_particlesPdS_S_PA3_di, @function
_Z15check_particlesPdS_S_PA3_di:
.LFB9126:
	.cfi_startproc
	endbr64
	testl	%r8d, %r8d
	jle	.L43
	leal	-1(%r8), %r10d
	xorl	%eax, %eax
	movl	$1, %r9d
	xorl	%r11d, %r11d
	vmovq	.LC4(%rip), %xmm3
	vmovsd	.LC5(%rip), %xmm2
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L48:
	vmovsd	(%rsi,%rax,8), %xmm0
	vsubsd	8(%rcx), %xmm0, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vcomisd	%xmm2, %xmm0
	ja	.L45
	vmovsd	(%rdx,%rax,8), %xmm0
	vsubsd	16(%rcx), %xmm0, %xmm0
	leaq	1(%rax), %r8
	vandpd	%xmm3, %xmm0, %xmm0
	vucomisd	%xmm2, %xmm0
	cmova	%r11d, %r9d
	addq	$24, %rcx
	cmpq	%r10, %rax
	je	.L39
.L47:
	movq	%r8, %rax
.L42:
	vmovsd	(%rcx), %xmm1
	vmovsd	(%rdi,%rax,8), %xmm0
	vsubsd	%xmm1, %xmm0, %xmm0
	vandpd	%xmm3, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm0, %xmm0
	vcomisd	%xmm2, %xmm0
	jbe	.L48
.L45:
	xorl	%r9d, %r9d
	leaq	1(%rax), %r8
	addq	$24, %rcx
	cmpq	%r10, %rax
	jne	.L47
.L39:
	movl	%r9d, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L43:
	movl	$1, %r9d
	movl	%r9d, %eax
	ret
	.cfi_endproc
.LFE9126:
	.size	_Z15check_particlesPdS_S_PA3_di, .-_Z15check_particlesPdS_S_PA3_di
	.section	.text._ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev,"axG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EED5Ev,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev
	.type	_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev, @function
_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev:
.LFB9416:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	8(%rdi), %rbx
	movq	(%rdi), %rbp
	cmpq	%rbp, %rbx
	je	.L50
	.p2align 4,,10
	.p2align 3
.L54:
	movq	0(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L51
	call	_ZdlPv@PLT
	addq	$24, %rbp
	cmpq	%rbp, %rbx
	jne	.L54
.L52:
	movq	(%r12), %rbp
.L50:
	testq	%rbp, %rbp
	je	.L56
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movq	%rbp, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv@PLT
	.p2align 4,,10
	.p2align 3
.L51:
	.cfi_restore_state
	addq	$24, %rbp
	cmpq	%rbp, %rbx
	jne	.L54
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L56:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE9416:
	.size	_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev, .-_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev
	.weak	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	.set	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev,_ZNSt6vectorIS_IdSaIdEESaIS1_EED2Ev
	.section	.text._ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_,"axG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EEC5ERKS3_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_
	.type	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_, @function
_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_:
.LFB9434:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA9434
	endbr64
	movabsq	$-6148914691236517205, %rdx
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	vpxor	%xmm0, %xmm0, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%r14d, %r14d
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
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rsi), %rbx
	subq	(%rsi), %rbx
	vmovups	%xmm0, (%rdi)
	movq	%rbx, %rax
	movq	$0, 16(%rdi)
	sarq	$3, %rax
	imulq	%rdx, %rax
	testq	%rax, %rax
	je	.L60
	movabsq	$384307168202282325, %rdx
	cmpq	%rdx, %rax
	ja	.L89
	movq	%rbx, %rdi
.LEHB0:
	call	_Znwm@PLT
.LEHE0:
	movq	%rax, %r14
.L60:
	vmovq	%r14, %xmm2
	addq	%r14, %rbx
	vpunpcklqdq	%xmm2, %xmm2, %xmm0
	movq	%rbx, 16(%r13)
	vmovups	%xmm0, 0(%r13)
	movq	8(%rbp), %r15
	movq	0(%rbp), %rbx
	movq	%r14, %rbp
	cmpq	%rbx, %r15
	jne	.L69
	jmp	.L62
	.p2align 4,,10
	.p2align 3
.L63:
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	ja	.L90
	movq	%r12, %rdi
.LEHB1:
	call	_Znwm@PLT
	movq	%rax, %rcx
.L64:
	vmovq	%rcx, %xmm1
	addq	%rcx, %r12
	vpunpcklqdq	%xmm1, %xmm1, %xmm0
	movq	%r12, 16(%rbp)
	vmovups	%xmm0, 0(%rbp)
	movq	8(%rbx), %rax
	movq	(%rbx), %rsi
	movq	%rax, %r12
	subq	%rsi, %r12
	cmpq	%rsi, %rax
	je	.L88
	movq	%rcx, %rdi
	movq	%r12, %rdx
	call	memmove@PLT
	movq	%rax, %rcx
.L88:
	addq	%r12, %rcx
	addq	$24, %rbx
	addq	$24, %rbp
	movq	%rcx, -16(%rbp)
	cmpq	%rbx, %r15
	je	.L62
.L69:
	movq	8(%rbx), %r12
	subq	(%rbx), %r12
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%rbp)
	movq	%r12, %rax
	vmovups	%xmm0, 0(%rbp)
	sarq	$3, %rax
	jne	.L63
	xorl	%ecx, %ecx
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L62:
	movq	%rbp, 8(%r13)
	addq	$8, %rsp
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
.L90:
	.cfi_restore_state
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE1:
.L89:
.LEHB2:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE2:
.L78:
	endbr64
	movq	%rax, %rdi
.L70:
	vzeroupper
	call	__cxa_begin_catch@PLT
.L73:
	cmpq	%r14, %rbp
	jne	.L91
.LEHB3:
	call	__cxa_rethrow@PLT
.LEHE3:
.L91:
	movq	(%r14), %rdi
	testq	%rdi, %rdi
	je	.L72
	call	_ZdlPv@PLT
.L72:
	addq	$24, %r14
	jmp	.L73
.L77:
	endbr64
	movq	%rax, %rbp
.L74:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	0(%r13), %rdi
	testq	%rdi, %rdi
	je	.L75
	call	_ZdlPv@PLT
.L75:
	movq	%rbp, %rdi
.LEHB4:
	call	_Unwind_Resume@PLT
.LEHE4:
	.cfi_endproc
.LFE9434:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table._ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_,"aG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EEC5ERKS3_,comdat
	.align 4
.LLSDA9434:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT9434-.LLSDATTD9434
.LLSDATTD9434:
	.byte	0x1
	.uleb128 .LLSDACSE9434-.LLSDACSB9434
.LLSDACSB9434:
	.uleb128 .LEHB0-.LFB9434
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB9434
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L78-.LFB9434
	.uleb128 0x1
	.uleb128 .LEHB2-.LFB9434
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB3-.LFB9434
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L77-.LFB9434
	.uleb128 0
	.uleb128 .LEHB4-.LFB9434
	.uleb128 .LEHE4-.LEHB4
	.uleb128 0
	.uleb128 0
.LLSDACSE9434:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT9434:
	.section	.text._ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_,"axG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EEC5ERKS3_,comdat
	.size	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_, .-_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_
	.weak	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC1ERKS3_
	.set	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC1ERKS3_,_ZNSt6vectorIS_IdSaIdEESaIS1_EEC2ERKS3_
	.section	.rodata._ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_.str1.1,"aMS",@progbits,1
.LC6:
	.string	"vector::_M_realloc_insert"
	.section	.text._ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.type	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, @function
_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_:
.LFB9593:
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
	je	.L107
	movq	%rdx, %r15
	movq	%rsi, %rdx
	movq	%rdi, %rbx
	movq	%rsi, %r13
	subq	%r8, %rdx
	testq	%rax, %rax
	je	.L102
	movabsq	$9223372036854775800, %r14
	leaq	(%rax,%rax), %rsi
	cmpq	%rsi, %rax
	jbe	.L108
.L94:
	movq	%r14, %rdi
	movq	%rdx, 8(%rsp)
	movq	%r8, (%rsp)
	call	_Znwm@PLT
	movq	(%rsp), %r8
	movq	8(%rsp), %rdx
	movq	%rax, %rbp
	addq	%rax, %r14
.L101:
	vmovsd	(%r15), %xmm0
	leaq	8(%rbp,%rdx), %r9
	subq	%r13, %r12
	leaq	(%r9,%r12), %r15
	vmovsd	%xmm0, 0(%rbp,%rdx)
	testq	%rdx, %rdx
	jg	.L109
	testq	%r12, %r12
	jg	.L97
	testq	%r8, %r8
	jne	.L100
.L98:
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
.L109:
	.cfi_restore_state
	movq	%r8, %rsi
	movq	%rbp, %rdi
	movq	%r9, 8(%rsp)
	movq	%r8, (%rsp)
	call	memmove@PLT
	testq	%r12, %r12
	movq	(%rsp), %r8
	movq	8(%rsp), %r9
	jg	.L97
.L100:
	movq	%r8, %rdi
	call	_ZdlPv@PLT
	jmp	.L98
	.p2align 4,,10
	.p2align 3
.L108:
	testq	%rsi, %rsi
	jne	.L95
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	jmp	.L101
	.p2align 4,,10
	.p2align 3
.L97:
	movq	%r12, %rdx
	movq	%r13, %rsi
	movq	%r9, %rdi
	movq	%r8, (%rsp)
	call	memcpy@PLT
	movq	(%rsp), %r8
	testq	%r8, %r8
	je	.L98
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L102:
	movl	$8, %r14d
	jmp	.L94
.L107:
	leaq	.LC6(%rip), %rdi
	call	_ZSt20__throw_length_errorPKc@PLT
.L95:
	cmpq	%rcx, %rsi
	cmovbe	%rsi, %rcx
	movq	%rcx, %r14
	salq	$3, %r14
	jmp	.L94
	.cfi_endproc
.LFE9593:
	.size	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_, .-_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	.section	.text._ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 2
	.p2align 4
	.weak	_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, @function
_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB9599:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA9599
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
	andq	$-32, %rsp
	subq	$64, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	8(%rdi), %rax
	movq	(%rdi), %r14
	movq	%rdx, 40(%rsp)
	movabsq	$-6148914691236517205, %rdx
	movq	%rax, 32(%rsp)
	subq	%r14, %rax
	sarq	$3, %rax
	movq	%rdi, 24(%rsp)
	imulq	%rdx, %rax
	movabsq	$384307168202282325, %rdx
	cmpq	%rdx, %rax
	je	.L160
	movq	%rsi, %r15
	movq	%rsi, %rbx
	movq	%rsi, %r13
	subq	%r14, %r15
	testq	%rax, %rax
	je	.L134
	leaq	(%rax,%rax), %rdi
	movq	%rdi, 56(%rsp)
	cmpq	%rdi, %rax
	jbe	.L161
	movabsq	$9223372036854775800, %rax
	movq	%rax, 56(%rsp)
.L112:
	movq	56(%rsp), %rdi
.LEHB5:
	call	_Znwm@PLT
.LEHE5:
	movq	%rax, %r12
.L133:
	movq	40(%rsp), %rax
	addq	%r12, %r15
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%r15)
	movq	8(%rax), %rdx
	movq	(%rax), %rsi
	vmovups	%xmm0, (%r15)
	movq	%rdx, %rax
	subq	%rsi, %rax
	movq	%rax, 48(%rsp)
	sarq	$3, %rax
	je	.L162
	movabsq	$1152921504606846975, %rdx
	cmpq	%rdx, %rax
	ja	.L163
	movq	48(%rsp), %rdi
.LEHB6:
	call	_Znwm@PLT
.LEHE6:
	movq	%rax, %rcx
	movq	40(%rsp), %rax
	movq	8(%rax), %rdx
	movq	(%rax), %rsi
	movq	%rdx, %r8
	subq	%rsi, %r8
.L115:
	movq	48(%rsp), %rax
	vmovq	%rcx, %xmm3
	vpunpcklqdq	%xmm3, %xmm3, %xmm0
	addq	%rcx, %rax
	vmovups	%xmm0, (%r15)
	movq	%rax, 16(%r15)
	cmpq	%rdx, %rsi
	je	.L117
	movq	%r8, %rdx
	movq	%rcx, %rdi
	movq	%r8, 48(%rsp)
	call	memmove@PLT
	movq	48(%rsp), %r8
	movq	%rax, %rcx
.L117:
	addq	%r8, %rcx
	movq	%rcx, 8(%r15)
	cmpq	%r14, %rbx
	je	.L136
	leaq	-24(%rbx), %rcx
	movq	%r14, %rax
	movabsq	$768614336404564651, %rdx
	subq	%r14, %rcx
	shrq	$3, %rcx
	imulq	%rdx, %rcx
	movabsq	$2305843009213693951, %rdx
	andq	%rdx, %rcx
	leaq	95(%r12), %rdx
	subq	%r14, %rdx
	cmpq	$190, %rdx
	jbe	.L137
	cmpq	$2, %rcx
	jbe	.L137
	addq	$1, %rcx
	movq	%r12, %rdx
	movq	%rcx, %rsi
	shrq	$2, %rsi
	leaq	(%rsi,%rsi,2), %rsi
	salq	$5, %rsi
	addq	%r14, %rsi
	.p2align 4,,10
	.p2align 3
.L120:
	vmovdqu	(%rax), %xmm6
	vmovdqu	32(%rax), %xmm7
	addq	$96, %rax
	addq	$96, %rdx
	vinserti128	$0x1, -80(%rax), %ymm6, %ymm2
	vinserti128	$0x1, -48(%rax), %ymm7, %ymm1
	vmovdqu	-32(%rax), %xmm6
	vinserti128	$0x1, -16(%rax), %ymm6, %ymm0
	vmovups	%xmm2, -96(%rdx)
	vextracti128	$0x1, %ymm2, -80(%rdx)
	vextracti128	$0x1, %ymm1, -48(%rdx)
	vmovups	%xmm1, -64(%rdx)
	vextracti128	$0x1, %ymm0, -16(%rdx)
	vmovups	%xmm0, -32(%rdx)
	cmpq	%rsi, %rax
	jne	.L120
	movq	%rcx, %rsi
	andq	$-4, %rsi
	leaq	(%rsi,%rsi,2), %rax
	salq	$3, %rax
	leaq	(%r14,%rax), %rdx
	addq	%r12, %rax
	cmpq	%rsi, %rcx
	je	.L122
	movq	16(%rdx), %rsi
	vmovdqu	(%rdx), %xmm4
	movq	%rsi, 16(%rax)
	leaq	24(%rdx), %rsi
	vmovups	%xmm4, (%rax)
	cmpq	%rsi, %rbx
	je	.L122
	movq	40(%rdx), %rsi
	vmovdqu	24(%rdx), %xmm7
	movq	%rsi, 40(%rax)
	leaq	48(%rdx), %rsi
	vmovups	%xmm7, 24(%rax)
	cmpq	%rsi, %rbx
	je	.L122
	vmovdqu	48(%rdx), %xmm5
	movq	64(%rdx), %rdx
	movq	%rdx, 64(%rax)
	vmovups	%xmm5, 48(%rax)
.L122:
	leaq	(%rcx,%rcx,2), %rax
	leaq	(%r12,%rax,8), %r15
.L118:
	movq	32(%rsp), %rdi
	addq	$24, %r15
	cmpq	%rdi, %rbx
	je	.L123
	movabsq	$768614336404564651, %rcx
	subq	%rbx, %rdi
	movq	%rbx, %rax
	movq	%rdi, %rdx
	subq	$24, %rdx
	shrq	$3, %rdx
	imulq	%rcx, %rdx
	movabsq	$2305843009213693951, %rcx
	andq	%rcx, %rdx
	leaq	1(%rdx), %rsi
	cmpq	$2, %rdx
	jbe	.L138
	movq	%rsi, %rcx
	movq	%r15, %rdx
	shrq	$2, %rcx
	leaq	(%rcx,%rcx,2), %rcx
	salq	$5, %rcx
	addq	%rbx, %rcx
	.p2align 4,,10
	.p2align 3
.L125:
	vmovdqu	32(%rax), %xmm3
	vmovdqu	(%rax), %xmm5
	addq	$96, %rax
	addq	$96, %rdx
	vinserti128	$0x1, -48(%rax), %ymm3, %ymm1
	vinserti128	$0x1, -80(%rax), %ymm5, %ymm2
	vmovdqu	-32(%rax), %xmm4
	vinserti128	$0x1, -16(%rax), %ymm4, %ymm0
	vmovups	%xmm2, -96(%rdx)
	vextracti128	$0x1, %ymm2, -80(%rdx)
	vextracti128	$0x1, %ymm1, -48(%rdx)
	vmovups	%xmm1, -64(%rdx)
	vextracti128	$0x1, %ymm0, -16(%rdx)
	vmovups	%xmm0, -32(%rdx)
	cmpq	%rcx, %rax
	jne	.L125
	movq	%rsi, %rdx
	andq	$-4, %rdx
	leaq	(%rdx,%rdx,2), %r13
	salq	$3, %r13
	leaq	(%r15,%r13), %rax
	addq	%rbx, %r13
	cmpq	%rdx, %rsi
	je	.L126
.L124:
	movq	16(%r13), %rdx
	vmovdqu	0(%r13), %xmm5
	movq	32(%rsp), %rbx
	movq	%rdx, 16(%rax)
	leaq	24(%r13), %rdx
	vmovups	%xmm5, (%rax)
	cmpq	%rdx, %rbx
	je	.L126
	movq	40(%r13), %rdx
	vmovdqu	24(%r13), %xmm5
	movq	%rdx, 40(%rax)
	leaq	48(%r13), %rdx
	vmovups	%xmm5, 24(%rax)
	cmpq	%rdx, %rbx
	je	.L126
	movq	64(%r13), %rdx
	vmovdqu	48(%r13), %xmm3
	movq	%rdx, 64(%rax)
	vmovups	%xmm3, 48(%rax)
.L126:
	leaq	(%rsi,%rsi,2), %rax
	leaq	(%r15,%rax,8), %r15
.L123:
	testq	%r14, %r14
	je	.L157
	movq	%r14, %rdi
	vzeroupper
	call	_ZdlPv@PLT
.L127:
	movq	24(%rsp), %rax
	vmovq	%r12, %xmm4
	addq	56(%rsp), %r12
	vpinsrq	$1, %r15, %xmm4, %xmm0
	movq	%r12, 16(%rax)
	vmovups	%xmm0, (%rax)
	leaq	-40(%rbp), %rsp
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
.L161:
	.cfi_restore_state
	testq	%rdi, %rdi
	jne	.L113
	xorl	%r12d, %r12d
	jmp	.L133
	.p2align 4,,10
	.p2align 3
.L157:
	vzeroupper
	jmp	.L127
	.p2align 4,,10
	.p2align 3
.L134:
	movq	$24, 56(%rsp)
	jmp	.L112
	.p2align 4,,10
	.p2align 3
.L162:
	movq	48(%rsp), %r8
	xorl	%ecx, %ecx
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L137:
	movq	%r12, %rdx
	movq	%r14, %rax
	.p2align 4,,10
	.p2align 3
.L119:
	vmovdqu	(%rax), %xmm7
	addq	$24, %rax
	addq	$24, %rdx
	vmovups	%xmm7, -24(%rdx)
	movq	-8(%rax), %rsi
	movq	%rsi, -8(%rdx)
	cmpq	%rax, %rbx
	jne	.L119
	addq	$1, %rcx
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L136:
	movq	%r12, %r15
	jmp	.L118
.L138:
	movq	%r15, %rax
	jmp	.L124
.L113:
	movq	56(%rsp), %rax
	cmpq	%rdx, %rax
	cmovbe	%rax, %rdx
	imulq	$24, %rdx, %rax
	movq	%rax, 56(%rsp)
	jmp	.L112
.L160:
	leaq	.LC6(%rip), %rdi
.LEHB7:
	call	_ZSt20__throw_length_errorPKc@PLT
.LEHE7:
.L163:
.LEHB8:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE8:
.L139:
	endbr64
	movq	%rax, %rdi
.L128:
	vzeroupper
	call	__cxa_begin_catch@PLT
	testq	%r12, %r12
	je	.L164
	movq	%r12, %rdi
	call	_ZdlPv@PLT
.L132:
.LEHB9:
	call	__cxa_rethrow@PLT
.LEHE9:
.L164:
	movq	(%r15), %rdi
	testq	%rdi, %rdi
	je	.L132
	call	_ZdlPv@PLT
	jmp	.L132
.L140:
	endbr64
	movq	%rax, %r12
.L131:
	vzeroupper
	call	__cxa_end_catch@PLT
	movq	%r12, %rdi
.LEHB10:
	call	_Unwind_Resume@PLT
.LEHE10:
	.cfi_endproc
.LFE9599:
	.section	.gcc_except_table._ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"aG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align 4
.LLSDA9599:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT9599-.LLSDATTD9599
.LLSDATTD9599:
	.byte	0x1
	.uleb128 .LLSDACSE9599-.LLSDACSB9599
.LLSDACSB9599:
	.uleb128 .LEHB5-.LFB9599
	.uleb128 .LEHE5-.LEHB5
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB6-.LFB9599
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L139-.LFB9599
	.uleb128 0x1
	.uleb128 .LEHB7-.LFB9599
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB9599
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L139-.LFB9599
	.uleb128 0x1
	.uleb128 .LEHB9-.LFB9599
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L140-.LFB9599
	.uleb128 0
	.uleb128 .LEHB10-.LFB9599
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
.LLSDACSE9599:
	.byte	0x1
	.byte	0
	.align 4
	.long	0

.LLSDATT9599:
	.section	.text._ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.size	_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,"axG",@progbits,_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_,comdat
	.p2align 4
	.weak	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.type	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, @function
_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_:
.LFB9751:
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
	vmovdqa	.LC8(%rip), %ymm6
	vmovdqa	.LC9(%rip), %ymm5
	vmovdqa	.LC10(%rip), %ymm4
	vmovdqa	.LC11(%rip), %ymm3
	vmovsd	%xmm7, -8(%rsp)
	cmpq	$623, %rdx
	ja	.L166
.L194:
	movq	%rdx, %rax
	addq	$1, %rdx
.L167:
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
	js	.L175
	vcvtsi2sdq	%rax, %xmm8, %xmm1
.L176:
	vmulsd	-8(%rsp), %xmm1, %xmm1
	flds	.LC12(%rip)
	fmull	-8(%rsp)
	vaddsd	%xmm1, %xmm0, %xmm0
	fstpl	-8(%rsp)
	cmpl	$1, %r8d
	jne	.L180
	vdivsd	-8(%rsp), %xmm0, %xmm0
	vcmplesd	%xmm0, %xmm7, %xmm7
	vmovsd	.LC7(%rip), %xmm1
	vblendvpd	%xmm7, %xmm1, %xmm0, %xmm0
	vzeroupper
	leave
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L180:
	.cfi_restore_state
	movl	$1, %r8d
	cmpq	$623, %rdx
	jbe	.L194
.L166:
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L168:
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
	jne	.L168
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
	je	.L169
	xorq	%r9, %r10
.L169:
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
	je	.L170
	xorq	%r9, %r10
.L170:
	movq	1816(%rdi), %rax
	andq	$-2147483648, %rdx
	movq	%r10, 1800(%rdi)
	andl	$2147483647, %eax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	xorq	4984(%rdi), %rdx
	testb	$1, %al
	jne	.L171
.L173:
	movq	%rdx, 1808(%rdi)
	leaq	1816(%rdi), %rax
	.p2align 4,,10
	.p2align 3
.L172:
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
	jne	.L172
	movq	4984(%rdi), %rax
	movq	(%rdi), %rdx
	andq	$-2147483648, %rax
	andl	$2147483647, %edx
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	xorq	3168(%rdi), %rdx
	testb	$1, %al
	je	.L174
	xorq	%r9, %rdx
.L174:
	movq	%rdx, 4984(%rdi)
	xorl	%eax, %eax
	movl	$1, %edx
	jmp	.L167
	.p2align 4,,10
	.p2align 3
.L175:
	movq	%rax, %r10
	andl	$1, %eax
	shrq	%r10
	orq	%rax, %r10
	vcvtsi2sdq	%r10, %xmm8, %xmm1
	vaddsd	%xmm1, %xmm1, %xmm1
	jmp	.L176
	.p2align 4,,10
	.p2align 3
.L171:
	xorq	%r9, %rdx
	jmp	.L173
	.cfi_endproc
.LFE9751:
	.size	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_, .-_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	.section	.rodata.str1.1
.LC15:
	.string	"N = %d\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC16:
	.string	"evaluate_gravity of elapsed time = %lfsec\n"
	.align 8
.LC17:
	.string	"evaluate_gravity_simd of elapsed time = %lfsec\n"
	.section	.rodata.str1.1
.LC18:
	.string	"%lf times\n"
.LC19:
	.string	"w"
.LC20:
	.string	"non_simd_result.txt"
.LC21:
	.string	"simd_result.txt"
.LC22:
	.string	"correct"
.LC23:
	.string	"false"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB24:
	.section	.text.startup,"ax",@progbits
.LHOTB24:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB9127:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA9127
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
	subq	$1128, %rsp
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
.L196:
	movq	%rdx, %rax
	shrq	$30, %rax
	xorq	%rdx, %rax
	imulq	$1812433253, %rax, %rax
	leal	(%rax,%rcx), %edx
	movq	%rdx, (%rbx,%rcx,8)
	addq	$1, %rcx
	cmpq	$624, %rcx
	jne	.L196
	leaq	-237568(%rsp), %rax
	movq	$624, -64(%rbp)
	cmpq	%rax, %rsp
	je	.L198
.L288:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L288
.L198:
	subq	$2432, %rsp
	orq	$0, 2424(%rsp)
	movq	%rsp, -5248(%rbp)
	leaq	-77824(%rsp), %rax
.L200:
	cmpq	%rax, %rsp
	je	.L201
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L200
.L201:
	subq	$2176, %rsp
	orq	$0, 2168(%rsp)
	movq	%rsp, -5184(%rbp)
	leaq	-237568(%rsp), %rax
.L203:
	cmpq	%rax, %rsp
	je	.L204
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L203
.L204:
	subq	$2432, %rsp
	orq	$0, 2424(%rsp)
	movq	%rsp, -5240(%rbp)
	leaq	-36864(%rsp), %rax
.L206:
	cmpq	%rax, %rsp
	je	.L207
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L206
.L207:
	subq	$3136, %rsp
	orq	$0, 3128(%rsp)
	movq	%rsp, %r14
	leaq	-77824(%rsp), %rax
.L209:
	cmpq	%rax, %rsp
	je	.L210
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L209
.L210:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5192(%rbp)
	leaq	-77824(%rsp), %rax
.L212:
	cmpq	%rax, %rsp
	je	.L213
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L212
.L213:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %r12
	leaq	-77824(%rsp), %rax
	andq	$-32, %r12
	movq	%r12, -5200(%rbp)
.L215:
	cmpq	%rax, %rsp
	je	.L216
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L215
.L216:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %r13
	leaq	-77824(%rsp), %rax
	andq	$-32, %r13
	movq	%r13, -5208(%rbp)
.L218:
	cmpq	%rax, %rsp
	je	.L219
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L218
.L219:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5216(%rbp)
	leaq	-77824(%rsp), %rax
.L221:
	cmpq	%rax, %rsp
	je	.L222
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L221
.L222:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5224(%rbp)
	leaq	-77824(%rsp), %rax
.L224:
	cmpq	%rax, %rsp
	je	.L225
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L224
.L225:
	subq	$2208, %rsp
	orq	$0, 2200(%rsp)
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, -5232(%rbp)
	leaq	-319488(%rsp), %rax
.L227:
	cmpq	%rax, %rsp
	je	.L228
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L227
.L228:
	subq	$544, %rsp
	orq	$0, 536(%rsp)
	xorl	%r12d, %r12d
	movq	-5248(%rbp), %r15
	leaq	31(%rsp), %rax
	andq	$-32, %rax
	movq	%rax, %r13
	movq	%rax, -5256(%rbp)
	movq	%rbx, %rax
	movq	%r13, %rbx
	movq	%r12, %r13
	movq	%r15, %r12
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L230:
	movq	%r15, %rdi
	addq	$24, %r12
	addq	$32, %rbx
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	%r15, %rdi
	vaddsd	%xmm5, %xmm0, %xmm3
	vmovsd	%xmm3, -5176(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	%r15, %rdi
	vaddsd	%xmm6, %xmm0, %xmm2
	vmovsd	%xmm2, -5168(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	%r15, %rdi
	vaddsd	%xmm7, %xmm0, %xmm1
	vmovsd	%xmm1, -5160(%rbp)
	call	_ZSt18generate_canonicalIdLm53ESt23mersenne_twister_engineImLm32ELm624ELm397ELm31ELm2567483615ELm11ELm4294967295ELm7ELm2636928640ELm15ELm4022730752ELm18ELm1812433253EEET_RT1_
	vxorpd	%xmm5, %xmm5, %xmm5
	movq	-5184(%rbp), %rax
	vmovsd	-5176(%rbp), %xmm3
	vaddsd	%xmm5, %xmm0, %xmm0
	vmovsd	-5168(%rbp), %xmm2
	vmovsd	-5160(%rbp), %xmm1
	movl	%r13d, (%r14,%r13,4)
	vunpcklpd	%xmm2, %xmm3, %xmm4
	vmovsd	%xmm1, -8(%r12)
	vmovsd	%xmm0, (%rax,%r13,8)
	movq	-5192(%rbp), %rax
	vmovups	%xmm4, -24(%r12)
	vmovsd	%xmm3, (%rax,%r13,8)
	movq	-5200(%rbp), %rax
	vmovaps	%xmm4, -32(%rbx)
	vmovsd	%xmm2, (%rax,%r13,8)
	movq	-5208(%rbp), %rax
	vmovsd	%xmm1, -16(%rbx)
	vmovsd	%xmm1, (%rax,%r13,8)
	addq	$1, %r13
	vmovsd	%xmm0, -8(%rbx)
	cmpq	$10000, %r13
	jne	.L230
	call	clock@PLT
	subq	$8, %rsp
	movq	%r14, %rdx
	xorl	%r12d, %r12d
	movq	-5240(%rbp), %r13
	movq	-5248(%rbp), %rcx
	movl	$10000, %esi
	movq	%rax, %rbx
	movq	-5184(%rbp), %r15
	movl	$10000, %edi
	pushq	%r13
	movq	%rcx, %r8
	movq	%r15, %r9
	call	_Z16evaluate_gravityiiPiPA3_dS1_PdS1_
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$1, %edi
	leaq	.LC15(%rip), %rsi
	subq	%rbx, %rax
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	popq	%rax
	xorl	%eax, %eax
	popq	%rdx
	movl	$10000, %edx
	vdivsd	.LC14(%rip), %xmm0, %xmm6
	vmovsd	%xmm6, -5160(%rbp)
.LEHB11:
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	vmovsd	-5160(%rbp), %xmm0
	leaq	.LC16(%rip), %rsi
	call	__printf_chk@PLT
	call	clock@PLT
	movq	-5208(%rbp), %r9
	movq	%r14, %rdx
	movq	-5200(%rbp), %r8
	movq	-5192(%rbp), %rcx
	pushq	-5232(%rbp)
	movl	$10000, %esi
	movq	%rax, %rbx
	pushq	-5224(%rbp)
	movl	$10000, %edi
	leaq	-5088(%rbp), %r14
	pushq	-5216(%rbp)
	pushq	%r15
	pushq	-5256(%rbp)
	pushq	%r9
	pushq	%r8
	pushq	%rcx
	call	_Z21evaluate_gravity_simdiiPiPdS0_S0_S0_S0_S0_PA4_dS0_S0_S0_S0_
	addq	$64, %rsp
	call	clock@PLT
	vxorpd	%xmm4, %xmm4, %xmm4
	movl	$1, %edi
	leaq	.LC17(%rip), %rsi
	subq	%rbx, %rax
	vcvtsi2sdq	%rax, %xmm4, %xmm0
	movl	$1, %eax
	vdivsd	.LC14(%rip), %xmm0, %xmm0
	vmovsd	%xmm0, -5168(%rbp)
	call	__printf_chk@PLT
	movl	$1, %edi
	movl	$1, %eax
	vmovsd	-5160(%rbp), %xmm4
	vmovsd	-5168(%rbp), %xmm0
	leaq	.LC18(%rip), %rsi
	vdivsd	%xmm0, %xmm4, %xmm0
	call	__printf_chk@PLT
	leaq	.LC19(%rip), %rsi
	leaq	.LC20(%rip), %rdi
	call	fopen@PLT
	leaq	.LC19(%rip), %rsi
	leaq	.LC21(%rip), %rdi
	movq	%rax, -5192(%rbp)
	call	fopen@PLT
.LEHE11:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, -5136(%rbp)
	movq	%rax, -5200(%rbp)
	leaq	-5152(%rbp), %rax
	movq	%rax, -5176(%rbp)
	leaq	-5120(%rbp), %rax
	movq	$0, -5104(%rbp)
	movq	%rax, -5184(%rbp)
	vmovaps	%xmm0, -5152(%rbp)
	vmovaps	%xmm0, -5120(%rbp)
	.p2align 4,,10
	.p2align 3
.L259:
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%r13, %rdx
	xorl	%esi, %esi
	movq	%r14, %rdi
	movq	$0, -5072(%rbp)
	vmovaps	%xmm0, -5088(%rbp)
.LEHB12:
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5080(%rbp), %rsi
	movq	-5072(%rbp), %rax
	cmpq	%rax, %rsi
	je	.L231
	vmovsd	8(%r13), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5080(%rbp)
.L232:
	cmpq	%rax, %rsi
	je	.L233
	vmovsd	16(%r13), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5080(%rbp)
.L234:
	movq	-5144(%rbp), %r15
	cmpq	-5136(%rbp), %r15
	je	.L235
	movq	-5080(%rbp), %rbx
	subq	-5088(%rbp), %rbx
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%r15)
	movq	%rbx, %rax
	vmovups	%xmm0, (%r15)
	sarq	$3, %rax
	je	.L289
	movabsq	$1152921504606846975, %rdi
	cmpq	%rdi, %rax
	ja	.L290
	movq	%rbx, %rdi
	call	_Znwm@PLT
	movq	-5144(%rbp), %r8
	movq	%rax, %rcx
.L237:
	vmovq	%rcx, %xmm6
	addq	%rcx, %rbx
	vpunpcklqdq	%xmm6, %xmm6, %xmm0
	movq	%rbx, 16(%r15)
	vmovups	%xmm0, (%r15)
	movq	-5080(%rbp), %rax
	movq	-5088(%rbp), %rbx
	movq	%rax, %rdx
	subq	%rbx, %rdx
	cmpq	%rbx, %rax
	je	.L240
	movq	%rcx, %rdi
	movq	%rbx, %rsi
	movq	%r8, -5168(%rbp)
	movq	%rdx, -5160(%rbp)
	call	memmove@PLT
	movq	-5168(%rbp), %r8
	movq	-5160(%rbp), %rdx
	movq	%rax, %rcx
.L240:
	addq	%rdx, %rcx
	addq	$24, %r8
	movq	%rcx, 8(%r15)
	movq	%r8, -5144(%rbp)
.L241:
	cmpq	%rbx, -5080(%rbp)
	je	.L242
	movq	%rbx, -5080(%rbp)
.L242:
	movq	-5072(%rbp), %rax
	cmpq	%rbx, %rax
	je	.L243
	movq	-5216(%rbp), %rdi
	leaq	8(%rbx), %rsi
	vmovsd	(%rdi,%r12,8), %xmm0
	vmovsd	%xmm0, (%rbx)
	movq	%rsi, -5080(%rbp)
.L244:
	cmpq	%rax, %rsi
	je	.L245
	movq	-5224(%rbp), %rdi
	addq	$8, %rsi
	vmovsd	(%rdi,%r12,8), %xmm0
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5080(%rbp)
.L246:
	cmpq	%rax, %rsi
	movq	-5232(%rbp), %rax
	je	.L247
	vmovsd	(%rax,%r12,8), %xmm0
	addq	$8, %rsi
	vmovsd	%xmm0, -8(%rsi)
	movq	%rsi, -5080(%rbp)
.L248:
	movq	-5112(%rbp), %r15
	cmpq	-5104(%rbp), %r15
	je	.L249
	movq	-5080(%rbp), %rbx
	subq	-5088(%rbp), %rbx
	vpxor	%xmm0, %xmm0, %xmm0
	movq	$0, 16(%r15)
	movq	%rbx, %rax
	vmovups	%xmm0, (%r15)
	sarq	$3, %rax
	je	.L291
	movabsq	$1152921504606846975, %rdi
	cmpq	%rdi, %rax
	ja	.L292
	movq	%rbx, %rdi
	call	_Znwm@PLT
.LEHE12:
	movq	-5112(%rbp), %r8
	movq	%rax, %rcx
.L251:
	vmovq	%rcx, %xmm7
	addq	%rcx, %rbx
	vpunpcklqdq	%xmm7, %xmm7, %xmm0
	movq	%rbx, 16(%r15)
	vmovups	%xmm0, (%r15)
	movq	-5080(%rbp), %rax
	movq	-5088(%rbp), %rbx
	movq	%rax, %rdx
	subq	%rbx, %rdx
	cmpq	%rbx, %rax
	je	.L254
	movq	%rcx, %rdi
	movq	%rbx, %rsi
	movq	%r8, -5168(%rbp)
	movq	%rdx, -5160(%rbp)
	call	memmove@PLT
	movq	-5168(%rbp), %r8
	movq	-5160(%rbp), %rdx
	movq	%rax, %rcx
.L254:
	addq	%rdx, %rcx
	addq	$24, %r8
	movq	%rcx, 8(%r15)
	movq	%r8, -5112(%rbp)
.L255:
	testq	%rbx, %rbx
	je	.L256
	movq	%rbx, %rdi
	addq	$1, %r12
	addq	$24, %r13
	call	_ZdlPv@PLT
	cmpq	$10000, %r12
	jne	.L259
.L257:
	movq	-5176(%rbp), %rsi
	movq	%r14, %rdi
.LEHB13:
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC1ERKS3_
.LEHE13:
	movq	-5192(%rbp), %r15
	movl	$10000, %esi
	movq	%r14, %rdi
	movq	%r15, %rdx
.LEHB14:
	call	_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE
.LEHE14:
	movq	%r14, %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	-5184(%rbp), %rsi
	movq	%r14, %rdi
.LEHB15:
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EEC1ERKS3_
.LEHE15:
	movq	-5200(%rbp), %rbx
	movl	$10000, %esi
	movq	%r14, %rdi
	movq	%rbx, %rdx
.LEHB16:
	call	_Z9print_vecSt6vectorIS_IdSaIdEESaIS1_EEiP8_IO_FILE
.LEHE16:
	movq	%r14, %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	%r15, %rdi
.LEHB17:
	call	fclose@PLT
	movq	%rbx, %rdi
	call	fclose@PLT
	movq	-5240(%rbp), %rcx
	movq	-5232(%rbp), %rdx
	movl	$10000, %r8d
	movq	-5224(%rbp), %rsi
	movq	-5216(%rbp), %rdi
	call	_Z15check_particlesPdS_S_PA3_di
	testb	%al, %al
	je	.L260
	movl	$7, %edx
	leaq	.LC22(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.L287:
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@PLT
.LEHE17:
	movq	-5184(%rbp), %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	-5176(%rbp), %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L293
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
.L256:
	.cfi_restore_state
	addq	$1, %r12
	addq	$24, %r13
	cmpq	$10000, %r12
	jne	.L259
	jmp	.L257
	.p2align 4,,10
	.p2align 3
.L235:
	movq	-5176(%rbp), %rdi
	movq	%r14, %rdx
	movq	%r15, %rsi
.LEHB18:
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movq	-5088(%rbp), %rbx
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L249:
	movq	-5184(%rbp), %rdi
	movq	%r14, %rdx
	movq	%r15, %rsi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	movq	-5088(%rbp), %rbx
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L289:
	movq	%r15, %r8
	xorl	%ecx, %ecx
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L291:
	movq	%r15, %r8
	xorl	%ecx, %ecx
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L247:
	leaq	(%rax,%r12,8), %rdx
	movq	%r14, %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	jmp	.L248
	.p2align 4,,10
	.p2align 3
.L245:
	movq	-5224(%rbp), %rax
	movq	%r14, %rdi
	leaq	(%rax,%r12,8), %rdx
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5080(%rbp), %rsi
	movq	-5072(%rbp), %rax
	jmp	.L246
	.p2align 4,,10
	.p2align 3
.L243:
	movq	-5216(%rbp), %rax
	movq	%rbx, %rsi
	movq	%r14, %rdi
	leaq	(%rax,%r12,8), %rdx
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	movq	-5080(%rbp), %rsi
	movq	-5072(%rbp), %rax
	jmp	.L244
	.p2align 4,,10
	.p2align 3
.L233:
	leaq	16(%r13), %rdx
	movq	%r14, %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L231:
	leaq	8(%r13), %rdx
	movq	%r14, %rdi
	call	_ZNSt6vectorIdSaIdEE17_M_realloc_insertIJRKdEEEvN9__gnu_cxx17__normal_iteratorIPdS1_EEDpOT_
.LEHE18:
	movq	-5080(%rbp), %rsi
	movq	-5072(%rbp), %rax
	jmp	.L232
.L260:
	movl	$5, %edx
	leaq	.LC23(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
.LEHB19:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
.LEHE19:
	jmp	.L287
.L292:
.LEHB20:
	call	_ZSt17__throw_bad_allocv@PLT
.L290:
	call	_ZSt17__throw_bad_allocv@PLT
.LEHE20:
.L293:
	call	__stack_chk_fail@PLT
.L271:
	endbr64
	movq	%rax, %r12
	jmp	.L266
.L268:
	endbr64
	movq	%rax, %r12
	jmp	.L262
.L270:
	endbr64
	movq	%rax, %r12
	jmp	.L265
.L269:
	endbr64
	movq	%rax, %r12
	vzeroupper
	jmp	.L264
	.section	.gcc_except_table,"a",@progbits
.LLSDA9127:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE9127-.LLSDACSB9127
.LLSDACSB9127:
	.uleb128 .LEHB11-.LFB9127
	.uleb128 .LEHE11-.LEHB11
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB12-.LFB9127
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L268-.LFB9127
	.uleb128 0
	.uleb128 .LEHB13-.LFB9127
	.uleb128 .LEHE13-.LEHB13
	.uleb128 .L269-.LFB9127
	.uleb128 0
	.uleb128 .LEHB14-.LFB9127
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L270-.LFB9127
	.uleb128 0
	.uleb128 .LEHB15-.LFB9127
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L269-.LFB9127
	.uleb128 0
	.uleb128 .LEHB16-.LFB9127
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L271-.LFB9127
	.uleb128 0
	.uleb128 .LEHB17-.LFB9127
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L269-.LFB9127
	.uleb128 0
	.uleb128 .LEHB18-.LFB9127
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L268-.LFB9127
	.uleb128 0
	.uleb128 .LEHB19-.LFB9127
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L269-.LFB9127
	.uleb128 0
	.uleb128 .LEHB20-.LFB9127
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L268-.LFB9127
	.uleb128 0
.LLSDACSE9127:
	.section	.text.startup
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDAC9127
	.type	main.cold, @function
main.cold:
.LFSB9127:
.L266:
	.cfi_def_cfa 6, 16
	.cfi_offset 3, -56
	.cfi_offset 6, -16
	.cfi_offset 12, -48
	.cfi_offset 13, -40
	.cfi_offset 14, -32
	.cfi_offset 15, -24
	movq	%r14, %rdi
	vzeroupper
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
.L264:
	movq	-5184(%rbp), %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	-5176(%rbp), %rdi
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	movq	%r12, %rdi
.LEHB21:
	call	_Unwind_Resume@PLT
.LEHE21:
.L262:
	movq	-5088(%rbp), %rdi
	testq	%rdi, %rdi
	je	.L284
	vzeroupper
	call	_ZdlPv@PLT
	jmp	.L264
.L265:
	movq	%r14, %rdi
	vzeroupper
	call	_ZNSt6vectorIS_IdSaIdEESaIS1_EED1Ev
	jmp	.L264
.L284:
	vzeroupper
	jmp	.L264
	.cfi_endproc
.LFE9127:
	.section	.gcc_except_table
.LLSDAC9127:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSEC9127-.LLSDACSBC9127
.LLSDACSBC9127:
	.uleb128 .LEHB21-.LCOLDB24
	.uleb128 .LEHE21-.LEHB21
	.uleb128 0
	.uleb128 0
.LLSDACSEC9127:
	.section	.text.unlikely
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE24:
	.section	.text.startup
.LHOTE24:
	.p2align 4
	.type	_GLOBAL__sub_I__Z16evaluate_gravityiiPiPA3_dS1_PdS1_, @function
_GLOBAL__sub_I__Z16evaluate_gravityiiPiPA3_dS1_PdS1_:
.LFB9946:
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
.LFE9946:
	.size	_GLOBAL__sub_I__Z16evaluate_gravityiiPiPA3_dS1_PdS1_, .-_GLOBAL__sub_I__Z16evaluate_gravityiiPiPA3_dS1_PdS1_
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z16evaluate_gravityiiPiPA3_dS1_PdS1_
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
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	4294967295
	.long	2147483647
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC5:
	.long	3944497965
	.long	1058682594
	.align 8
.LC7:
	.long	4294967295
	.long	1072693247
	.section	.rodata.cst32
	.align 32
.LC8:
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.quad	-2147483648
	.align 32
.LC9:
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.quad	2147483647
	.align 32
.LC10:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC11:
	.quad	2567483615
	.quad	2567483615
	.quad	2567483615
	.quad	2567483615
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC12:
	.long	1333788672
	.section	.rodata.cst8
	.align 8
.LC14:
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
