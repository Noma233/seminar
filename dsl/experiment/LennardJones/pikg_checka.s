	.file	"pikg_check.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB6855:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE6855:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.rodata._ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi.str1.1,"aMS",@progbits,1
.LC2:
	.string	"ni: "
.LC3:
	.string	" nj:"
.LC14:
	.string	"kerel 1: "
.LC15:
	.string	" ns"
.LC16:
	.string	"kerel 2: "
	.section	.text._ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi,"axG",@progbits,_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi,comdat
	.align 2
	.p2align 4
	.weak	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	.type	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi, @function
_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi:
.LFB8307:
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
	pushq	%r13
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	movl	%edx, %r13d
	pushq	%r12
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rcx, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movl	%r8d, %ebx
	subq	$288, %rsp
	movq	%r9, -72(%rbp)
	movl	(%r10), %eax
	movq	%rdi, -240(%rbp)
	movq	%rsi, -208(%rbp)
	movq	%fs:40, %rcx
	movq	%rcx, -56(%rbp)
	xorl	%ecx, %ecx
	testl	%eax, %eax
	js	.L98
	movl	%eax, (%rdi)
	testl	%eax, %eax
	je	.L99
.L6:
	cmpl	$1, %eax
	je	.L100
.L40:
	cmpl	$2, %eax
	je	.L101
.L3:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L102
	addq	$288, %rsp
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
.L98:
	.cfi_restore_state
	movl	(%rdi), %eax
	testl	%eax, %eax
	jne	.L6
.L99:
	movl	$4, %edx
	leaq	.LC2(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movl	$4, %edx
	leaq	.LC3(%rip), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	%r14, %rdi
	movl	%ebx, %esi
	call	_ZNSolsEi@PLT
	movq	%rax, %r14
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r14,%rax), %r15
	testq	%r15, %r15
	je	.L25
	cmpb	$0, 56(%r15)
	je	.L8
	movsbl	67(%r15), %esi
.L9:
	movq	%r14, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movslq	%r13d, %rdi
	movabsq	$288230376151711743, %rax
	cmpq	%rax, %rdi
	ja	.L10
	salq	$5, %rdi
	call	_Znam@PLT
	testl	%r13d, %r13d
	leal	3(%r13), %edx
	cmovns	%r13d, %edx
	movq	%rax, %r14
	andl	$-4, %edx
	movl	%edx, %r15d
	testl	%r13d, %r13d
	jle	.L103
	leal	-1(%r13), %edx
	movq	-72(%rbp), %rsi
	movq	%rax, %rdi
	addq	$1, %rdx
	salq	$5, %rdx
	call	memcpy@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -80(%rbp)
	testl	%r15d, %r15d
	jle	.L104
.L14:
	vxorpd	%xmm3, %xmm3, %xmm3
	leal	-1(%rbx), %edx
	movq	-208(%rbp), %rsi
	xorl	%edi, %edi
	vcmppd	$0, %ymm3, %ymm3, %ymm3
	movq	%rdx, %r11
	salq	$5, %rdx
	vmovdqa	.LC19(%rip), %xmm12
	vmovdqa	.LC20(%rip), %xmm7
	movq	%r14, %rax
	leaq	32(%r12,%rdx), %r8
	.p2align 4,,10
	.p2align 3
.L19:
	vmovapd	%ymm3, %ymm6
	vgatherdpd	%ymm6, (%rsi,%xmm12,8), %ymm11
	vmovapd	%ymm3, %ymm6
	vgatherdpd	%ymm6, 8(%rsi,%xmm12,8), %ymm13
	vmovapd	%ymm3, %ymm6
	vgatherdpd	%ymm6, 16(%rsi,%xmm12,8), %ymm14
	testl	%ebx, %ebx
	jle	.L62
	vxorpd	%xmm6, %xmm6, %xmm6
	movq	%r12, %rdx
	vmovapd	%ymm6, %ymm8
	vmovapd	%ymm6, %ymm9
	vmovapd	%ymm6, %ymm10
	.p2align 4,,10
	.p2align 3
.L17:
	vbroadcastsd	(%rdx), %ymm5
	vbroadcastsd	24(%rdx), %ymm0
	addq	$32, %rdx
	vbroadcastsd	-24(%rdx), %ymm4
	vbroadcastsd	-16(%rdx), %ymm2
	vsubpd	%ymm5, %ymm11, %ymm5
	vsubpd	%ymm4, %ymm13, %ymm4
	vsubpd	%ymm2, %ymm14, %ymm2
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vdivpd	%ymm0, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm15
	vmulpd	%ymm15, %ymm1, %ymm15
	vmulpd	%ymm0, %ymm15, %ymm0
	vfmadd231pd	%ymm5, %ymm0, %ymm10
	vfmadd231pd	%ymm4, %ymm0, %ymm9
	vfmadd231pd	%ymm2, %ymm0, %ymm8
	vmulpd	.LC7(%rip), %ymm1, %ymm0
	vaddpd	.LC8(%rip), %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	cmpq	%r8, %rdx
	jne	.L17
.L16:
	vmovapd	%ymm3, %ymm5
	addl	$4, %edi
	addq	$96, %rsi
	vgatherdpd	%ymm5, (%rax,%xmm7,8), %ymm0
	vmovapd	%ymm3, %ymm5
	vaddpd	%ymm10, %ymm0, %ymm10
	vmovlpd	%xmm10, (%rax)
	vmovhpd	%xmm10, 32(%rax)
	vextractf128	$0x1, %ymm10, %xmm10
	vmovlpd	%xmm10, 64(%rax)
	vmovhpd	%xmm10, 96(%rax)
	vgatherdpd	%ymm5, 8(%rax,%xmm7,8), %ymm0
	vmovapd	%ymm3, %ymm5
	vaddpd	%ymm9, %ymm0, %ymm9
	vmovlpd	%xmm9, 8(%rax)
	vmovhpd	%xmm9, 40(%rax)
	vextractf128	$0x1, %ymm9, %xmm9
	vmovlpd	%xmm9, 72(%rax)
	vmovhpd	%xmm9, 104(%rax)
	vgatherdpd	%ymm5, 16(%rax,%xmm7,8), %ymm0
	vmovapd	%ymm3, %ymm5
	vaddpd	%ymm8, %ymm0, %ymm8
	vmovlpd	%xmm8, 16(%rax)
	vmovhpd	%xmm8, 48(%rax)
	vextractf128	$0x1, %ymm8, %xmm8
	vmovlpd	%xmm8, 80(%rax)
	vmovhpd	%xmm8, 112(%rax)
	vgatherdpd	%ymm5, 24(%rax,%xmm7,8), %ymm0
	subq	$-128, %rax
	vaddpd	%ymm6, %ymm0, %ymm6
	vmovlpd	%xmm6, -104(%rax)
	vmovhpd	%xmm6, -72(%rax)
	vextractf128	$0x1, %ymm6, %xmm6
	vmovlpd	%xmm6, -40(%rax)
	vmovhpd	%xmm6, -8(%rax)
	cmpl	%r15d, %edi
	jl	.L19
	testl	%r15d, %r15d
	movl	$4, %edx
	cmovg	%r15d, %edx
	cmpl	%edx, %r13d
	jle	.L96
