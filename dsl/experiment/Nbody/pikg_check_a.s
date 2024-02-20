	.file	"pikg_check.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1347:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1347:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.rodata._ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi.str1.1,"aMS",@progbits,1
.LC2:
	.string	"ni: "
.LC3:
	.string	" nj:"
.LC10:
	.string	"kerel 1: "
.LC11:
	.string	" ns"
.LC12:
	.string	"kerel 2: "
	.section	.text._ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi,"axG",@progbits,_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi,comdat
	.align 2
	.p2align 4
	.weak	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	.type	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi, @function
_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi:
.LFB8067:
	.cfi_startproc
	endbr64
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	pushq	%r14
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movl	%edx, %r14d
	pushq	%r13
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movq	%rdi, %r13
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rcx, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r8d, %ebx
	subq	$224, %rsp
	movq	%r9, -80(%rbp)
	movl	(%r10), %eax
	movq	%rsi, -144(%rbp)
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	testl	%eax, %eax
	js	.L96
	movl	%eax, 0(%r13)
	testl	%eax, %eax
	je	.L97
.L6:
	cmpl	$1, %eax
	je	.L98
.L39:
	cmpl	$2, %eax
	je	.L99
.L3:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L100
	addq	$224, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L96:
	.cfi_restore_state
	movl	0(%r13), %eax
	testl	%eax, %eax
	jne	.L6
.L97:
	movl	$4, %edx
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r14d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movl	$4, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r15, %rdi
	movl	%ebx, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %r15
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L24
	cmpb	$0, 56(%rdi)
	je	.L8
	movsbl	67(%rdi), %esi
.L9:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movslq	%r14d, %rax
	movabsq	$384307168202282325, %rdx
	cmpq	%rdx, %rax
	ja	.L10
	leaq	(%rax,%rax,2), %rdi
	leal	3(%r14), %r15d
	salq	$3, %rdi
	call	_Znam@PLT
	testl	%r14d, %r14d
	cmovns	%r14d, %r15d
	movq	%rax, -152(%rbp)
	andl	$-4, %r15d
	testl	%r14d, %r14d
	jle	.L101
	movq	%rax, %rdi
	leal	-1(%r14), %eax
	movq	-80(%rbp), %rsi
	leaq	3(%rax,%rax,2), %rdx
	salq	$3, %rdx
	call	memcpy@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -72(%rbp)
	testl	%r15d, %r15d
	jle	.L102
.L14:
	vxorpd	%xmm6, %xmm6, %xmm6
	leal	-1(%rbx), %edx
	leaq	40(%r12), %r8
	xorl	%esi, %esi
	vcmppd	$0, %ymm6, %ymm6, %ymm6
	movq	%rdx, %r9
	movq	-144(%rbp), %rcx
	leaq	(%rdx,%rdx,4), %rdx
	movq	-152(%rbp), %rax
	vmovdqa	.LC15(%rip), %xmm7
	leaq	(%r8,%rdx,8), %rdi
	vmovdqa	.LC4(%rip), %ymm14
	vmovdqa	.LC5(%rip), %ymm13
	.p2align 4,,10
	.p2align 3
.L19:
	vmovapd	%ymm6, %ymm4
	vgatherdpd	%ymm4, (%rcx,%xmm7,8), %ymm10
	vmovapd	%ymm6, %ymm4
	vgatherdpd	%ymm4, 8(%rcx,%xmm7,8), %ymm11
	vmovapd	%ymm6, %ymm4
	vgatherdpd	%ymm4, 16(%rcx,%xmm7,8), %ymm12
	testl	%ebx, %ebx
	jle	.L62
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%r12, %rdx
	vmovapd	%ymm2, %ymm8
	vmovapd	%ymm2, %ymm9
	.p2align 4,,10
	.p2align 3
.L17:
	vbroadcastsd	(%rdx), %ymm5
	vbroadcastsd	32(%rdx), %ymm0
	addq	$40, %rdx
	vbroadcastsd	-32(%rdx), %ymm4
	vbroadcastsd	-24(%rdx), %ymm3
	vsubpd	%ymm5, %ymm10, %ymm5
	vsubpd	%ymm4, %ymm11, %ymm4
	vsubpd	%ymm3, %ymm12, %ymm3
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vpsrlvq	%ymm14, %ymm0, %ymm1
	vpsubq	%ymm1, %ymm13, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vfnmadd213pd	.LC6(%rip), %ymm1, %ymm0
	vfmadd213pd	.LC8(%rip), %ymm0, %ymm15
	vmulpd	%ymm15, %ymm0, %ymm0
	vfmadd132pd	%ymm1, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm15
	vmulpd	%ymm0, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm15, %ymm0
	vfmadd231pd	%ymm5, %ymm0, %ymm9
	vfmadd231pd	%ymm4, %ymm0, %ymm8
	vfmadd231pd	%ymm3, %ymm0, %ymm2
	cmpq	%rdx, %rdi
	jne	.L17