.L13:
	movl	%ebx, %r9d
	movslq	%edx, %rax
	movq	-208(%rbp), %rdi
	movl	%ebx, %r10d
	shrl	$2, %r9d
	leaq	(%rax,%rax,2), %rcx
	salq	$5, %rax
	andl	$-4, %r10d
	salq	$7, %r9
	leaq	(%rdi,%rcx,8), %rcx
	vxorpd	%xmm13, %xmm13, %xmm13
	addq	%r14, %rax
	vmovsd	.LC10(%rip), %xmm14
	addq	%r12, %r9
	.p2align 4,,10
	.p2align 3
.L24:
	vmovsd	(%rcx), %xmm15
	vmovsd	8(%rcx), %xmm12
	vmovsd	16(%rcx), %xmm11
	testl	%ebx, %ebx
	jle	.L63
	cmpl	$2, %r11d
	jbe	.L64
	vbroadcastsd	%xmm15, %ymm6
	vmovapd	%xmm13, %xmm2
	vmovapd	%xmm13, %xmm0
	movq	%r12, %rsi
	vbroadcastsd	%xmm11, %ymm7
	vmovapd	%ymm6, -176(%rbp)
	vbroadcastsd	%xmm12, %ymm6
	vmovapd	%ymm6, -144(%rbp)
	vmovapd	%xmm13, %xmm6
	vmovapd	%ymm7, -112(%rbp)
	vmovapd	%xmm13, %xmm7
	.p2align 4,,10
	.p2align 3
.L22:
	vmovupd	(%rsi), %xmm5
	vinsertf128	$0x1, 16(%rsi), %ymm5, %ymm8
	subq	$-128, %rsi
	vmovupd	-96(%rsi), %xmm5
	vinsertf128	$0x1, -80(%rsi), %ymm5, %ymm4
	vmovupd	-64(%rsi), %xmm5
	vinsertf128	$0x1, -48(%rsi), %ymm5, %ymm9
	vmovupd	-32(%rsi), %xmm5
	vinsertf128	$0x1, -16(%rsi), %ymm5, %ymm3
	vunpcklpd	%ymm4, %ymm8, %ymm5
	vunpckhpd	%ymm4, %ymm8, %ymm8
	vpermpd	$216, %ymm5, %ymm5
	vpermpd	$216, %ymm8, %ymm8
	vmovapd	-144(%rbp), %ymm10
	vunpcklpd	%ymm3, %ymm9, %ymm1
	vunpckhpd	%ymm3, %ymm9, %ymm9
	vmovapd	-176(%rbp), %ymm3
	vpermpd	$216, %ymm1, %ymm1
	vpermpd	$216, %ymm9, %ymm9
	vunpcklpd	%ymm1, %ymm5, %ymm4
	vunpckhpd	%ymm1, %ymm5, %ymm5
	vmovapd	-112(%rbp), %ymm1
	vpermpd	$216, %ymm4, %ymm4
	vpermpd	$216, %ymm5, %ymm5
	vsubpd	%ymm4, %ymm3, %ymm4
	vsubpd	%ymm5, %ymm1, %ymm5
	vunpckhpd	%ymm9, %ymm8, %ymm1
	vpermpd	$216, %ymm1, %ymm1
	vunpcklpd	%ymm9, %ymm8, %ymm3
	vpermpd	$216, %ymm3, %ymm3
	vfmadd231pd	%ymm4, %ymm4, %ymm1
	vsubpd	%ymm3, %ymm10, %ymm3
	vmovapd	.LC4(%rip), %ymm10
	vfmadd231pd	%ymm3, %ymm3, %ymm1
	vfmadd231pd	%ymm5, %ymm5, %ymm1
	vdivpd	%ymm1, %ymm10, %ymm9
	vmovapd	.LC5(%rip), %ymm1
	vmulpd	%ymm9, %ymm9, %ymm8
	vmulpd	%ymm9, %ymm8, %ymm8
	vfmadd213pd	.LC9(%rip), %ymm8, %ymm1
	vmulpd	%ymm8, %ymm1, %ymm1
	vmulpd	%ymm9, %ymm1, %ymm1
	vmulpd	%ymm4, %ymm1, %ymm4
	vmulpd	%ymm3, %ymm1, %ymm3
	vmulpd	%ymm5, %ymm1, %ymm1
	vaddsd	%xmm4, %xmm0, %xmm0
	vunpckhpd	%xmm4, %xmm4, %xmm9
	vextractf128	$0x1, %ymm4, %xmm4
	vaddsd	%xmm3, %xmm6, %xmm6
	vaddsd	%xmm1, %xmm2, %xmm2
	vaddsd	%xmm0, %xmm9, %xmm0
	vaddsd	%xmm0, %xmm4, %xmm0
	vunpckhpd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm0, %xmm0
	vunpckhpd	%xmm3, %xmm3, %xmm4
	vextractf128	$0x1, %ymm3, %xmm3
	vaddsd	%xmm6, %xmm4, %xmm6
	vaddsd	%xmm6, %xmm3, %xmm6
	vunpckhpd	%xmm3, %xmm3, %xmm3
	vaddsd	%xmm3, %xmm6, %xmm6
	vunpckhpd	%xmm1, %xmm1, %xmm3
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm2, %xmm3, %xmm2
	vaddsd	%xmm2, %xmm1, %xmm2
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm2, %xmm2
	vaddpd	.LC8(%rip), %ymm8, %ymm1
	vmulpd	.LC7(%rip), %ymm8, %ymm8
	vmulpd	%ymm8, %ymm1, %ymm8
	vaddsd	%xmm8, %xmm7, %xmm7
	vunpckhpd	%xmm8, %xmm8, %xmm1
	vextractf128	$0x1, %ymm8, %xmm8
	vaddsd	%xmm7, %xmm1, %xmm7
	vaddsd	%xmm7, %xmm8, %xmm7
	vunpckhpd	%xmm8, %xmm8, %xmm8
	vaddsd	%xmm8, %xmm7, %xmm7
	cmpq	%r9, %rsi
	jne	.L22
	movl	%r10d, %esi
	cmpl	%ebx, %r10d
	je	.L20
.L21:
	movslq	%esi, %rdi
	vmovsd	.LC11(%rip), %xmm4
	salq	$5, %rdi
	leaq	(%r12,%rdi), %r8
	vsubsd	(%r8), %xmm15, %xmm9
	vsubsd	8(%r8), %xmm12, %xmm8
	vsubsd	16(%r8), %xmm11, %xmm5
	vmovapd	%xmm9, %xmm1
	vfmadd213sd	24(%r8), %xmm9, %xmm1
	leal	1(%rsi), %r8d
	vfmadd231sd	%xmm8, %xmm8, %xmm1
	vfmadd231sd	%xmm5, %xmm5, %xmm1
	vdivsd	%xmm1, %xmm14, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vfmadd213sd	.LC12(%rip), %xmm3, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vfmadd231sd	%xmm9, %xmm1, %xmm0
	vfmadd231sd	%xmm8, %xmm1, %xmm6
	vfmadd231sd	%xmm5, %xmm1, %xmm2
	vsubsd	%xmm14, %xmm3, %xmm1
	vmulsd	.LC13(%rip), %xmm3, %xmm3
	vfmadd231sd	%xmm3, %xmm1, %xmm7
	cmpl	%r8d, %ebx
	jle	.L20
	leaq	32(%r12,%rdi), %r8
	vmovsd	.LC11(%rip), %xmm4
	addl	$2, %esi
	vsubsd	(%r8), %xmm15, %xmm9
	vsubsd	8(%r8), %xmm12, %xmm8
	vsubsd	16(%r8), %xmm11, %xmm5
	vmovapd	%xmm9, %xmm1
	vfmadd213sd	24(%r8), %xmm9, %xmm1
	vfmadd231sd	%xmm8, %xmm8, %xmm1
	vfmadd231sd	%xmm5, %xmm5, %xmm1
	vdivsd	%xmm1, %xmm14, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vfmadd213sd	.LC12(%rip), %xmm3, %xmm4
	vmulsd	%xmm3, %xmm4, %xmm4
	vmulsd	%xmm1, %xmm4, %xmm1
	vfmadd231sd	%xmm9, %xmm1, %xmm0
	vfmadd231sd	%xmm8, %xmm1, %xmm6
	vfmadd231sd	%xmm5, %xmm1, %xmm2
	vsubsd	%xmm14, %xmm3, %xmm1
	vmulsd	.LC13(%rip), %xmm3, %xmm3
	vfmadd231sd	%xmm3, %xmm1, %xmm7
	cmpl	%esi, %ebx
	jle	.L20
	leaq	64(%r12,%rdi), %rsi
	vmovsd	.LC11(%rip), %xmm9
	vsubsd	(%rsi), %xmm15, %xmm4
	vsubsd	8(%rsi), %xmm12, %xmm5
	vsubsd	16(%rsi), %xmm11, %xmm8
	vmovapd	%xmm4, %xmm1
	vfmadd213sd	24(%rsi), %xmm4, %xmm1
	vfmadd231sd	%xmm5, %xmm5, %xmm1
	vfmadd231sd	%xmm8, %xmm8, %xmm1
	vdivsd	%xmm1, %xmm14, %xmm1
	vmulsd	%xmm1, %xmm1, %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vfmadd213sd	.LC12(%rip), %xmm3, %xmm9
	vmulsd	%xmm3, %xmm9, %xmm9
	vmulsd	%xmm1, %xmm9, %xmm1
	vfmadd231sd	%xmm4, %xmm1, %xmm0
	vfmadd231sd	%xmm5, %xmm1, %xmm6
	vfmadd231sd	%xmm8, %xmm1, %xmm2
	vsubsd	%xmm14, %xmm3, %xmm1
	vmulsd	.LC13(%rip), %xmm3, %xmm3
	vfmadd231sd	%xmm3, %xmm1, %xmm7
.L20:
	vmovupd	(%rax), %xmm5
	vunpcklpd	%xmm7, %xmm2, %xmm2
	vunpcklpd	%xmm6, %xmm0, %xmm0
	addl	$1, %edx
	vinsertf128	$0x1, 16(%rax), %ymm5, %ymm1
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	addq	$24, %rcx
	addq	$32, %rax
	vaddpd	%ymm0, %ymm1, %ymm0
	vmovups	%xmm0, -32(%rax)
	vextractf128	$0x1, %ymm0, -16(%rax)
	cmpl	%edx, %r13d
	jg	.L24
.L96:
	vzeroupper