.L16:
	vmovapd	%ymm6, %ymm3
	vmovapd	%ymm6, %ymm4
	vmovapd	%ymm6, %ymm5
	addl	$4, %esi
	vgatherdpd	%ymm3, (%rax,%xmm7,8), %ymm0
	addq	$96, %rcx
	vaddpd	%ymm9, %ymm0, %ymm9
	vmovlpd	%xmm9, (%rax)
	vmovhpd	%xmm9, 24(%rax)
	vextractf128	$0x1, %ymm9, %xmm9
	vmovlpd	%xmm9, 48(%rax)
	vmovhpd	%xmm9, 72(%rax)
	vgatherdpd	%ymm4, 8(%rax,%xmm7,8), %ymm0
	vaddpd	%ymm8, %ymm0, %ymm8
	vmovlpd	%xmm8, 8(%rax)
	vmovhpd	%xmm8, 32(%rax)
	vextractf128	$0x1, %ymm8, %xmm8
	vmovlpd	%xmm8, 56(%rax)
	vmovhpd	%xmm8, 80(%rax)
	vgatherdpd	%ymm5, 16(%rax,%xmm7,8), %ymm0
	addq	$96, %rax
	vaddpd	%ymm0, %ymm2, %ymm2
	vmovlpd	%xmm2, -80(%rax)
	vmovhpd	%xmm2, -56(%rax)
	vextractf128	$0x1, %ymm2, %xmm2
	vmovlpd	%xmm2, -32(%rax)
	vmovhpd	%xmm2, -8(%rax)
	cmpl	%r15d, %esi
	jl	.L19
	testl	%r15d, %r15d
	movl	$4, %ecx
	cmovg	%r15d, %ecx
	cmpl	%ecx, %r14d
	jle	.L103
	vzeroupper
.L13:
	movslq	%ecx, %rax
	movl	%r9d, %r9d
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	-144(%rbp), %rdi
	leaq	(%rax,%rax,2), %rax
	leaq	(%r9,%r9,4), %rsi
	vmovsd	.LC9(%rip), %xmm9
	salq	$3, %rax
	leaq	(%r8,%rsi,8), %rsi
	leaq	(%rdi,%rax), %rdx
	addq	-152(%rbp), %rax
	.p2align 4,,10
	.p2align 3
.L23:
	vmovsd	(%rdx), %xmm8
	vmovsd	8(%rdx), %xmm10
	vmovsd	16(%rdx), %xmm11
	testl	%ebx, %ebx
	jle	.L63
	vmovapd	%xmm2, %xmm3
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm1
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L22:
	vsubsd	(%r15), %xmm8, %xmm6
	vsubsd	8(%r15), %xmm10, %xmm5
	vsubsd	16(%r15), %xmm11, %xmm4
	vmovsd	24(%r15), %xmm12
	vmovapd	%xmm6, %xmm0
	vfmadd213sd	32(%r15), %xmm6, %xmm0
	vfmadd231sd	%xmm5, %xmm5, %xmm0
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm0, %xmm13
	ja	.L104
.L21:
	vdivsd	%xmm13, %xmm9, %xmm13
	addq	$40, %r15
	vmulsd	%xmm13, %xmm13, %xmm0
	vmulsd	%xmm13, %xmm12, %xmm12
	vmulsd	%xmm12, %xmm0, %xmm0
	vfmadd231sd	%xmm0, %xmm6, %xmm1
	vfmadd231sd	%xmm0, %xmm5, %xmm7
	vfmadd231sd	%xmm0, %xmm4, %xmm3
	cmpq	%r15, %rsi
	jne	.L22
.L20:
	vaddsd	16(%rax), %xmm3, %xmm3
	vunpcklpd	%xmm7, %xmm1, %xmm1
	vaddpd	(%rax), %xmm1, %xmm1
	addl	$1, %ecx
	addq	$24, %rdx
	addq	$24, %rax
	vmovups	%xmm1, -24(%rax)
	vmovsd	%xmm3, -8(%rax)
	cmpl	%ecx, %r14d
	jg	.L23