.L15:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	subq	-80(%rbp), %rax
	movl	$9, %edx
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	leaq	.LC14(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	vmovsd	%xmm0, -176(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-176(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L25
	cmpb	$0, 56(%rdi)
	je	.L26
	movsbl	67(%rdi), %esi
.L27:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	.LC1(%rip), %xmm0
	vcomisd	-176(%rbp), %xmm0
	jbe	.L93
	movq	-240(%rbp), %rax
	movl	$1, (%rax)
.L28:
	testl	%r13d, %r13d
	jle	.L30
	leal	-1(%r13), %r8d
	movq	-72(%rbp), %rsi
	movq	%r14, %rdi
	addq	$1, %r8
	movq	%r8, %r15
	salq	$5, %r15
	movq	%r15, %rdx
	call	memcpy@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	testl	%ebx, %ebx
	leal	3(%rbx), %r9d
	vxorpd	%xmm0, %xmm0, %xmm0
	cmovns	%ebx, %r9d
	vcmppd	$0, %ymm0, %ymm0, %ymm10
	leaq	(%r15,%r14), %r8
	movq	%r14, %rdx
	movq	%rax, -312(%rbp)
	movq	-208(%rbp), %rcx
	andl	$-4, %r9d
	leal	-1(%r9), %eax
	vmovapd	%ymm10, %ymm14
	shrl	$2, %eax
	movl	%eax, %esi
	leal	4(,%rax,4), %r11d
	salq	$7, %rsi
	leaq	152(%r12,%rsi), %r10
	.p2align 4,,10
	.p2align 3
.L35:
	vmovsd	8(%rcx), %xmm7
	vmovsd	(%rcx), %xmm15
	vmovsd	%xmm7, -112(%rbp)
	vbroadcastsd	%xmm7, %ymm11
	vmovsd	16(%rcx), %xmm7
	vbroadcastsd	%xmm15, %ymm10
	vmovsd	%xmm7, -144(%rbp)
	vbroadcastsd	%xmm7, %ymm12
	testl	%r9d, %r9d
	jle	.L67
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovdqa	.LC20(%rip), %xmm13
	leaq	24(%r12), %rax
	vmovapd	%ymm3, %ymm4
	vmovapd	%ymm3, %ymm5
	vmovapd	%ymm3, %ymm6
	.p2align 4,,10
	.p2align 3
.L32:
	vmovapd	%ymm14, %ymm7
	vmovapd	%ymm14, %ymm2
	vmovapd	%ymm14, %ymm1
	vmovapd	.LC5(%rip), %ymm9
	vgatherdpd	%ymm7, (%rax,%xmm13,8), %ymm0
	vmovapd	%ymm14, %ymm7
	vgatherdpd	%ymm7, -24(%rax,%xmm13,8), %ymm8
	vgatherdpd	%ymm2, -16(%rax,%xmm13,8), %ymm7
	vgatherdpd	%ymm1, -8(%rax,%xmm13,8), %ymm2
	subq	$-128, %rax
	vsubpd	%ymm8, %ymm10, %ymm8
	vsubpd	%ymm7, %ymm11, %ymm7
	vmovapd	.LC4(%rip), %ymm1
	vsubpd	%ymm2, %ymm12, %ymm2
	vfmadd231pd	%ymm8, %ymm8, %ymm0
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vdivpd	%ymm0, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm9
	vmulpd	%ymm9, %ymm1, %ymm9
	vmulpd	%ymm0, %ymm9, %ymm0
	vfmadd231pd	%ymm8, %ymm0, %ymm6
	vfmadd231pd	%ymm7, %ymm0, %ymm5
	vfmadd231pd	%ymm2, %ymm0, %ymm4
	vmulpd	.LC7(%rip), %ymm1, %ymm0
	vaddpd	.LC8(%rip), %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm3
	cmpq	%r10, %rax
	jne	.L32
	movl	%r11d, %esi
.L31:
	cmpl	%esi, %ebx
	jg	.L105
.L33:
	vunpckhpd	%ymm6, %ymm6, %ymm0
	vunpckhpd	%ymm3, %ymm3, %ymm1
	addq	$32, %rdx
	addq	$24, %rcx
	vaddpd	%ymm0, %ymm6, %ymm6
	vunpckhpd	%ymm5, %ymm5, %ymm0
	vaddpd	%ymm1, %ymm3, %ymm3
	vaddpd	%ymm0, %ymm5, %ymm5
	vunpckhpd	%ymm4, %ymm4, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm4
	vextractf128	$0x1, %ymm6, %xmm7
	vextractf128	$0x1, %ymm3, %xmm1
	vextractf128	$0x1, %ymm5, %xmm2
	vaddpd	%ymm7, %ymm6, %ymm6
	vaddpd	%ymm1, %ymm3, %ymm3
	vmovupd	-32(%rdx), %xmm7
	vextractf128	$0x1, %ymm4, %xmm0
	vaddpd	%ymm2, %ymm5, %ymm5
	vaddpd	%ymm0, %ymm4, %ymm0
	vunpcklpd	%xmm5, %xmm6, %xmm4
	vunpcklpd	%xmm3, %xmm0, %xmm0
	vinsertf128	$0x1, %xmm0, %ymm4, %ymm4
	vinsertf128	$0x1, -16(%rdx), %ymm7, %ymm0
	vaddpd	%ymm0, %ymm4, %ymm4
	vmovups	%xmm4, -32(%rdx)
	vextractf128	$0x1, %ymm4, -16(%rdx)
	cmpq	%r8, %rdx
	jne	.L35
	vzeroupper
.L58:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	subq	-312(%rbp), %rax
	movl	$9, %edx
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	leaq	.LC16(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	vmovsd	%xmm0, -112(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-112(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC15(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L25
	cmpb	$0, 56(%rdi)
	je	.L36
	movsbl	67(%rdi), %esi
.L37:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	-176(%rbp), %xmm7
	vcomisd	-112(%rbp), %xmm7
	jbe	.L38
	movq	-240(%rbp), %rax
	movl	$2, (%rax)
.L38:
	movq	%r14, %rdi
	call	_ZdaPv@PLT
	movq	-240(%rbp), %rax
	movl	(%rax), %eax
	cmpl	$1, %eax
	jne	.L40
.L100:
	testl	%r13d, %r13d
	leal	3(%r13), %eax
	cmovns	%r13d, %eax
	andl	$-4, %eax
	movl	%eax, %r8d
	jle	.L106
	subl	$1, %r8d
	movq	-72(%rbp), %rdi
	vxorpd	%xmm9, %xmm9, %xmm9
	vmovdqa	.LC19(%rip), %xmm0
	shrl	$2, %r8d
	vcmppd	$0, %ymm9, %ymm9, %ymm9
	movq	-208(%rbp), %rcx
	vmovapd	.LC4(%rip), %ymm15
	movl	%r8d, %edx
	movq	%rdi, %rax
	vmovaps	%xmm0, -112(%rbp)
	vmovdqa	.LC20(%rip), %xmm11
	salq	$7, %rdx
	leaq	128(%rdi,%rdx), %rdi
	leal	-1(%rbx), %edx
	salq	$5, %rdx
	leaq	32(%r12,%rdx), %rsi
	.p2align 4,,10
	.p2align 3
.L45:
	vmovdqa	-112(%rbp), %xmm6
	vmovapd	%ymm9, %ymm7
	vgatherdpd	%ymm7, (%rcx,%xmm6,8), %ymm10
	vmovapd	%ymm9, %ymm7
	vgatherdpd	%ymm7, 8(%rcx,%xmm6,8), %ymm12
	vmovapd	%ymm9, %ymm7
	vgatherdpd	%ymm7, 16(%rcx,%xmm6,8), %ymm13
	testl	%ebx, %ebx
	jle	.L69
	vxorpd	%xmm2, %xmm2, %xmm2
	movq	%r12, %rdx
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm8
	vmovapd	%ymm2, %ymm4
	.p2align 4,,10
	.p2align 3
.L44:
	vbroadcastsd	(%rdx), %ymm7
	vbroadcastsd	24(%rdx), %ymm0
	addq	$32, %rdx
	vbroadcastsd	-24(%rdx), %ymm6
	vbroadcastsd	-16(%rdx), %ymm5
	vsubpd	%ymm7, %ymm10, %ymm7
	vmovapd	.LC5(%rip), %ymm14
	vsubpd	%ymm6, %ymm12, %ymm6
	vsubpd	%ymm5, %ymm13, %ymm5
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vdivpd	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm14
	vmulpd	%ymm14, %ymm1, %ymm14
	vmulpd	%ymm0, %ymm14, %ymm0
	vfmadd231pd	%ymm7, %ymm0, %ymm4
	vfmadd231pd	%ymm6, %ymm0, %ymm8
	vfmadd231pd	%ymm5, %ymm0, %ymm3
	vmulpd	.LC7(%rip), %ymm1, %ymm0
	vaddpd	.LC8(%rip), %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm2
	cmpq	%rsi, %rdx
	jne	.L44
.L43:
	vmovapd	%ymm9, %ymm6
	vmovapd	%ymm9, %ymm7
	addq	$96, %rcx
	vgatherdpd	%ymm6, (%rax,%xmm11,8), %ymm0
	vmovapd	%ymm9, %ymm6
	vaddpd	%ymm0, %ymm4, %ymm4
	vmovlpd	%xmm4, (%rax)
	vmovhpd	%xmm4, 32(%rax)
	vextractf128	$0x1, %ymm4, %xmm4
	vmovlpd	%xmm4, 64(%rax)
	vmovhpd	%xmm4, 96(%rax)
	vgatherdpd	%ymm6, 8(%rax,%xmm11,8), %ymm0
	vmovapd	%ymm9, %ymm6
	vaddpd	%ymm8, %ymm0, %ymm8
	vmovlpd	%xmm8, 8(%rax)
	vmovhpd	%xmm8, 40(%rax)
	vextractf128	$0x1, %ymm8, %xmm8
	vmovlpd	%xmm8, 72(%rax)
	vmovhpd	%xmm8, 104(%rax)
	vgatherdpd	%ymm6, 16(%rax,%xmm11,8), %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	vmovlpd	%xmm3, 16(%rax)
	vmovhpd	%xmm3, 48(%rax)
	vextractf128	$0x1, %ymm3, %xmm3
	vmovlpd	%xmm3, 80(%rax)
	vmovhpd	%xmm3, 112(%rax)
	vgatherdpd	%ymm7, 24(%rax,%xmm11,8), %ymm0
	subq	$-128, %rax
	vaddpd	%ymm0, %ymm2, %ymm2
	vmovlpd	%xmm2, -104(%rax)
	vmovhpd	%xmm2, -72(%rax)
	vextractf128	$0x1, %ymm2, %xmm2
	vmovlpd	%xmm2, -40(%rax)
	vmovhpd	%xmm2, -8(%rax)
	cmpq	%rdi, %rax
	jne	.L45
	leal	4(,%r8,4), %edi
.L46:
	cmpl	%edi, %r13d
	jle	.L97
	movslq	%edi, %rdx
	movq	-208(%rbp), %rcx
	movl	%ebx, %r8d
	movl	%ebx, %r9d
	leaq	(%rdx,%rdx,2), %rax
	movq	-72(%rbp), %r15
	shrl	$2, %r8d
	leal	-1(%rbx), %r11d
	leaq	(%rcx,%rax,8), %rsi
	leal	-1(%r13), %eax
	movq	%rdx, %rcx
	salq	$7, %r8
	subl	%edi, %eax
	salq	$5, %rcx
	addq	%r12, %r8
	andl	$-4, %r9d
	addq	%rdx, %rax
	addq	%r15, %rcx
	vxorpd	%xmm13, %xmm13, %xmm13
	salq	$5, %rax
	leaq	32(%r15,%rax), %r10
	.p2align 4,,10
	.p2align 3
.L52:
	vmovsd	8(%rsi), %xmm6
	vmovsd	16(%rsi), %xmm7
	vmovsd	(%rsi), %xmm11
	vmovsd	%xmm6, -112(%rbp)
	vmovsd	%xmm7, -144(%rbp)
	testl	%ebx, %ebx
	jle	.L70
	cmpl	$2, %r11d
	jbe	.L71
	vbroadcastsd	%xmm6, %ymm14
	vmovapd	%xmm13, %xmm5
	vmovapd	%xmm13, %xmm6
	movq	%r12, %rax
	vbroadcastsd	%xmm7, %ymm12
	vbroadcastsd	%xmm11, %ymm15
	vmovapd	%xmm13, %xmm7
	vmovapd	%xmm13, %xmm3
	.p2align 4,,10
	.p2align 3
.L49:
	vmovupd	(%rax), %xmm2
	vinsertf128	$0x1, 16(%rax), %ymm2, %ymm1
	subq	$-128, %rax
	vmovupd	-96(%rax), %xmm2
	vinsertf128	$0x1, -80(%rax), %ymm2, %ymm4
	vmovupd	-64(%rax), %xmm2
	vinsertf128	$0x1, -48(%rax), %ymm2, %ymm0
	vmovupd	-32(%rax), %xmm2
	vinsertf128	$0x1, -16(%rax), %ymm2, %ymm2
	vunpcklpd	%ymm4, %ymm1, %ymm8
	vunpckhpd	%ymm4, %ymm1, %ymm1
	vpermpd	$216, %ymm8, %ymm8
	vpermpd	$216, %ymm1, %ymm1
	vunpcklpd	%ymm2, %ymm0, %ymm9
	vunpckhpd	%ymm2, %ymm0, %ymm0
	vpermpd	$216, %ymm9, %ymm9
	vpermpd	$216, %ymm0, %ymm0
	vunpcklpd	%ymm9, %ymm8, %ymm4
	vunpcklpd	%ymm0, %ymm1, %ymm2
	vunpckhpd	%ymm0, %ymm1, %ymm0
	vmovapd	.LC4(%rip), %ymm1
	vpermpd	$216, %ymm4, %ymm4
	vpermpd	$216, %ymm0, %ymm0
	vpermpd	$216, %ymm2, %ymm2
	vsubpd	%ymm4, %ymm15, %ymm4
	vsubpd	%ymm2, %ymm14, %ymm2
	vunpckhpd	%ymm9, %ymm8, %ymm8
	vmovapd	.LC5(%rip), %ymm9
	vpermpd	$216, %ymm8, %ymm8
	vsubpd	%ymm8, %ymm12, %ymm8
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vfmadd231pd	%ymm8, %ymm8, %ymm0
	vdivpd	%ymm0, %ymm1, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmadd213pd	.LC9(%rip), %ymm1, %ymm9
	vmulpd	%ymm1, %ymm9, %ymm9
	vmulpd	%ymm0, %ymm9, %ymm0
	vmulpd	%ymm4, %ymm0, %ymm4
	vmulpd	%ymm2, %ymm0, %ymm2
	vmulpd	%ymm8, %ymm0, %ymm0
	vaddsd	%xmm4, %xmm3, %xmm3
	vunpckhpd	%xmm4, %xmm4, %xmm9
	vextractf128	$0x1, %ymm4, %xmm4
	vaddsd	%xmm2, %xmm6, %xmm6
	vaddsd	%xmm0, %xmm5, %xmm5
	vaddsd	%xmm3, %xmm9, %xmm3
	vaddsd	%xmm3, %xmm4, %xmm3
	vunpckhpd	%xmm4, %xmm4, %xmm4
	vaddsd	%xmm4, %xmm3, %xmm3
	vunpckhpd	%xmm2, %xmm2, %xmm4
	vextractf128	$0x1, %ymm2, %xmm2
	vaddsd	%xmm6, %xmm4, %xmm6
	vaddsd	%xmm6, %xmm2, %xmm6
	vunpckhpd	%xmm2, %xmm2, %xmm2
	vaddsd	%xmm2, %xmm6, %xmm6
	vunpckhpd	%xmm0, %xmm0, %xmm2
	vextractf128	$0x1, %ymm0, %xmm0
	vaddsd	%xmm5, %xmm2, %xmm5
	vaddsd	%xmm5, %xmm0, %xmm5
	vunpckhpd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm0, %xmm5, %xmm5
	vaddpd	.LC8(%rip), %ymm1, %ymm0
	vmulpd	.LC7(%rip), %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm1
	vaddsd	%xmm1, %xmm7, %xmm7
	vunpckhpd	%xmm1, %xmm1, %xmm0
	vextractf128	$0x1, %ymm1, %xmm1
	vaddsd	%xmm7, %xmm0, %xmm7
	vaddsd	%xmm7, %xmm1, %xmm7
	vunpckhpd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm7, %xmm7
	cmpq	%rax, %r8
	jne	.L49
	movl	%r9d, %edx
	cmpl	%r9d, %ebx
	je	.L47
.L48:
	movslq	%edx, %rax
	vmovsd	-112(%rbp), %xmm12
	vmovsd	-144(%rbp), %xmm15
	salq	$5, %rax
	vmovsd	.LC10(%rip), %xmm1
	vmovsd	.LC11(%rip), %xmm9
	leaq	(%r12,%rax), %rdi
	vsubsd	(%rdi), %xmm11, %xmm8
	vsubsd	8(%rdi), %xmm12, %xmm4
	vsubsd	16(%rdi), %xmm15, %xmm2
	vmovapd	%xmm8, %xmm0
	vfmadd213sd	24(%rdi), %xmm8, %xmm0
	leal	1(%rdx), %edi
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vfmadd231sd	%xmm2, %xmm2, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vfmadd213sd	.LC12(%rip), %xmm1, %xmm9
	vmulsd	%xmm9, %xmm1, %xmm9
	vmulsd	%xmm0, %xmm9, %xmm0
	vfmadd231sd	%xmm0, %xmm8, %xmm3
	vfmadd231sd	%xmm0, %xmm4, %xmm6
	vfmadd231sd	%xmm0, %xmm2, %xmm5
	vmulsd	.LC13(%rip), %xmm1, %xmm0
	vsubsd	.LC10(%rip), %xmm1, %xmm1
	vfmadd231sd	%xmm1, %xmm0, %xmm7
	cmpl	%edi, %ebx
	jle	.L47
	leaq	32(%r12,%rax), %rdi
	vmovsd	.LC10(%rip), %xmm1
	vmovsd	.LC11(%rip), %xmm9
	addl	$2, %edx
	vsubsd	(%rdi), %xmm11, %xmm8
	vsubsd	8(%rdi), %xmm12, %xmm4
	vsubsd	16(%rdi), %xmm15, %xmm2
	vmovapd	%xmm8, %xmm0
	vfmadd213sd	24(%rdi), %xmm8, %xmm0
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vfmadd231sd	%xmm2, %xmm2, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vfmadd213sd	.LC12(%rip), %xmm1, %xmm9
	vmulsd	%xmm9, %xmm1, %xmm9
	vmulsd	%xmm0, %xmm9, %xmm0
	vfmadd231sd	%xmm0, %xmm8, %xmm3
	vfmadd231sd	%xmm0, %xmm4, %xmm6
	vfmadd231sd	%xmm0, %xmm2, %xmm5
	vsubsd	.LC10(%rip), %xmm1, %xmm0
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	vfmadd231sd	%xmm1, %xmm0, %xmm7
	cmpl	%edx, %ebx
	jle	.L47
	leaq	64(%r12,%rax), %rax
	vmovsd	.LC10(%rip), %xmm2
	vsubsd	(%rax), %xmm11, %xmm11
	vsubsd	8(%rax), %xmm12, %xmm4
	vsubsd	16(%rax), %xmm15, %xmm8
	vmovapd	%xmm11, %xmm0
	vfmadd213sd	24(%rax), %xmm11, %xmm0
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vfmadd231sd	%xmm8, %xmm8, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm0
	vmovsd	.LC11(%rip), %xmm2
	vmulsd	%xmm0, %xmm0, %xmm1
	vmulsd	%xmm0, %xmm1, %xmm1
	vfmadd213sd	.LC12(%rip), %xmm1, %xmm2
	vmulsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm0
	vfmadd231sd	%xmm0, %xmm11, %xmm3
	vfmadd231sd	%xmm0, %xmm4, %xmm6
	vfmadd231sd	%xmm0, %xmm8, %xmm5
	vsubsd	.LC10(%rip), %xmm1, %xmm0
	vmulsd	.LC13(%rip), %xmm1, %xmm1
	vfmadd231sd	%xmm1, %xmm0, %xmm7
.L47:
	vmovupd	(%rcx), %xmm2
	vunpcklpd	%xmm7, %xmm5, %xmm5
	vunpcklpd	%xmm6, %xmm3, %xmm3
	addq	$32, %rcx
	vinsertf128	$0x1, -16(%rcx), %ymm2, %ymm0
	vinsertf128	$0x1, %xmm5, %ymm3, %ymm3
	addq	$24, %rsi
	vaddpd	%ymm3, %ymm0, %ymm3
	vmovups	%xmm3, -32(%rcx)
	vextractf128	$0x1, %ymm3, -16(%rcx)
	cmpq	%rcx, %r10
	jne	.L52
	jmp	.L97
	.p2align 4,,10
	.p2align 3
.L101:
	testl	%r13d, %r13d
	jle	.L3
	testl	%ebx, %ebx
	leal	3(%rbx), %ecx
	movq	-72(%rbp), %r9
	leal	-1(%r13), %eax
	cmovns	%ebx, %ecx
	salq	$5, %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	-208(%rbp), %rsi
	vcmppd	$0, %ymm0, %ymm0, %ymm12
	leaq	32(%r9,%rax), %r8
	andl	$-4, %ecx
	leal	-1(%rcx), %eax
	shrl	$2, %eax
	vmovapd	%ymm12, %ymm14
	movl	%eax, %edx
	leal	4(,%rax,4), %r10d
	salq	$7, %rdx
	leaq	152(%r12,%rdx), %rdi
	.p2align 4,,10
	.p2align 3
.L57:
	vmovsd	8(%rsi), %xmm6
	vmovsd	16(%rsi), %xmm7
	vmovsd	(%rsi), %xmm15
	vmovsd	%xmm6, -112(%rbp)
	vbroadcastsd	%xmm6, %ymm11
	vbroadcastsd	%xmm7, %ymm12
	vbroadcastsd	%xmm15, %ymm10
	vmovsd	%xmm7, -144(%rbp)
	testl	%ecx, %ecx
	jle	.L72
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovdqa	.LC20(%rip), %xmm13
	leaq	24(%r12), %rax
	vmovapd	%ymm6, %ymm7
	vmovapd	%ymm6, %ymm8
	vmovapd	%ymm6, %ymm9
	.p2align 4,,10
	.p2align 3
.L54:
	vmovapd	%ymm14, %ymm5
	vgatherdpd	%ymm5, (%rax,%xmm13,8), %ymm0
	vmovapd	%ymm14, %ymm5
	vgatherdpd	%ymm5, -24(%rax,%xmm13,8), %ymm4
	vmovapd	%ymm14, %ymm5
	vgatherdpd	%ymm5, -16(%rax,%xmm13,8), %ymm3
	vsubpd	%ymm4, %ymm10, %ymm4
	vmovapd	%ymm14, %ymm5
	vgatherdpd	%ymm5, -8(%rax,%xmm13,8), %ymm2
	vsubpd	%ymm3, %ymm11, %ymm3
	vmovapd	.LC4(%rip), %ymm5
	subq	$-128, %rax
	vsubpd	%ymm2, %ymm12, %ymm2
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vdivpd	%ymm0, %ymm5, %ymm0
	vmovapd	.LC5(%rip), %ymm5
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm5
	vmulpd	%ymm5, %ymm1, %ymm5
	vmulpd	%ymm0, %ymm5, %ymm0
	vfmadd231pd	%ymm4, %ymm0, %ymm9
	vfmadd231pd	%ymm3, %ymm0, %ymm8
	vfmadd231pd	%ymm2, %ymm0, %ymm7
	vmulpd	.LC7(%rip), %ymm1, %ymm0
	vaddpd	.LC8(%rip), %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm6
	cmpq	%rdi, %rax
	jne	.L54
	movl	%r10d, %edx
.L53:
	cmpl	%edx, %ebx
	jg	.L107
.L55:
	vunpckhpd	%ymm8, %ymm8, %ymm1
	vunpckhpd	%ymm9, %ymm9, %ymm0
	addq	$32, %r9
	addq	$24, %rsi
	vaddpd	%ymm1, %ymm8, %ymm8
	vunpckhpd	%ymm7, %ymm7, %ymm1
	vaddpd	%ymm0, %ymm9, %ymm9
	vaddpd	%ymm1, %ymm7, %ymm7
	vunpckhpd	%ymm6, %ymm6, %ymm1
	vaddpd	%ymm1, %ymm6, %ymm6
	vextractf128	$0x1, %ymm9, %xmm0
	vextractf128	$0x1, %ymm8, %xmm3
	vextractf128	$0x1, %ymm7, %xmm2
	vaddpd	%ymm0, %ymm9, %ymm9
	vaddpd	%ymm3, %ymm8, %ymm8
	vextractf128	$0x1, %ymm6, %xmm1
	vaddpd	%ymm2, %ymm7, %ymm7
	vaddpd	%ymm1, %ymm6, %ymm6
	vunpcklpd	%xmm8, %xmm9, %xmm0
	vunpcklpd	%xmm6, %xmm7, %xmm7
	vmovupd	-32(%r9), %xmm6
	vinsertf128	$0x1, -16(%r9), %ymm6, %ymm1
	vinsertf128	$0x1, %xmm7, %ymm0, %ymm0
	vaddpd	%ymm1, %ymm0, %ymm0
	vmovups	%xmm0, -32(%r9)
	vextractf128	$0x1, %ymm0, -16(%r9)
	cmpq	%r9, %r8
	jne	.L57
.L97:
	vzeroupper
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L8:
	movq	%r15, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r15), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L9
	movq	%r15, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L9
	.p2align 4,,10
	.p2align 3
.L105:
	leal	-1(%rbx), %r15d
	vmovapd	%ymm3, %ymm10
	vmovapd	%ymm4, %ymm11
	movslq	%esi, %rdi
	movq	%rdi, %rax
	vmovapd	.LC7(%rip), %ymm7
	vmovapd	.LC8(%rip), %ymm2
	vmovapd	%ymm4, -272(%rbp)
	salq	$5, %rax
	vmovapd	%ymm3, -304(%rbp)
	vmovapd	%ymm5, %ymm12
	vmovapd	%ymm6, %ymm13
	addq	%r12, %rax
	vmovapd	%ymm7, %ymm3
	vmovapd	%ymm2, %ymm4
	movq	%rax, -80(%rbp)
	movl	%r15d, %eax
	subl	%esi, %eax
	movq	%rax, %rsi
	movq	-80(%rbp), %rax
	addq	%rdi, %rsi
	salq	$5, %rsi
	leaq	32(%r12,%rsi), %rsi
	.p2align 4,,10
	.p2align 3
.L34:
	vsubsd	(%rax), %xmm15, %xmm9
	vbroadcastsd	24(%rax), %ymm0
	addq	$32, %rax
	vmovsd	-112(%rbp), %xmm7
	vsubsd	-24(%rax), %xmm7, %xmm8
	vmovsd	-144(%rbp), %xmm7
	vsubsd	-16(%rax), %xmm7, %xmm7
	vbroadcastsd	%xmm9, %ymm9
	vmovapd	.LC4(%rip), %ymm2
	vfmadd231pd	%ymm9, %ymm9, %ymm0
	vbroadcastsd	%xmm8, %ymm8
	vbroadcastsd	%xmm7, %ymm7
	vfmadd231pd	%ymm8, %ymm8, %ymm0
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vdivpd	%ymm0, %ymm2, %ymm0
	vmovapd	.LC5(%rip), %ymm2
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm2
	vmulpd	%ymm2, %ymm1, %ymm2
	vmulpd	%ymm0, %ymm2, %ymm0
	vfmadd231pd	%ymm9, %ymm0, %ymm13
	vfmadd231pd	%ymm8, %ymm0, %ymm12
	vfmadd231pd	%ymm7, %ymm0, %ymm11
	vmulpd	%ymm3, %ymm1, %ymm0
	vaddpd	%ymm4, %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm10
	cmpq	%rax, %rsi
	jne	.L34
	vmovapd	-272(%rbp), %ymm4
	vmovapd	-304(%rbp), %ymm3
	vblendpd	$1, %ymm13, %ymm6, %ymm6
	vblendpd	$1, %ymm12, %ymm5, %ymm5
	vblendpd	$1, %ymm11, %ymm4, %ymm4
	vblendpd	$1, %ymm10, %ymm3, %ymm3
	jmp	.L33
	.p2align 4,,10
	.p2align 3
.L107:
	leal	-1(%rbx), %r11d
	vmovapd	%ymm6, %ymm10
	vmovapd	%ymm7, %ymm11
	movslq	%edx, %r13
	movl	%r11d, %r15d
	vmovapd	.LC7(%rip), %ymm5
	movq	%r13, %rax
	vmovapd	.LC8(%rip), %ymm4
	subl	%edx, %r15d
	salq	$5, %rax
	vmovapd	%ymm8, %ymm12
	vmovapd	%ymm9, %ymm13
	movq	%r15, %rdx
	vmovapd	%ymm7, -240(%rbp)
	addq	%r12, %rax
	vmovsd	-144(%rbp), %xmm7
	addq	%r13, %rdx
	vmovapd	%ymm6, -144(%rbp)
	vmovsd	-112(%rbp), %xmm6
	salq	$5, %rdx
	vmovapd	%ymm9, -176(%rbp)
	vmovapd	%ymm4, %ymm9
	vmovapd	%ymm8, -208(%rbp)
	leaq	32(%r12,%rdx), %rdx
	vmovapd	%ymm5, %ymm8
	.p2align 4,,10
	.p2align 3
.L56:
	vsubsd	(%rax), %xmm15, %xmm5
	vbroadcastsd	24(%rax), %ymm0
	addq	$32, %rax
	vsubsd	-24(%rax), %xmm6, %xmm4
	vsubsd	-16(%rax), %xmm7, %xmm3
	vmovapd	.LC4(%rip), %ymm2
	vbroadcastsd	%xmm5, %ymm5
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vbroadcastsd	%xmm4, %ymm4
	vbroadcastsd	%xmm3, %ymm3
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vdivpd	%ymm0, %ymm2, %ymm0
	vmovapd	.LC5(%rip), %ymm2
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vfmsub213pd	.LC6(%rip), %ymm1, %ymm2
	vmulpd	%ymm2, %ymm1, %ymm2
	vmulpd	%ymm0, %ymm2, %ymm0
	vfmadd231pd	%ymm5, %ymm0, %ymm13
	vfmadd231pd	%ymm4, %ymm0, %ymm12
	vfmadd231pd	%ymm3, %ymm0, %ymm11
	vmulpd	%ymm8, %ymm1, %ymm0
	vaddpd	%ymm9, %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm10
	cmpq	%rax, %rdx
	jne	.L56
	vmovapd	-176(%rbp), %ymm9
	vmovapd	-208(%rbp), %ymm8
	vmovapd	-240(%rbp), %ymm7
	vmovapd	-144(%rbp), %ymm6
	vblendpd	$1, %ymm13, %ymm9, %ymm9
	vblendpd	$1, %ymm12, %ymm8, %ymm8
	vblendpd	$1, %ymm11, %ymm7, %ymm7
	vblendpd	$1, %ymm10, %ymm6, %ymm6
	jmp	.L55
	.p2align 4,,10
	.p2align 3
.L62:
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovapd	%ymm6, %ymm8
	vmovapd	%ymm6, %ymm9
	vmovapd	%ymm6, %ymm10
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L63:
	vmovapd	%xmm13, %xmm7
	vmovapd	%xmm13, %xmm2
	vmovapd	%xmm13, %xmm6
	vmovapd	%xmm13, %xmm0
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L67:
	vxorpd	%xmm3, %xmm3, %xmm3
	xorl	%esi, %esi
	vmovapd	%ymm3, %ymm4
	vmovapd	%ymm3, %ymm5
	vmovapd	%ymm3, %ymm6
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L64:
	vmovapd	%xmm13, %xmm7
	vmovapd	%xmm13, %xmm2
	vmovapd	%xmm13, %xmm6
	xorl	%esi, %esi
	vmovapd	%xmm13, %xmm0
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L70:
	vmovapd	%xmm13, %xmm7
	vmovapd	%xmm13, %xmm5
	vmovapd	%xmm13, %xmm6
	vmovapd	%xmm13, %xmm3
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L69:
	vxorpd	%xmm2, %xmm2, %xmm2
	vmovapd	%ymm2, %ymm3
	vmovapd	%ymm2, %ymm8
	vmovapd	%ymm2, %ymm4
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L72:
	vxorpd	%xmm6, %xmm6, %xmm6
	xorl	%edx, %edx
	vmovapd	%ymm6, %ymm7
	vmovapd	%ymm6, %ymm8
	vmovapd	%ymm6, %ymm9
	jmp	.L53
	.p2align 4,,10
	.p2align 3
.L93:
	vmovsd	%xmm0, -176(%rbp)
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L26:
	movq	%rdi, -112(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-112(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L27
	call	*%rax
	movsbl	%al, %esi
	jmp	.L27
	.p2align 4,,10
	.p2align 3
.L36:
	movq	%rdi, -144(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-144(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L37
	call	*%rax
	movsbl	%al, %esi
	jmp	.L37
	.p2align 4,,10
	.p2align 3
.L71:
	vmovapd	%xmm13, %xmm7
	vmovapd	%xmm13, %xmm5
	vmovapd	%xmm13, %xmm6
	xorl	%edx, %edx
	vmovapd	%xmm13, %xmm3
	jmp	.L48
.L106:
	xorl	%edi, %edi
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L30:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -312(%rbp)
	jmp	.L58
	.p2align 4,,10
	.p2align 3
.L103:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movq	%rax, -80(%rbp)
	testl	%r15d, %r15d
	jg	.L14
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L104:
	xorl	%edx, %edx
	leal	-1(%rbx), %r11d
	jmp	.L13
.L102:
	call	__stack_chk_fail@PLT
.L25:
	call	_ZSt16__throw_bad_castv@PLT
.L10:
	call	__cxa_throw_bad_array_new_length@PLT
	.cfi_endproc
.LFE8307:
	.size	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi, .-_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB8385:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	xorl	%edi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	xorl	%edi, %edi
	call	_Znam@PLT
	xorl	%edi, %edi
	movq	%rax, %rbp
	call	_Znam@PLT
	xorl	%edi, %edi
	movq	%rax, %r12
	call	_Znam@PLT
	leaq	4(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%edx, %edx
	movq	%rax, %r9
	xorl	%r8d, %r8d
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movl	$0, 12(%rsp)
	pushq	$1
	.cfi_def_cfa_offset 64
	call	_ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi
	popq	%rax
	.cfi_def_cfa_offset 56
	popq	%rdx
	.cfi_def_cfa_offset 48
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L111
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L111:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8385:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB8946:
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
.LFE8946:
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
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC5:
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.align 32
.LC6:
	.long	0
	.long	1077411840
	.long	0
	.long	1077411840
	.long	0
	.long	1077411840
	.long	0
	.long	1077411840
	.align 32
.LC7:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.align 32
.LC8:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.align 32
.LC9:
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.section	.rodata.cst8
	.align 8
.LC10:
	.long	0
	.long	1072693248
	.align 8
.LC11:
	.long	0
	.long	1078460416
	.align 8
.LC12:
	.long	0
	.long	-1070071808
	.align 8
.LC13:
	.long	0
	.long	1074790400
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC19:
	.quad	12884901888
	.quad	38654705670
	.align 16
.LC20:
	.quad	17179869184
	.quad	51539607560
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