.L15:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	subq	-72(%rbp), %rax
	movl	$9, %edx
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	leaq	.LC10(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	vmovsd	%xmm0, -160(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-160(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L24
	cmpb	$0, 56(%rdi)
	je	.L25
	movsbl	67(%rdi), %esi
.L26:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	.LC1(%rip), %xmm0
	vcomisd	-160(%rbp), %xmm0
	jbe	.L91
	movl	$1, 0(%r13)
.L27:
	testl	%r14d, %r14d
	jle	.L29
	leal	-1(%r14), %eax
	movq	-80(%rbp), %rsi
	movq	-152(%rbp), %rdi
	leaq	3(%rax,%rax,2), %r9
	leaq	0(,%r9,8), %r15
	movq	%r15, %rdx
	call	memcpy@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	testl	%ebx, %ebx
	leal	3(%rbx), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	cmovns	%ebx, %r8d
	movq	%rax, -176(%rbp)
	movq	-152(%rbp), %rax
	vcmppd	$0, %ymm0, %ymm0, %ymm10
	movq	-144(%rbp), %rcx
	andl	$-4, %r8d
	leaq	(%rax,%r15), %r9
	movq	%rax, %rdx
	leal	-1(%r8), %eax
	vmovapd	%ymm10, %ymm8
	shrl	$2, %eax
	movl	%eax, %esi
	leal	4(,%rax,4), %r15d
	leaq	(%rsi,%rsi,4), %rsi
	salq	$5, %rsi
	leaq	192(%r12,%rsi), %r10
	.p2align 4,,10
	.p2align 3
.L34:
	vmovsd	(%rcx), %xmm5
	vmovsd	8(%rcx), %xmm7
	vmovsd	%xmm5, -72(%rbp)
	vbroadcastsd	%xmm5, %ymm12
	vmovsd	16(%rcx), %xmm5
	vbroadcastsd	%xmm7, %ymm13
	vmovsd	%xmm7, -112(%rbp)
	vmovapd	%xmm5, %xmm15
	vbroadcastsd	%xmm5, %ymm14
	testl	%r8d, %r8d
	jle	.L66
	vmovdqa	.LC16(%rip), %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	32(%r12), %rax
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm4
	vmovdqa	%xmm0, %xmm9
	.p2align 4,,10
	.p2align 3
.L31:
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm8, %ymm7
	vmovapd	%ymm8, %ymm5
	vmovdqa	.LC5(%rip), %ymm11
	vgatherdpd	%ymm6, -8(%rax,%xmm9,8), %ymm10
	vmovapd	%ymm8, %ymm6
	vmovapd	%ymm8, %ymm1
	vgatherdpd	%ymm7, (%rax,%xmm9,8), %ymm0
	vgatherdpd	%ymm6, -32(%rax,%xmm9,8), %ymm7
	vgatherdpd	%ymm5, -24(%rax,%xmm9,8), %ymm6
	vsubpd	%ymm7, %ymm12, %ymm7
	vsubpd	%ymm6, %ymm13, %ymm6
	vgatherdpd	%ymm1, -16(%rax,%xmm9,8), %ymm5
	addq	$160, %rax
	vsubpd	%ymm5, %ymm14, %ymm5
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vpsrlvq	.LC4(%rip), %ymm0, %ymm1
	vpsubq	%ymm1, %ymm11, %ymm1
	vmovapd	.LC7(%rip), %ymm11
	vmulpd	%ymm1, %ymm0, %ymm0
	vfnmadd213pd	.LC6(%rip), %ymm1, %ymm0
	vfmadd213pd	.LC8(%rip), %ymm0, %ymm11
	vmulpd	%ymm11, %ymm0, %ymm0
	vfmadd132pd	%ymm1, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm11
	vmulpd	%ymm0, %ymm10, %ymm0
	vmulpd	%ymm0, %ymm11, %ymm0
	vfmadd231pd	%ymm7, %ymm0, %ymm4
	vfmadd231pd	%ymm6, %ymm0, %ymm3
	vfmadd231pd	%ymm5, %ymm0, %ymm2
	cmpq	%rax, %r10
	jne	.L31
	movl	%r15d, %esi
.L30:
	cmpl	%esi, %ebx
	jg	.L105
.L32:
	vunpckhpd	%ymm4, %ymm4, %ymm0
	addq	$24, %rdx
	addq	$24, %rcx
	vaddpd	%ymm0, %ymm4, %ymm4
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%ymm0, %ymm4, %ymm4
	vunpckhpd	%ymm3, %ymm3, %ymm0
	vaddsd	-24(%rdx), %xmm4, %xmm4
	vaddpd	%ymm0, %ymm3, %ymm3
	vmovsd	%xmm4, -24(%rdx)
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%ymm0, %ymm3, %ymm3
	vunpckhpd	%ymm2, %ymm2, %ymm0
	vaddsd	-16(%rdx), %xmm3, %xmm3
	vaddpd	%ymm0, %ymm2, %ymm2
	vmovsd	%xmm3, -16(%rdx)
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%ymm0, %ymm2, %ymm2
	vaddsd	-8(%rdx), %xmm2, %xmm2
	vmovsd	%xmm2, -8(%rdx)
	cmpq	%rdx, %r9
	jne	.L34
	vzeroupper
.L58:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm7, %xmm7, %xmm7
	subq	-176(%rbp), %rax
	movl	$9, %edx
	vcvtsi2sdq	%rax, %xmm7, %xmm0
	leaq	.LC12(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	vmovsd	%xmm0, -72(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-72(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC11(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L24
	cmpb	$0, 56(%rdi)
	je	.L35
	movsbl	67(%rdi), %esi
.L36:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	-160(%rbp), %xmm7
	vcomisd	-72(%rbp), %xmm7
	jbe	.L37
	movl	$2, 0(%r13)
.L37:
	movq	-152(%rbp), %rdi
	call	_ZdaPv@PLT
	movl	0(%r13), %eax
	cmpl	$1, %eax
	jne	.L39
.L98:
	testl	%r14d, %r14d
	leal	3(%r14), %eax
	cmovns	%r14d, %eax
	andl	$-4, %eax
	movl	%eax, %r8d
	jle	.L106
	subl	$1, %r8d
	movq	-80(%rbp), %rdi
	vxorpd	%xmm7, %xmm7, %xmm7
	movq	-144(%rbp), %rcx
	shrl	$2, %r8d
	vcmppd	$0, %ymm7, %ymm7, %ymm7
	vmovdqa	.LC15(%rip), %xmm8
	vmovdqa	.LC4(%rip), %ymm14
	movl	%r8d, %edx
	movq	%rdi, %rax
	vmovdqa	.LC5(%rip), %ymm13
	leaq	(%rdx,%rdx,2), %rdx
	salq	$5, %rdx
	leaq	96(%rdi,%rdx), %rdi
	leal	-1(%rbx), %edx
	leaq	(%rdx,%rdx,4), %rdx
	leaq	40(%r12,%rdx,8), %rsi
	.p2align 4,,10
	.p2align 3
.L44:
	vmovapd	%ymm7, %ymm3
	vmovapd	%ymm7, %ymm4
	vmovapd	%ymm7, %ymm5
	vgatherdpd	%ymm3, (%rcx,%xmm8,8), %ymm10
	vgatherdpd	%ymm4, 8(%rcx,%xmm8,8), %ymm11
	vgatherdpd	%ymm5, 16(%rcx,%xmm8,8), %ymm12
	testl	%ebx, %ebx
	jle	.L68
	vxorpd	%xmm9, %xmm9, %xmm9
	movq	%r12, %rdx
	vmovapd	%ymm9, %ymm2
	vmovapd	%ymm9, %ymm3
	.p2align 4,,10
	.p2align 3
.L43:
	vbroadcastsd	(%rdx), %ymm6
	vbroadcastsd	32(%rdx), %ymm0
	addq	$40, %rdx
	vbroadcastsd	-32(%rdx), %ymm5
	vbroadcastsd	-24(%rdx), %ymm4
	vsubpd	%ymm6, %ymm10, %ymm6
	vmovapd	.LC7(%rip), %ymm15
	vsubpd	%ymm5, %ymm11, %ymm5
	vsubpd	%ymm4, %ymm12, %ymm4
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vpsrlvq	%ymm14, %ymm0, %ymm1
	vpsubq	%ymm1, %ymm13, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vfnmadd213pd	.LC6(%rip), %ymm1, %ymm0
	vfmadd213pd	.LC8(%rip), %ymm0, %ymm15
	vmulpd	%ymm15, %ymm0, %ymm0
	vfmadd132pd	%ymm1, %ymm1, %ymm0
	vbroadcastsd	-16(%rdx), %ymm1
	vmulpd	%ymm0, %ymm0, %ymm15
	vmulpd	%ymm0, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm15, %ymm0
	vfmadd231pd	%ymm6, %ymm0, %ymm3
	vfmadd231pd	%ymm5, %ymm0, %ymm2
	vfmadd231pd	%ymm4, %ymm0, %ymm9
	cmpq	%rsi, %rdx
	jne	.L43
.L42:
	vmovapd	%ymm7, %ymm6
	vmovapd	%ymm7, %ymm4
	addq	$96, %rcx
	vgatherdpd	%ymm6, (%rax,%xmm8,8), %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	vmovlpd	%xmm3, (%rax)
	vmovhpd	%xmm3, 24(%rax)
	vextractf128	$0x1, %ymm3, %xmm3
	vmovlpd	%xmm3, 48(%rax)
	vmovhpd	%xmm3, 72(%rax)
	vmovapd	%ymm7, %ymm3
	vgatherdpd	%ymm3, 8(%rax,%xmm8,8), %ymm0
	vaddpd	%ymm0, %ymm2, %ymm2
	vmovlpd	%xmm2, 8(%rax)
	vmovhpd	%xmm2, 32(%rax)
	vextractf128	$0x1, %ymm2, %xmm2
	vmovlpd	%xmm2, 56(%rax)
	vmovhpd	%xmm2, 80(%rax)
	vgatherdpd	%ymm4, 16(%rax,%xmm8,8), %ymm0
	addq	$96, %rax
	vaddpd	%ymm9, %ymm0, %ymm9
	vmovlpd	%xmm9, -80(%rax)
	vmovhpd	%xmm9, -56(%rax)
	vextractf128	$0x1, %ymm9, %xmm9
	vmovlpd	%xmm9, -32(%rax)
	vmovhpd	%xmm9, -8(%rax)
	cmpq	%rax, %rdi
	jne	.L44
	leal	4(,%r8,4), %esi
.L45:
	cmpl	%esi, %r14d
	jle	.L93
	leal	-1(%r14), %ecx
	movslq	%esi, %rdi
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	-144(%rbp), %r11
	subl	%esi, %ecx
	leaq	(%rdi,%rdi,2), %rax
	vmovsd	.LC9(%rip), %xmm11
	addq	%rdi, %rcx
	salq	$3, %rax
	leaq	(%rcx,%rcx,2), %rcx
	leaq	(%r11,%rax), %rdx
	addq	-80(%rbp), %rax
	leaq	24(%r11,%rcx,8), %rsi
	leal	-1(%rbx), %ecx
	leaq	(%rcx,%rcx,4), %rcx
	leaq	40(%r12,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L50:
	vmovsd	(%rdx), %xmm8
	vmovsd	8(%rdx), %xmm9
	vmovsd	16(%rdx), %xmm10
	testl	%ebx, %ebx
	jle	.L69
	vmovapd	%xmm2, %xmm3
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm1
	movq	%r12, %r15
	.p2align 4,,10
	.p2align 3
.L48:
	vsubsd	(%r15), %xmm8, %xmm6
	vsubsd	8(%r15), %xmm9, %xmm5
	vsubsd	16(%r15), %xmm10, %xmm4
	vmovsd	24(%r15), %xmm12
	vmovapd	%xmm6, %xmm0
	vfmadd213sd	32(%r15), %xmm6, %xmm0
	vfmadd231sd	%xmm5, %xmm5, %xmm0
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vucomisd	%xmm0, %xmm2
	vsqrtsd	%xmm0, %xmm0, %xmm13
	ja	.L107
.L47:
	vdivsd	%xmm13, %xmm11, %xmm13
	addq	$40, %r15
	vmulsd	%xmm13, %xmm13, %xmm0
	vmulsd	%xmm13, %xmm12, %xmm12
	vmulsd	%xmm12, %xmm0, %xmm0
	vfmadd231sd	%xmm0, %xmm6, %xmm1
	vfmadd231sd	%xmm0, %xmm5, %xmm7
	vfmadd231sd	%xmm0, %xmm4, %xmm3
	cmpq	%rcx, %r15
	jne	.L48
.L46:
	vaddsd	16(%rax), %xmm3, %xmm3
	vunpcklpd	%xmm7, %xmm1, %xmm1
	vaddpd	(%rax), %xmm1, %xmm1
	addq	$24, %rdx
	addq	$24, %rax
	vmovups	%xmm1, -24(%rax)
	vmovsd	%xmm3, -8(%rax)
	cmpq	%rdx, %rsi
	jne	.L50
	cmpl	$2, 0(%r13)
	je	.L57
.L93:
	vzeroupper
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%rdi, -72(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-72(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L9
	call	*%rax
	movsbl	%al, %esi
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L105:
	leal	-1(%rbx), %r11d
	vmovapd	%ymm2, %ymm10
	vmovapd	%ymm3, %ymm11
	movslq	%esi, %rdi
	leaq	(%rdi,%rdi,4), %rax
	vmovapd	.LC7(%rip), %ymm14
	vmovapd	%ymm4, %ymm12
	vmovapd	%xmm15, %xmm9
	leaq	(%r12,%rax,8), %rax
	vmovapd	.LC8(%rip), %ymm13
	movq	%rax, -168(%rbp)
	movl	%r11d, %eax
	subl	%esi, %eax
	movq	%rax, %rsi
	movq	-168(%rbp), %rax
	addq	%rdi, %rsi
	leaq	(%rsi,%rsi,4), %rsi
	leaq	40(%r12,%rsi,8), %rsi
	.p2align 4,,10
	.p2align 3
.L33:
	vmovsd	-72(%rbp), %xmm7
	vsubsd	(%rax), %xmm7, %xmm7
	addq	$40, %rax
	vbroadcastsd	-8(%rax), %ymm1
	vmovsd	-112(%rbp), %xmm6
	vsubsd	-32(%rax), %xmm6, %xmm6
	vsubsd	-24(%rax), %xmm9, %xmm5
	vbroadcastsd	%xmm7, %ymm7
	vmovdqa	.LC5(%rip), %ymm15
	vfmadd231pd	%ymm7, %ymm7, %ymm1
	vbroadcastsd	%xmm6, %ymm6
	vbroadcastsd	%xmm5, %ymm5
	vfmadd231pd	%ymm6, %ymm6, %ymm1
	vfmadd231pd	%ymm5, %ymm5, %ymm1
	vpsrlvq	.LC4(%rip), %ymm1, %ymm0
	vpsubq	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm1
	vfnmadd213pd	.LC6(%rip), %ymm0, %ymm1
	vmovapd	%ymm1, %ymm15
	vfmadd132pd	%ymm14, %ymm13, %ymm15
	vmulpd	%ymm15, %ymm1, %ymm1
	vbroadcastsd	-16(%rax), %ymm15
	vfmadd132pd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm0
	vfmadd231pd	%ymm7, %ymm0, %ymm12
	vfmadd231pd	%ymm6, %ymm0, %ymm11
	vfmadd231pd	%ymm5, %ymm0, %ymm10
	cmpq	%rax, %rsi
	jne	.L33
	vblendpd	$1, %ymm12, %ymm4, %ymm4
	vblendpd	$1, %ymm11, %ymm3, %ymm3
	vblendpd	$1, %ymm10, %ymm2, %ymm2
	jmp	.L32
	.p2align 4,,10
	.p2align 3
.L63:
	vmovapd	%xmm2, %xmm3
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm1
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L62:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%ymm2, %ymm8
	vmovapd	%ymm2, %ymm9
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L66:
	vxorpd	%xmm2, %xmm2, %xmm2
	xorl	%esi, %esi
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm4
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L69:
	vmovapd	%xmm2, %xmm3
	vmovapd	%xmm2, %xmm7
	vmovapd	%xmm2, %xmm1
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L68:
	vxorpd	%xmm9, %xmm9, %xmm9
	vmovapd	%ymm9, %ymm2
	vmovapd	%ymm9, %ymm3
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L99:
	testl	%r14d, %r14d
	jle	.L3
.L57:
	testl	%ebx, %ebx
	leal	3(%rbx), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	-80(%rbp), %r9
	cmovns	%ebx, %r8d
	vcmppd	$0, %ymm0, %ymm0, %ymm10
	movq	-144(%rbp), %rsi
	andl	$-4, %r8d
	leal	-1(%r8), %eax
	vmovapd	%ymm10, %ymm11
	shrl	$2, %eax
	movl	%eax, %edx
	leal	4(,%rax,4), %r10d
	leaq	(%rdx,%rdx,4), %rdx
	salq	$5, %rdx
	leaq	192(%r12,%rdx), %rdi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L56:
	vmovsd	(%rsi), %xmm6
	vmovsd	8(%rsi), %xmm7
	vmovsd	%xmm6, -72(%rbp)
	vbroadcastsd	%xmm6, %ymm10
	vmovsd	16(%rsi), %xmm6
	vbroadcastsd	%xmm7, %ymm13
	vmovsd	%xmm7, -112(%rbp)
	vmovsd	%xmm6, -144(%rbp)
	vbroadcastsd	%xmm6, %ymm14
	testl	%r8d, %r8d
	jle	.L70
	vmovdqa	.LC16(%rip), %xmm0
	vxorpd	%xmm2, %xmm2, %xmm2
	leaq	32(%r12), %rax
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm4
	vmovdqa	%xmm0, %xmm12
	.p2align 4,,10
	.p2align 3
.L53:
	vmovapd	%ymm11, %ymm7
	vmovapd	%ymm11, %ymm5
	vmovapd	%ymm11, %ymm1
	vmovdqa	.LC5(%rip), %ymm15
	vgatherdpd	%ymm7, (%rax,%xmm12,8), %ymm0
	vmovapd	%ymm11, %ymm7
	vmovapd	.LC7(%rip), %ymm9
	vgatherdpd	%ymm7, -8(%rax,%xmm12,8), %ymm8
	vgatherdpd	%ymm5, -32(%rax,%xmm12,8), %ymm7
	vmovapd	%ymm11, %ymm5
	vgatherdpd	%ymm5, -24(%rax,%xmm12,8), %ymm6
	vsubpd	%ymm7, %ymm10, %ymm7
	vgatherdpd	%ymm1, -16(%rax,%xmm12,8), %ymm5
	addq	$160, %rax
	vsubpd	%ymm6, %ymm13, %ymm6
	vsubpd	%ymm5, %ymm14, %ymm5
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vpsrlvq	.LC4(%rip), %ymm0, %ymm1
	vpsubq	%ymm1, %ymm15, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vfnmadd213pd	.LC6(%rip), %ymm1, %ymm0
	vfmadd213pd	.LC8(%rip), %ymm0, %ymm9
	vmulpd	%ymm9, %ymm0, %ymm0
	vfmadd132pd	%ymm1, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm9
	vmulpd	%ymm0, %ymm8, %ymm0
	vmulpd	%ymm0, %ymm9, %ymm0
	vfmadd231pd	%ymm7, %ymm0, %ymm4
	vfmadd231pd	%ymm6, %ymm0, %ymm3
	vfmadd231pd	%ymm5, %ymm0, %ymm2
	cmpq	%rax, %rdi
	jne	.L53
	movl	%r10d, %ecx
.L52:
	cmpl	%ecx, %ebx
	jg	.L108
.L54:
	vunpckhpd	%ymm4, %ymm4, %ymm0
	addl	$1, %edx
	addq	$24, %rsi
	addq	$24, %r9
	vaddpd	%ymm0, %ymm4, %ymm4
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%ymm0, %ymm4, %ymm4
	vunpckhpd	%ymm3, %ymm3, %ymm0
	vaddsd	-24(%r9), %xmm4, %xmm4
	vaddpd	%ymm0, %ymm3, %ymm3
	vmovsd	%xmm4, -24(%r9)
	vextractf128	$0x1, %ymm3, %xmm0
	vaddpd	%ymm0, %ymm3, %ymm3
	vunpckhpd	%ymm2, %ymm2, %ymm0
	vaddsd	-16(%r9), %xmm3, %xmm3
	vaddpd	%ymm0, %ymm2, %ymm2
	vmovsd	%xmm3, -16(%r9)
	vextractf128	$0x1, %ymm2, %xmm0
	vaddpd	%ymm0, %ymm2, %ymm2
	vaddsd	-8(%r9), %xmm2, %xmm2
	vmovsd	%xmm2, -8(%r9)
	cmpl	%edx, %r14d
	jg	.L56
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L108:
	leal	-1(%rbx), %r11d
	vmovapd	%ymm2, %ymm8
	vmovapd	%ymm3, %ymm9
	movslq	%ecx, %r13
	movl	%r11d, %r15d
	vmovsd	-144(%rbp), %xmm12
	leaq	0(%r13,%r13,4), %rax
	vmovapd	%ymm3, -144(%rbp)
	subl	%ecx, %r15d
	vmovsd	-112(%rbp), %xmm3
	leaq	(%r12,%rax,8), %rax
	vmovapd	%ymm4, %ymm10
	movq	%r15, %rcx
	vmovapd	%ymm2, -112(%rbp)
	vmovapd	.LC7(%rip), %ymm14
	vmovapd	.LC8(%rip), %ymm13
	addq	%r13, %rcx
	vmovsd	-72(%rbp), %xmm2
	leaq	(%rcx,%rcx,4), %rcx
	leaq	40(%r12,%rcx,8), %rcx
	.p2align 4,,10
	.p2align 3
.L55:
	vsubsd	(%rax), %xmm2, %xmm7
	vbroadcastsd	32(%rax), %ymm1
	addq	$40, %rax
	vsubsd	-32(%rax), %xmm3, %xmm6
	vsubsd	-24(%rax), %xmm12, %xmm5
	vmovdqa	.LC5(%rip), %ymm15
	vbroadcastsd	%xmm7, %ymm7
	vfmadd231pd	%ymm7, %ymm7, %ymm1
	vbroadcastsd	%xmm6, %ymm6
	vbroadcastsd	%xmm5, %ymm5
	vfmadd231pd	%ymm6, %ymm6, %ymm1
	vfmadd231pd	%ymm5, %ymm5, %ymm1
	vpsrlvq	.LC4(%rip), %ymm1, %ymm0
	vpsubq	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm1
	vfnmadd213pd	.LC6(%rip), %ymm0, %ymm1
	vmovapd	%ymm1, %ymm15
	vfmadd132pd	%ymm14, %ymm13, %ymm15
	vmulpd	%ymm15, %ymm1, %ymm1
	vbroadcastsd	-16(%rax), %ymm15
	vfmadd132pd	%ymm1, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm0
	vfmadd231pd	%ymm7, %ymm0, %ymm10
	vfmadd231pd	%ymm6, %ymm0, %ymm9
	vfmadd231pd	%ymm5, %ymm0, %ymm8
	cmpq	%rax, %rcx
	jne	.L55
	vmovapd	-144(%rbp), %ymm3
	vmovapd	-112(%rbp), %ymm2
	vblendpd	$1, %ymm10, %ymm4, %ymm4
	vblendpd	$1, %ymm9, %ymm3, %ymm3
	vblendpd	$1, %ymm8, %ymm2, %ymm2
	jmp	.L54
	.p2align 4,,10
	.p2align 3
.L70:
	vxorpd	%xmm2, %xmm2, %xmm2
	xorl	%ecx, %ecx
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm4
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L91:
	vmovsd	%xmm0, -160(%rbp)
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%rdi, -72(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-72(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L26
	call	*%rax
	movsbl	%al, %esi
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L35:
	movq	%rdi, -112(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-112(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L36
	call	*%rax
	movsbl	%al, %esi
	jmp	.L36
.L106:
	xorl	%esi, %esi
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L29:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -176(%rbp)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L101:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -72(%rbp)
	testl	%r15d, %r15d
	jg	.L14
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L102:
	xorl	%ecx, %ecx
	leal	-1(%rbx), %r9d
	leaq	40(%r12), %r8
	jmp	.L13
	.p2align 4,,10
	.p2align 3
.L103:
	vzeroupper
	jmp	.L15
.L104:
	movq	%rsi, -264(%rbp)
	movq	%rdx, -256(%rbp)
	movq	%rax, -248(%rbp)
	movl	%ecx, -240(%rbp)
	vmovsd	%xmm2, -272(%rbp)
	vmovsd	%xmm3, -232(%rbp)
	vmovsd	%xmm1, -224(%rbp)
	vmovsd	%xmm13, -216(%rbp)
	vmovsd	%xmm4, -208(%rbp)
	vmovsd	%xmm5, -200(%rbp)
	vmovsd	%xmm6, -192(%rbp)
	vmovsd	%xmm12, -184(%rbp)
	vmovsd	%xmm11, -176(%rbp)
	vmovsd	%xmm10, -168(%rbp)
	vmovsd	%xmm8, -160(%rbp)
	vmovsd	%xmm7, -112(%rbp)
	call	sqrt@PLT
	movq	.LC9(%rip), %rdi
	vmovsd	-272(%rbp), %xmm2
	movq	-264(%rbp), %rsi
	movq	-256(%rbp), %rdx
	movq	-248(%rbp), %rax
	movl	-240(%rbp), %ecx
	vmovq	%rdi, %xmm9
	vmovsd	-232(%rbp), %xmm3
	vmovsd	-224(%rbp), %xmm1
	vmovsd	-216(%rbp), %xmm13
	vmovsd	-208(%rbp), %xmm4
	vmovsd	-200(%rbp), %xmm5
	vmovsd	-192(%rbp), %xmm6
	vmovsd	-184(%rbp), %xmm12
	vmovsd	-176(%rbp), %xmm11
	vmovsd	-168(%rbp), %xmm10
	vmovsd	-160(%rbp), %xmm8
	vmovsd	-112(%rbp), %xmm7
	jmp	.L21
.L107:
	movq	%rcx, -248(%rbp)
	movq	%rdx, -240(%rbp)
	movq	%rax, -232(%rbp)
	movq	%rsi, -224(%rbp)
	vmovsd	%xmm2, -256(%rbp)
	vmovsd	%xmm3, -216(%rbp)
	vmovsd	%xmm7, -208(%rbp)
	vmovsd	%xmm13, -200(%rbp)
	vmovsd	%xmm4, -192(%rbp)
	vmovsd	%xmm5, -184(%rbp)
	vmovsd	%xmm6, -176(%rbp)
	vmovsd	%xmm12, -168(%rbp)
	vmovsd	%xmm10, -160(%rbp)
	vmovsd	%xmm9, -152(%rbp)
	vmovsd	%xmm8, -112(%rbp)
	vmovsd	%xmm1, -72(%rbp)
	vzeroupper
	call	sqrt@PLT
	movq	.LC9(%rip), %rdi
	vmovsd	-256(%rbp), %xmm2
	movq	-248(%rbp), %rcx
	movq	-240(%rbp), %rdx
	movq	-232(%rbp), %rax
	movq	-224(%rbp), %rsi
	vmovq	%rdi, %xmm11
	vmovsd	-216(%rbp), %xmm3
	vmovsd	-208(%rbp), %xmm7
	vmovsd	-200(%rbp), %xmm13
	vmovsd	-192(%rbp), %xmm4
	vmovsd	-184(%rbp), %xmm5
	vmovsd	-176(%rbp), %xmm6
	vmovsd	-168(%rbp), %xmm12
	vmovsd	-160(%rbp), %xmm10
	vmovsd	-152(%rbp), %xmm9
	vmovsd	-112(%rbp), %xmm8
	vmovsd	-72(%rbp), %xmm1
	jmp	.L47
.L24:
	call	_ZSt16__throw_bad_castv@PLT
.L100:
	call	__stack_chk_fail@PLT
.L10:
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE8067:
	.size	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi, .-_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	.section	.text.unlikely,"ax",@progbits
.LCOLDB17:
	.section	.text.startup,"ax",@progbits
.LHOTB17:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8145:
	.cfi_startproc
	endbr64
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	xorl	%edi, %edi
	movabsq	$384307168202282325, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$16, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	movq	%rsp, %rsi
	leaq	_ZSt3cin(%rip), %rdi
	movl	$0, (%rsp)
	call	_ZNSirsERi@PLT
	movslq	(%rsp), %rbx
	cmpq	%r14, %rbx
	ja	.L110
	leaq	(%rbx,%rbx,2), %rdi
	salq	$3, %rdi
	call	_Znam@PLT
	leaq	(%rbx,%rbx,4), %rdi
	salq	$3, %rdi
	movq	%rax, %rbp
	call	_Znam@PLT
	movq	%rax, %r13
	movslq	(%rsp), %rax
	cmpq	%r14, %rax
	ja	.L110
	leaq	(%rax,%rax,2), %rdi
	salq	$3, %rdi
	call	_Znam@PLT
	leaq	4(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 72
	movl	%ebx, %edx
	movq	%rax, %r9
	movl	%ebx, %r8d
	movq	%r13, %rcx
	movq	%rbp, %rsi
	movl	$0, 12(%rsp)
	pushq	$1
	.cfi_def_cfa_offset 80
	call	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	popq	%rax
	.cfi_def_cfa_offset 72
	popq	%rdx
	.cfi_def_cfa_offset 64
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L114
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	xorl	%eax, %eax
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
.L114:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB8145:
.L110:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -48
	.cfi_offset 6, -40
	.cfi_offset 12, -32
	.cfi_offset 13, -24
	.cfi_offset 14, -16
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE8145:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE17:
	.section	.text.startup
.LHOTE17:
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB8709:
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
.LFE8709:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	4294967295
	.long	2146435071
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC4:
	.quad	1
	.quad	1
	.quad	1
	.quad	1
	.align 32
.LC5:
	.quad	6910469410427058089
	.quad	6910469410427058089
	.quad	6910469410427058089
	.quad	6910469410427058089
	.align 32
.LC6:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC7:
	.long	0
	.long	1071120384
	.long	0
	.long	1071120384
	.long	0
	.long	1071120384
	.long	0
	.long	1071120384
	.align 32
.LC8:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.section	.rodata.cst8
	.align 8
.LC9:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC15:
	.quad	12884901888
	.quad	38654705670
	.align 16
.LC16:
	.quad	21474836480
	.quad	64424509450
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
