	.file	"test_pikg_code.cpp"
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
	.section	.text._ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE,"axG",@progbits,_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE,comdat
	.align 2
	.p2align 4
	.weak	_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE
	.type	_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE, @function
_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE:
.LFB8315:
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
	pushq	%r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	pushq	%rbx
	subq	$416, %rsp
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	leal	3(%rdx), %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	andl	$-4, %eax
	jle	.L25
	leal	-1(%rax), %r12d
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	%rsi, %r11
	movq	%r9, %rdi
	shrl	$2, %r12d
	vcmppd	$0, %ymm0, %ymm0, %ymm7
	vmovdqa	.LC5(%rip), %xmm0
	movl	%r12d, %eax
	leaq	(%rax,%rax,2), %rax
	vmovaps	%xmm0, -80(%rbp)
	salq	$6, %rax
	vmovapd	%ymm7, -336(%rbp)
	leaq	192(%r9,%rax), %rbx
	leal	-1(%r8), %eax
	salq	$6, %rax
	leaq	64(%rcx,%rax), %r10
	.p2align 4,,10
	.p2align 3
.L9:
	vmovapd	-336(%rbp), %ymm3
	vmovdqa	-80(%rbp), %xmm5
	vmovapd	%ymm3, %ymm7
	vgatherdpd	%ymm7, (%r11,%xmm5,8), %ymm6
	vmovapd	%ymm3, %ymm7
	vmovapd	%ymm6, -304(%rbp)
	vgatherdpd	%ymm7, 8(%r11,%xmm5,8), %ymm6
	vmovapd	%ymm3, %ymm7
	vmovapd	%ymm6, -272(%rbp)
	vgatherdpd	%ymm7, 16(%r11,%xmm5,8), %ymm6
	vmovapd	%ymm3, %ymm7
	vmovapd	%ymm6, -240(%rbp)
	vgatherdpd	%ymm7, 24(%r11,%xmm5,8), %ymm6
	vmovapd	%ymm3, %ymm7
	vmovapd	%ymm6, -208(%rbp)
	vgatherdpd	%ymm7, 32(%r11,%xmm5,8), %ymm6
	vmovapd	%ymm6, -176(%rbp)
	vgatherdpd	%ymm3, 40(%r11,%xmm5,8), %ymm7
	vmovapd	%ymm7, -144(%rbp)
	testl	%r8d, %r8d
	jle	.L16
	vxorpd	%xmm15, %xmm15, %xmm15
	movq	%rcx, %rax
	vmovapd	%ymm15, %ymm7
	vmovapd	%ymm15, -112(%rbp)
	vmovapd	%ymm15, %ymm10
	vmovapd	%ymm15, %ymm14
	vmovapd	%ymm15, %ymm3
	.p2align 4,,10
	.p2align 3
.L8:
	vbroadcastsd	(%rax), %ymm6
	vmovapd	-304(%rbp), %ymm5
	addq	$64, %rax
	vbroadcastsd	-8(%rax), %ymm0
	vmovapd	-272(%rbp), %ymm4
	vsubpd	%ymm6, %ymm5, %ymm6
	vbroadcastsd	-56(%rax), %ymm5
	vmovapd	-240(%rbp), %ymm2
	vbroadcastsd	-40(%rax), %ymm9
	vbroadcastsd	-32(%rax), %ymm8
	vsubpd	%ymm5, %ymm4, %ymm5
	vbroadcastsd	-48(%rax), %ymm4
	vbroadcastsd	-24(%rax), %ymm12
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vmovsd	-16(%rax), %xmm1
	vsubpd	%ymm4, %ymm2, %ymm4
	vmovapd	-208(%rbp), %ymm2
	vsubpd	%ymm9, %ymm2, %ymm9
	vmovapd	-176(%rbp), %ymm2
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vsubpd	%ymm8, %ymm2, %ymm8
	vmovapd	-144(%rbp), %ymm2
	vsubpd	%ymm12, %ymm2, %ymm12
	vmovapd	.LC1(%rip), %ymm2
	vmulpd	%ymm8, %ymm5, %ymm11
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm9, %ymm6, %ymm11
	vsqrtpd	%ymm0, %ymm0
	vfmadd231pd	%ymm12, %ymm4, %ymm11
	vdivpd	%ymm0, %ymm2, %ymm0
	vbroadcastsd	%xmm1, %ymm2
	vmulsd	.LC2(%rip), %xmm1, %xmm1
	vbroadcastsd	%xmm1, %ymm1
	vmulpd	%ymm11, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm0, %ymm13
	vmulpd	%ymm13, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm2, %ymm2
	vmulpd	%ymm0, %ymm13, %ymm0
	vfmadd231pd	%ymm9, %ymm2, %ymm10
	vfmadd231pd	%ymm8, %ymm2, %ymm7
	vmulpd	%ymm0, %ymm1, %ymm1
	vmovapd	-112(%rbp), %ymm0
	vfmadd231pd	%ymm12, %ymm2, %ymm3
	vfmadd231pd	%ymm5, %ymm2, %ymm15
	vfmadd231pd	%ymm4, %ymm2, %ymm14
	vfmadd231pd	%ymm6, %ymm2, %ymm0
	vfnmadd231pd	%ymm6, %ymm1, %ymm10
	vfnmadd231pd	%ymm5, %ymm1, %ymm7
	vfnmadd231pd	%ymm4, %ymm1, %ymm3
	vmovapd	%ymm0, -112(%rbp)
	cmpq	%rax, %r10
	jne	.L8
.L7:
	vmovapd	-336(%rbp), %ymm5
	vmovdqa	-80(%rbp), %xmm4
	addq	$192, %r11
	vmovapd	%ymm5, %ymm6
	vmovdqa	%xmm4, %xmm2
	vgatherdpd	%ymm6, (%rdi,%xmm4,8), %ymm0
	vaddpd	-112(%rbp), %ymm0, %ymm0
	vmovapd	%ymm5, %ymm6
	vmovlpd	%xmm0, (%rdi)
	vmovhpd	%xmm0, 48(%rdi)
	vextractf128	$0x1, %ymm0, %xmm0
	vmovlpd	%xmm0, 96(%rdi)
	vmovhpd	%xmm0, 144(%rdi)
	vgatherdpd	%ymm6, 8(%rdi,%xmm4,8), %ymm0
	vmovapd	%ymm5, %ymm6
	vaddpd	%ymm15, %ymm0, %ymm15
	vmovlpd	%xmm15, 8(%rdi)
	vmovhpd	%xmm15, 56(%rdi)
	vextractf128	$0x1, %ymm15, %xmm15
	vmovlpd	%xmm15, 104(%rdi)
	vmovhpd	%xmm15, 152(%rdi)
	vgatherdpd	%ymm6, 16(%rdi,%xmm4,8), %ymm0
	vmovapd	%ymm5, %ymm6
	vaddpd	%ymm14, %ymm0, %ymm14
	vmovlpd	%xmm14, 16(%rdi)
	vmovhpd	%xmm14, 64(%rdi)
	vextractf128	$0x1, %ymm14, %xmm14
	vmovlpd	%xmm14, 112(%rdi)
	vmovhpd	%xmm14, 160(%rdi)
	vgatherdpd	%ymm6, 24(%rdi,%xmm4,8), %ymm8
	vmovapd	%ymm5, %ymm6
	vaddpd	%ymm10, %ymm8, %ymm10
	vmovlpd	%xmm10, 24(%rdi)
	vmovhpd	%xmm10, 72(%rdi)
	vextractf128	$0x1, %ymm10, %xmm10
	vmovlpd	%xmm10, 120(%rdi)
	vmovhpd	%xmm10, 168(%rdi)
	vgatherdpd	%ymm6, 32(%rdi,%xmm2,8), %ymm4
	vaddpd	%ymm7, %ymm4, %ymm7
	vmovlpd	%xmm7, 32(%rdi)
	vmovhpd	%xmm7, 80(%rdi)
	vextractf128	$0x1, %ymm7, %xmm7
	vmovlpd	%xmm7, 128(%rdi)
	vmovhpd	%xmm7, 176(%rdi)
	vgatherdpd	%ymm5, 40(%rdi,%xmm2,8), %ymm1
	addq	$192, %rdi
	vaddpd	%ymm3, %ymm1, %ymm3
	vmovlpd	%xmm3, -152(%rdi)
	vmovhpd	%xmm3, -104(%rdi)
	vextractf128	$0x1, %ymm3, %xmm3
	vmovlpd	%xmm3, -56(%rdi)
	vmovhpd	%xmm3, -8(%rdi)
	cmpq	%rdi, %rbx
	jne	.L9
	leal	4(,%r12,4), %eax
.L10:
	cmpl	%eax, %edx
	jle	.L3
	subl	$1, %edx
	movslq	%eax, %rdi
	subl	%eax, %edx
	leaq	(%rdi,%rdi,2), %r12
	leaq	(%rdx,%rdi), %rax
	salq	$4, %r12
	leaq	(%rax,%rax,2), %rax
	leaq	(%rsi,%r12), %r15
	addq	%r9, %r12
	salq	$4, %rax
	leaq	48(%r9,%rax), %r14
	leal	-1(%r8), %eax
	salq	$6, %rax
	leaq	64(%rcx,%rax), %r13
	.p2align 4,,10
	.p2align 3
.L14:
	vmovsd	(%r15), %xmm3
	vmovsd	16(%r15), %xmm7
	vmovsd	%xmm3, -112(%rbp)
	vmovsd	8(%r15), %xmm3
	vmovsd	%xmm7, -176(%rbp)
	vmovsd	32(%r15), %xmm7
	vmovsd	%xmm3, -144(%rbp)
	vmovsd	24(%r15), %xmm3
	vmovsd	%xmm7, -240(%rbp)
	vmovsd	%xmm3, -208(%rbp)
	vmovsd	40(%r15), %xmm3
	vmovsd	%xmm3, -272(%rbp)
	testl	%r8d, %r8d
	jle	.L17
	vxorpd	%xmm14, %xmm14, %xmm14
	movq	%rcx, %rbx
	vmovapd	%xmm14, %xmm12
	vmovapd	%xmm14, %xmm7
	vmovapd	%xmm14, %xmm13
	vmovapd	%xmm14, %xmm3
	vmovapd	%xmm14, %xmm5
	.p2align 4,,10
	.p2align 3
.L13:
	vmovsd	-112(%rbp), %xmm6
	vsubsd	(%rbx), %xmm6, %xmm6
	vxorpd	%xmm15, %xmm15, %xmm15
	vmovsd	-208(%rbp), %xmm0
	vsubsd	24(%rbx), %xmm0, %xmm11
	vmovsd	-240(%rbp), %xmm0
	vsubsd	32(%rbx), %xmm0, %xmm10
	vmovsd	-272(%rbp), %xmm0
	vsubsd	40(%rbx), %xmm0, %xmm9
	vmovapd	%xmm6, %xmm0
	vfmadd213sd	56(%rbx), %xmm6, %xmm0
	vmovsd	-144(%rbp), %xmm4
	vsubsd	8(%rbx), %xmm4, %xmm4
	vmovsd	-176(%rbp), %xmm2
	vsubsd	16(%rbx), %xmm2, %xmm2
	vmovsd	48(%rbx), %xmm1
	vfmadd231sd	%xmm4, %xmm4, %xmm0
	vfmadd231sd	%xmm2, %xmm2, %xmm0
	vucomisd	%xmm0, %xmm15
	vsqrtsd	%xmm0, %xmm0, %xmm8
	ja	.L26
.L12:
	vmovsd	.LC3(%rip), %xmm0
	addq	$64, %rbx
	vdivsd	%xmm8, %xmm0, %xmm0
	vmulsd	%xmm11, %xmm6, %xmm8
	vfmadd231sd	%xmm10, %xmm4, %xmm8
	vfmadd231sd	%xmm9, %xmm2, %xmm8
	vmulsd	%xmm0, %xmm0, %xmm15
	vmulsd	%xmm15, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm15, %xmm15
	vmulsd	%xmm0, %xmm1, %xmm0
	vmulsd	.LC2(%rip), %xmm1, %xmm1
	vfmadd231sd	%xmm0, %xmm11, %xmm7
	vfmadd231sd	%xmm0, %xmm10, %xmm5
	vmulsd	%xmm8, %xmm1, %xmm1
	vfmadd231sd	%xmm0, %xmm9, %xmm3
	vfmadd231sd	%xmm0, %xmm6, %xmm12
	vfmadd231sd	%xmm0, %xmm4, %xmm14
	vfmadd231sd	%xmm0, %xmm2, %xmm13
	vmulsd	%xmm15, %xmm1, %xmm1
	vfnmadd231sd	%xmm1, %xmm6, %xmm7
	vfnmadd231sd	%xmm1, %xmm4, %xmm5
	vfnmadd231sd	%xmm1, %xmm2, %xmm3
	cmpq	%rbx, %r13
	jne	.L13
.L11:
	vunpcklpd	%xmm7, %xmm13, %xmm7
	vunpcklpd	%xmm14, %xmm12, %xmm12
	addq	$48, %r12
	addq	$48, %r15
	vmovupd	-48(%r12), %xmm6
	vinsertf128	$0x1, -32(%r12), %ymm6, %ymm0
	vinsertf128	$0x1, %xmm7, %ymm12, %ymm7
	vaddsd	-16(%r12), %xmm5, %xmm5
	vaddsd	-8(%r12), %xmm3, %xmm3
	vaddpd	%ymm7, %ymm0, %ymm7
	vmovsd	%xmm5, -16(%r12)
	vmovups	%xmm7, -48(%r12)
	vextractf128	$0x1, %ymm7, -32(%r12)
	vmovsd	%xmm3, -8(%r12)
	cmpq	%r14, %r12
	jne	.L14
.L3:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L27
	vzeroupper
	addq	$416, %rsp
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
.L17:
	.cfi_restore_state
	vxorpd	%xmm14, %xmm14, %xmm14
	vmovapd	%xmm14, %xmm12
	vmovapd	%xmm14, %xmm7
	vmovapd	%xmm14, %xmm13
	vmovapd	%xmm14, %xmm3
	vmovapd	%xmm14, %xmm5
	jmp	.L11
	.p2align 4,,10
	.p2align 3
.L16:
	vxorpd	%xmm15, %xmm15, %xmm15
	vmovapd	%ymm15, %ymm7
	vmovapd	%ymm15, -112(%rbp)
	vmovapd	%ymm15, %ymm10
	vmovapd	%ymm15, %ymm14
	vmovapd	%ymm15, %ymm3
	jmp	.L7
.L25:
	xorl	%eax, %eax
	jmp	.L10
.L26:
	movl	%r8d, -388(%rbp)
	movq	%rcx, -384(%rbp)
	vmovsd	%xmm3, -440(%rbp)
	vmovsd	%xmm5, -432(%rbp)
	vmovsd	%xmm7, -424(%rbp)
	vmovsd	%xmm13, -416(%rbp)
	vmovsd	%xmm14, -408(%rbp)
	vmovsd	%xmm12, -400(%rbp)
	vmovsd	%xmm8, -376(%rbp)
	vmovsd	%xmm1, -368(%rbp)
	vmovsd	%xmm9, -360(%rbp)
	vmovsd	%xmm10, -352(%rbp)
	vmovsd	%xmm11, -344(%rbp)
	vmovsd	%xmm2, -80(%rbp)
	vmovsd	%xmm4, -336(%rbp)
	vmovsd	%xmm6, -304(%rbp)
	vzeroupper
	call	sqrt@PLT
	vmovsd	-440(%rbp), %xmm3
	vmovsd	-432(%rbp), %xmm5
	vmovsd	-424(%rbp), %xmm7
	vmovsd	-416(%rbp), %xmm13
	vmovsd	-408(%rbp), %xmm14
	vmovsd	-400(%rbp), %xmm12
	movl	-388(%rbp), %r8d
	movq	-384(%rbp), %rcx
	vmovsd	-376(%rbp), %xmm8
	vmovsd	-368(%rbp), %xmm1
	vmovsd	-360(%rbp), %xmm9
	vmovsd	-352(%rbp), %xmm10
	vmovsd	-344(%rbp), %xmm11
	vmovsd	-80(%rbp), %xmm2
	vmovsd	-336(%rbp), %xmm4
	vmovsd	-304(%rbp), %xmm6
	jmp	.L12
.L27:
	vzeroupper
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8315:
	.size	_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE, .-_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE
	.section	.rodata._ZN6KernelclEPK3EPIiPK3EPJiP5FORCEi.str1.1,"aMS",@progbits,1
.LC7:
	.string	"ni: "
.LC8:
	.string	" nj:"
.LC9:
	.string	"kerel 1: "
.LC10:
	.string	" ns"
.LC11:
	.string	"test PIKG"
.LC13:
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
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	movq	%rdi, %r14
	pushq	%r13
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
	subq	$480, %rsp
	movq	%rsi, -488(%rbp)
	movl	(%r10), %eax
	movq	%r9, -496(%rbp)
	movq	%fs:40, %rdi
	movq	%rdi, -56(%rbp)
	xorl	%edi, %edi
	testl	%eax, %eax
	js	.L87
	movl	%eax, (%r14)
	testl	%eax, %eax
	je	.L88
.L31:
	cmpl	$1, %eax
	je	.L89
.L54:
	cmpl	$2, %eax
	je	.L90
.L28:
	movq	-56(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L91
	addq	$480, %rsp
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
.L87:
	.cfi_restore_state
	movl	(%r14), %eax
	testl	%eax, %eax
	jne	.L31
.L88:
	movl	$4, %edx
	leaq	.LC7(%rip), %rsi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movl	%r13d, %esi
	leaq	_ZSt4cout(%rip), %rdi
	call	_ZNSolsEi@PLT
	movl	$4, %edx
	leaq	.LC8(%rip), %rsi
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
	je	.L37
	cmpb	$0, 56(%rdi)
	je	.L33
	movsbl	67(%rdi), %esi
.L34:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	movslq	%r13d, %rax
	movabsq	$192153584101141162, %rdx
	cmpq	%rdx, %rax
	ja	.L35
	leaq	(%rax,%rax,2), %rdi
	salq	$4, %rdi
	call	_Znam@PLT
	movq	%rax, -504(%rbp)
	testl	%r13d, %r13d
	jle	.L39
	movq	%rax, %rdi
	leal	-1(%r13), %eax
	movq	-496(%rbp), %rsi
	leaq	3(%rax,%rax,2), %rdx
	salq	$4, %rdx
	call	memcpy@PLT
.L39:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	movl	%ebx, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movq	-504(%rbp), %r9
	movq	-488(%rbp), %rsi
	movq	%r14, %rdi
	movq	%rax, %r15
	call	_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	movl	$9, %edx
	leaq	.LC9(%rip), %rsi
	subq	%r15, %rax
	leaq	_ZSt4cerr(%rip), %rdi
	vcvtsi2sdq	%rax, %xmm5, %xmm0
	vmovsd	%xmm0, -512(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-512(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L37
	cmpb	$0, 56(%rdi)
	je	.L40
	movsbl	67(%rdi), %esi
.L41:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	.LC6(%rip), %xmm0
	vcomisd	-512(%rbp), %xmm0
	jbe	.L84
	movl	$1, (%r14)
.L42:
	testl	%r13d, %r13d
	jle	.L44
	leal	-1(%r13), %eax
	movq	-496(%rbp), %rsi
	movq	-504(%rbp), %rdi
	leaq	3(%rax,%rax,2), %r9
	movq	%r9, %r15
	salq	$4, %r15
	movq	%r15, %rdx
	call	memcpy@PLT
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	leaq	.LC11(%rip), %rdi
	movq	%rax, -520(%rbp)
	call	puts@PLT
	testl	%ebx, %ebx
	leal	3(%rbx), %r8d
	vxorpd	%xmm0, %xmm0, %xmm0
	cmovns	%ebx, %r8d
	movq	-504(%rbp), %rax
	vcmppd	$0, %ymm0, %ymm0, %ymm15
	vmovdqa	.LC15(%rip), %xmm0
	movq	-488(%rbp), %rcx
	andl	$-4, %r8d
	leaq	(%rax,%r15), %r9
	movq	%rax, %rdx
	vmovaps	%xmm0, -480(%rbp)
	leal	-1(%r8), %eax
	vmovapd	%ymm15, %ymm14
	shrl	$2, %eax
	movl	%eax, %esi
	leal	4(,%rax,4), %r15d
	salq	$8, %rsi
	leaq	312(%r12,%rsi), %r10
	.p2align 4,,10
	.p2align 3
.L49:
	vmovsd	(%rcx), %xmm5
	vmovsd	40(%rcx), %xmm7
	vmovsd	%xmm5, -240(%rbp)
	vbroadcastsd	%xmm5, %ymm5
	vmovapd	%ymm5, -208(%rbp)
	vmovsd	8(%rcx), %xmm5
	vmovsd	%xmm7, -80(%rbp)
	vbroadcastsd	%xmm7, %ymm7
	vbroadcastsd	%xmm5, %ymm4
	vmovsd	%xmm5, -72(%rbp)
	vmovsd	16(%rcx), %xmm5
	vmovapd	%ymm4, -272(%rbp)
	vmovsd	24(%rcx), %xmm4
	vmovsd	%xmm5, -304(%rbp)
	vbroadcastsd	%xmm5, %ymm5
	vmovapd	%ymm5, -336(%rbp)
	vmovsd	32(%rcx), %xmm5
	vmovsd	%xmm4, -368(%rbp)
	vbroadcastsd	%xmm4, %ymm4
	vmovapd	%ymm4, -400(%rbp)
	vbroadcastsd	%xmm5, %ymm12
	vmovsd	%xmm5, -432(%rbp)
	vmovapd	%ymm7, -464(%rbp)
	testl	%r8d, %r8d
	jle	.L67
	vxorpd	%xmm7, %xmm7, %xmm7
	leaq	56(%r12), %rax
	vmovapd	%ymm7, -176(%rbp)
	vmovapd	%ymm7, %ymm11
	vmovapd	%ymm7, %ymm13
	vmovapd	%ymm7, %ymm15
	vmovapd	%ymm7, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	.p2align 4,,10
	.p2align 3
.L46:
	vmovdqa	-480(%rbp), %xmm2
	vmovapd	%ymm14, %ymm4
	vmovapd	%ymm14, %ymm3
	vmovapd	%ymm14, %ymm6
	vmovapd	%ymm14, %ymm5
	vmovapd	%ymm14, %ymm7
	vmovapd	%ymm14, %ymm1
	vgatherdpd	%ymm4, (%rax,%xmm2,8), %ymm0
	vgatherdpd	%ymm3, -48(%rax,%xmm2,8), %ymm4
	vgatherdpd	%ymm6, -40(%rax,%xmm2,8), %ymm3
	vgatherdpd	%ymm5, -8(%rax,%xmm2,8), %ymm8
	vmovapd	%ymm14, %ymm6
	vgatherdpd	%ymm7, -56(%rax,%xmm2,8), %ymm5
	vgatherdpd	%ymm6, -32(%rax,%xmm2,8), %ymm7
	vgatherdpd	%ymm1, -24(%rax,%xmm2,8), %ymm6
	vmovapd	%ymm14, %ymm1
	vgatherdpd	%ymm1, -16(%rax,%xmm2,8), %ymm10
	vsubpd	%ymm6, %ymm12, %ymm6
	vmovapd	-208(%rbp), %ymm2
	vmovapd	-464(%rbp), %ymm1
	addq	$256, %rax
	vsubpd	%ymm5, %ymm2, %ymm5
	vmovapd	-272(%rbp), %ymm2
	vsubpd	%ymm10, %ymm1, %ymm10
	vsubpd	%ymm4, %ymm2, %ymm4
	vmovapd	-336(%rbp), %ymm2
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vsubpd	%ymm3, %ymm2, %ymm3
	vmovapd	-400(%rbp), %ymm2
	vmulpd	%ymm6, %ymm4, %ymm9
	vsubpd	%ymm7, %ymm2, %ymm7
	vmovapd	.LC1(%rip), %ymm2
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm7, %ymm5, %ymm9
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vfmadd231pd	%ymm10, %ymm3, %ymm9
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm2, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm2
	vmulpd	%ymm2, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm8, %ymm1
	vmulpd	.LC12(%rip), %ymm8, %ymm8
	vfmadd213pd	-112(%rbp), %ymm1, %ymm7
	vmulpd	%ymm0, %ymm2, %ymm0
	vfmadd213pd	-144(%rbp), %ymm1, %ymm6
	vfmadd231pd	%ymm5, %ymm1, %ymm15
	vfmadd231pd	%ymm4, %ymm1, %ymm13
	vmulpd	%ymm9, %ymm8, %ymm8
	vfmadd231pd	%ymm3, %ymm1, %ymm11
	vfmadd213pd	-176(%rbp), %ymm10, %ymm1
	vmulpd	%ymm0, %ymm8, %ymm8
	vfnmadd132pd	%ymm8, %ymm7, %ymm5
	vfnmadd132pd	%ymm8, %ymm6, %ymm4
	vfnmadd132pd	%ymm3, %ymm1, %ymm8
	vmovapd	%ymm5, -112(%rbp)
	vmovapd	%ymm4, -144(%rbp)
	vmovapd	%ymm8, -176(%rbp)
	cmpq	%rax, %r10
	jne	.L46
	movl	%r15d, %esi
.L45:
	cmpl	%esi, %ebx
	jg	.L92
.L47:
	vunpckhpd	%ymm11, %ymm11, %ymm6
	vunpckhpd	%ymm15, %ymm15, %ymm1
	vunpckhpd	%ymm13, %ymm13, %ymm3
	addq	$48, %rdx
	vmovapd	-112(%rbp), %ymm2
	vaddpd	%ymm1, %ymm15, %ymm1
	vaddpd	%ymm3, %ymm13, %ymm3
	addq	$48, %rcx
	vmovapd	-176(%rbp), %ymm12
	vaddpd	%ymm6, %ymm11, %ymm6
	vunpckhpd	%ymm2, %ymm2, %ymm7
	vaddpd	%ymm2, %ymm7, %ymm7
	vextractf128	$0x1, %ymm1, %xmm5
	vextractf128	$0x1, %ymm3, %xmm4
	vmovapd	-144(%rbp), %ymm2
	vextractf128	$0x1, %ymm6, %xmm11
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm4, %ymm3, %ymm3
	vunpckhpd	%ymm2, %ymm2, %ymm0
	vaddpd	%ymm11, %ymm6, %ymm6
	vaddpd	%ymm2, %ymm0, %ymm0
	vunpckhpd	%ymm12, %ymm12, %ymm2
	vextractf128	$0x1, %ymm7, %xmm10
	vaddpd	%ymm12, %ymm2, %ymm2
	vaddpd	%ymm10, %ymm7, %ymm7
	vunpcklpd	%xmm3, %xmm1, %xmm1
	vaddpd	-48(%rdx), %xmm1, %xmm1
	vextractf128	$0x1, %ymm0, %xmm8
	vextractf128	$0x1, %ymm2, %xmm9
	vaddpd	%ymm8, %ymm0, %ymm0
	vunpcklpd	%xmm7, %xmm6, %xmm6
	vaddpd	%ymm9, %ymm2, %ymm2
	vaddpd	-32(%rdx), %xmm6, %xmm6
	vmovups	%xmm1, -48(%rdx)
	vunpcklpd	%xmm2, %xmm0, %xmm0
	vaddpd	-16(%rdx), %xmm0, %xmm0
	vmovups	%xmm6, -32(%rdx)
	vmovups	%xmm0, -16(%rdx)
	cmpq	%rdx, %r9
	jne	.L49
	vzeroupper
.L62:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	subq	-520(%rbp), %rax
	movl	$9, %edx
	vcvtsi2sdq	%rax, %xmm6, %xmm0
	leaq	.LC13(%rip), %rsi
	leaq	_ZSt4cerr(%rip), %rdi
	vmovsd	%xmm0, -112(%rbp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	vmovsd	-112(%rbp), %xmm0
	leaq	_ZSt4cerr(%rip), %rdi
	call	_ZNSo9_M_insertIdEERSoT_@PLT
	movl	$3, %edx
	leaq	.LC10(%rip), %rsi
	movq	%rax, %r15
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l@PLT
	movq	(%r15), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rdi
	testq	%rdi, %rdi
	je	.L37
	cmpb	$0, 56(%rdi)
	je	.L50
	movsbl	67(%rdi), %esi
.L51:
	movq	%r15, %rdi
	call	_ZNSo3putEc@PLT
	movq	%rax, %rdi
	call	_ZNSo5flushEv@PLT
	vmovsd	-512(%rbp), %xmm5
	vcomisd	-112(%rbp), %xmm5
	jbe	.L52
	movl	$2, (%r14)
.L52:
	movq	-504(%rbp), %rdi
	call	_ZdaPv@PLT
	movl	(%r14), %eax
	cmpl	$1, %eax
	jne	.L54
.L89:
	movq	-496(%rbp), %r9
	movl	%ebx, %r8d
	movq	%r12, %rcx
	movl	%r13d, %edx
	movq	-488(%rbp), %rsi
	movq	%r14, %rdi
	call	_ZN6Kernel12Kernel_I4_J1EPK3EPIiPK3EPJiP5FORCE
	movl	(%r14), %eax
	cmpl	$2, %eax
	jne	.L28
.L90:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	testl	%r13d, %r13d
	jle	.L28
	testl	%ebx, %ebx
	leal	3(%rbx), %ecx
	leal	-1(%r13), %eax
	movq	-496(%rbp), %r9
	cmovns	%ebx, %ecx
	leaq	(%rax,%rax,2), %rax
	vxorpd	%xmm0, %xmm0, %xmm0
	movq	-488(%rbp), %rsi
	salq	$4, %rax
	vcmppd	$0, %ymm0, %ymm0, %ymm15
	vmovdqa	.LC15(%rip), %xmm0
	andl	$-4, %ecx
	leaq	48(%r9,%rax), %r8
	leal	-1(%rcx), %eax
	vmovaps	%xmm0, -480(%rbp)
	shrl	$2, %eax
	vmovapd	%ymm15, %ymm14
	movl	%eax, %edx
	leal	4(,%rax,4), %r10d
	salq	$8, %rdx
	leaq	312(%r12,%rdx), %rdi
	.p2align 4,,10
	.p2align 3
.L61:
	vmovsd	16(%rsi), %xmm3
	vmovsd	(%rsi), %xmm5
	vmovsd	8(%rsi), %xmm4
	vbroadcastsd	%xmm3, %ymm7
	vmovsd	%xmm5, -72(%rbp)
	vbroadcastsd	%xmm5, %ymm5
	vmovapd	%ymm7, -368(%rbp)
	vmovsd	24(%rsi), %xmm7
	vbroadcastsd	%xmm4, %ymm6
	vmovapd	%ymm5, -240(%rbp)
	vbroadcastsd	%xmm7, %ymm5
	vmovapd	%ymm6, -304(%rbp)
	vmovsd	32(%rsi), %xmm6
	vmovapd	%ymm5, -432(%rbp)
	vmovsd	40(%rsi), %xmm5
	vmovsd	%xmm4, -272(%rbp)
	vbroadcastsd	%xmm6, %ymm12
	vmovsd	%xmm3, -336(%rbp)
	vbroadcastsd	%xmm5, %ymm11
	vmovsd	%xmm7, -400(%rbp)
	vmovsd	%xmm6, -80(%rbp)
	vmovsd	%xmm5, -464(%rbp)
	testl	%ecx, %ecx
	jle	.L69
	vxorpd	%xmm6, %xmm6, %xmm6
	leaq	56(%r12), %rax
	vmovapd	%ymm6, -144(%rbp)
	vmovapd	%ymm6, %ymm13
	vmovapd	%ymm6, %ymm15
	vmovapd	%ymm6, -176(%rbp)
	vmovapd	%ymm6, -112(%rbp)
	vmovapd	%ymm6, -208(%rbp)
	.p2align 4,,10
	.p2align 3
.L58:
	vmovdqa	-480(%rbp), %xmm1
	vmovapd	%ymm14, %ymm5
	vmovapd	%ymm14, %ymm6
	vmovapd	%ymm14, %ymm3
	vmovapd	%ymm14, %ymm2
	vgatherdpd	%ymm5, (%rax,%xmm1,8), %ymm0
	vmovapd	%ymm14, %ymm5
	vgatherdpd	%ymm6, -48(%rax,%xmm1,8), %ymm4
	vgatherdpd	%ymm5, -8(%rax,%xmm1,8), %ymm8
	vmovapd	%ymm14, %ymm6
	vgatherdpd	%ymm3, -56(%rax,%xmm1,8), %ymm5
	vgatherdpd	%ymm6, -40(%rax,%xmm1,8), %ymm3
	vmovapd	%ymm14, %ymm6
	vgatherdpd	%ymm6, -32(%rax,%xmm1,8), %ymm7
	vgatherdpd	%ymm2, -24(%rax,%xmm1,8), %ymm6
	vmovapd	%ymm14, %ymm2
	vgatherdpd	%ymm2, -16(%rax,%xmm1,8), %ymm10
	vsubpd	%ymm6, %ymm12, %ymm6
	vmovapd	-240(%rbp), %ymm1
	vmovapd	-368(%rbp), %ymm2
	vsubpd	%ymm10, %ymm11, %ymm10
	addq	$256, %rax
	vsubpd	%ymm5, %ymm1, %ymm5
	vmovapd	-304(%rbp), %ymm1
	vsubpd	%ymm3, %ymm2, %ymm3
	vmovapd	.LC1(%rip), %ymm2
	vsubpd	%ymm4, %ymm1, %ymm4
	vmovapd	-432(%rbp), %ymm1
	vfmadd231pd	%ymm5, %ymm5, %ymm0
	vsubpd	%ymm7, %ymm1, %ymm7
	vmulpd	%ymm6, %ymm4, %ymm9
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm7, %ymm5, %ymm9
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vfmadd231pd	%ymm10, %ymm3, %ymm9
	vsqrtpd	%ymm0, %ymm0
	vdivpd	%ymm0, %ymm2, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm2
	vmulpd	%ymm2, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm8, %ymm1
	vmulpd	.LC12(%rip), %ymm8, %ymm8
	vfmadd213pd	-112(%rbp), %ymm1, %ymm7
	vmulpd	%ymm0, %ymm2, %ymm0
	vmovapd	-208(%rbp), %ymm2
	vfmadd213pd	-176(%rbp), %ymm1, %ymm6
	vfmadd231pd	%ymm5, %ymm1, %ymm2
	vfmadd231pd	%ymm4, %ymm1, %ymm15
	vmulpd	%ymm9, %ymm8, %ymm8
	vfmadd231pd	%ymm3, %ymm1, %ymm13
	vfmadd213pd	-144(%rbp), %ymm10, %ymm1
	vmovapd	%ymm2, -208(%rbp)
	vmulpd	%ymm0, %ymm8, %ymm8
	vfnmadd132pd	%ymm8, %ymm7, %ymm5
	vfnmadd132pd	%ymm8, %ymm6, %ymm4
	vfnmadd132pd	%ymm3, %ymm1, %ymm8
	vmovapd	%ymm5, -112(%rbp)
	vmovapd	%ymm4, -176(%rbp)
	vmovapd	%ymm8, -144(%rbp)
	cmpq	%rax, %rdi
	jne	.L58
	movl	%r10d, %edx
.L57:
	cmpl	%edx, %ebx
	jg	.L93
.L59:
	vunpckhpd	%ymm13, %ymm13, %ymm6
	vunpckhpd	%ymm15, %ymm15, %ymm2
	addq	$48, %r9
	addq	$48, %rsi
	vmovapd	-112(%rbp), %ymm3
	vaddpd	%ymm6, %ymm13, %ymm6
	vmovapd	-208(%rbp), %ymm4
	vaddpd	%ymm2, %ymm15, %ymm2
	vmovapd	-144(%rbp), %ymm13
	vunpckhpd	%ymm3, %ymm3, %ymm7
	vunpckhpd	%ymm4, %ymm4, %ymm1
	vaddpd	%ymm3, %ymm7, %ymm7
	vmovapd	-176(%rbp), %ymm3
	vaddpd	%ymm4, %ymm1, %ymm1
	vextractf128	$0x1, %ymm6, %xmm11
	vextractf128	$0x1, %ymm2, %xmm4
	vaddpd	%ymm11, %ymm6, %ymm6
	vunpckhpd	%ymm3, %ymm3, %ymm0
	vaddpd	%ymm4, %ymm2, %ymm2
	vaddpd	%ymm3, %ymm0, %ymm0
	vunpckhpd	%ymm13, %ymm13, %ymm3
	vextractf128	$0x1, %ymm1, %xmm5
	vaddpd	%ymm13, %ymm3, %ymm3
	vextractf128	$0x1, %ymm7, %xmm10
	vaddpd	%ymm5, %ymm1, %ymm1
	vaddpd	%ymm10, %ymm7, %ymm7
	vextractf128	$0x1, %ymm0, %xmm9
	vextractf128	$0x1, %ymm3, %xmm8
	vaddpd	%ymm9, %ymm0, %ymm0
	vunpcklpd	%xmm2, %xmm1, %xmm1
	vaddpd	%ymm8, %ymm3, %ymm3
	vunpcklpd	%xmm7, %xmm6, %xmm6
	vaddpd	-48(%r9), %xmm1, %xmm1
	vaddpd	-32(%r9), %xmm6, %xmm6
	vunpcklpd	%xmm3, %xmm0, %xmm0
	vaddpd	-16(%r9), %xmm0, %xmm0
	vmovups	%xmm1, -48(%r9)
	vmovups	%xmm6, -32(%r9)
	vmovups	%xmm0, -16(%r9)
	cmpq	%r9, %r8
	jne	.L61
	vzeroupper
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L33:
	movq	%rdi, -112(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-112(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L34
	call	*%rax
	movsbl	%al, %esi
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L92:
	movslq	%esi, %rdi
	leal	-1(%rbx), %r11d
	vmovapd	%ymm15, %ymm7
	vmovapd	-112(%rbp), %ymm10
	movq	%rdi, %rax
	vmovapd	-176(%rbp), %ymm5
	vmovapd	-144(%rbp), %ymm4
	vmovapd	%ymm15, -336(%rbp)
	salq	$6, %rax
	vmovapd	%ymm14, -464(%rbp)
	vmovapd	%ymm7, %ymm14
	addq	%r12, %rax
	vmovapd	%ymm5, -208(%rbp)
	vmovapd	%ymm4, %ymm15
	vmovapd	%ymm11, %ymm5
	movq	%rax, -272(%rbp)
	movl	%r11d, %eax
	subl	%esi, %eax
	vmovapd	%ymm13, -400(%rbp)
	movq	%rax, %rsi
	movq	-272(%rbp), %rax
	vmovapd	%ymm11, -272(%rbp)
	addq	%rdi, %rsi
	salq	$6, %rsi
	leaq	64(%r12,%rsi), %rsi
	.p2align 4,,10
	.p2align 3
.L48:
	vbroadcastsd	56(%rax), %ymm0
	vmovsd	-80(%rbp), %xmm1
	addq	$64, %rax
	vmovsd	-240(%rbp), %xmm4
	vsubsd	-64(%rax), %xmm4, %xmm6
	vmovsd	-72(%rbp), %xmm4
	vsubsd	-56(%rax), %xmm4, %xmm2
	vmovsd	-304(%rbp), %xmm7
	vsubsd	-48(%rax), %xmm7, %xmm4
	vbroadcastsd	%xmm6, %ymm6
	vsubsd	-24(%rax), %xmm1, %xmm9
	vmovsd	-16(%rax), %xmm3
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vbroadcastsd	%xmm2, %ymm11
	vmovapd	.LC1(%rip), %ymm1
	vmovsd	-368(%rbp), %xmm7
	vbroadcastsd	%xmm4, %ymm4
	vsubsd	-40(%rax), %xmm7, %xmm8
	vmovsd	-432(%rbp), %xmm7
	vsubsd	-32(%rax), %xmm7, %xmm7
	vbroadcastsd	%xmm9, %ymm9
	vbroadcastsd	%xmm8, %ymm8
	vmulsd	%xmm7, %xmm2, %xmm2
	vfmadd231pd	%ymm11, %ymm11, %ymm0
	vbroadcastsd	%xmm7, %ymm7
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vbroadcastsd	%xmm2, %ymm2
	vfmadd231pd	%ymm8, %ymm6, %ymm2
	vsqrtpd	%ymm0, %ymm0
	vfmadd231pd	%ymm9, %ymm4, %ymm2
	vdivpd	%ymm0, %ymm1, %ymm0
	vbroadcastsd	%xmm3, %ymm1
	vmulsd	.LC2(%rip), %xmm3, %xmm3
	vbroadcastsd	%xmm3, %ymm3
	vmulpd	%ymm2, %ymm3, %ymm3
	vmulpd	%ymm0, %ymm0, %ymm12
	vmulpd	%ymm12, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm12, %ymm0
	vfmadd132pd	%ymm1, %ymm15, %ymm7
	vfmadd231pd	%ymm8, %ymm1, %ymm10
	vmovapd	%ymm11, %ymm15
	vmulpd	%ymm3, %ymm0, %ymm0
	vfmadd231pd	%ymm6, %ymm1, %ymm14
	vfmadd231pd	%ymm11, %ymm1, %ymm13
	vfmadd231pd	%ymm4, %ymm1, %ymm5
	vfmadd213pd	-208(%rbp), %ymm9, %ymm1
	vfnmadd231pd	%ymm6, %ymm0, %ymm10
	vfnmadd132pd	%ymm0, %ymm7, %ymm15
	vfnmadd132pd	%ymm4, %ymm1, %ymm0
	vmovapd	%ymm0, -208(%rbp)
	cmpq	%rsi, %rax
	jne	.L48
	vmovapd	-272(%rbp), %ymm11
	vmovapd	%ymm13, %ymm6
	vmovapd	%ymm15, %ymm4
	vmovapd	%ymm14, %ymm7
	vmovapd	-400(%rbp), %ymm13
	vmovapd	-336(%rbp), %ymm15
	vblendpd	$1, %ymm5, %ymm11, %ymm11
	vmovapd	-112(%rbp), %ymm5
	vmovapd	-464(%rbp), %ymm14
	vblendpd	$1, %ymm6, %ymm13, %ymm13
	vmovapd	-176(%rbp), %ymm6
	vblendpd	$1, %ymm7, %ymm15, %ymm15
	vblendpd	$1, %ymm10, %ymm5, %ymm5
	vmovapd	%ymm5, -112(%rbp)
	vmovapd	-144(%rbp), %ymm5
	vblendpd	$1, %ymm0, %ymm6, %ymm7
	vmovapd	%ymm7, -176(%rbp)
	vblendpd	$1, %ymm4, %ymm5, %ymm4
	vmovapd	%ymm4, -144(%rbp)
	jmp	.L47
	.p2align 4,,10
	.p2align 3
.L93:
	leal	-1(%rbx), %r11d
	movslq	%edx, %r13
	vmovapd	%ymm15, %ymm3
	vmovapd	-112(%rbp), %ymm10
	movl	%r11d, %r14d
	vmovapd	-176(%rbp), %ymm5
	movq	%r13, %rax
	vmovapd	-208(%rbp), %ymm4
	subl	%edx, %r14d
	salq	$6, %rax
	vmovapd	-144(%rbp), %ymm2
	vmovapd	%ymm15, -304(%rbp)
	movq	%r14, %rdx
	vmovapd	%ymm5, -240(%rbp)
	addq	%r12, %rax
	vmovapd	%ymm13, %ymm5
	addq	%r13, %rdx
	vmovapd	%ymm14, -432(%rbp)
	vmovapd	%ymm4, %ymm15
	vmovapd	%ymm3, %ymm14
	salq	$6, %rdx
	vmovapd	%ymm13, -368(%rbp)
	leaq	64(%r12,%rdx), %rdx
	.p2align 4,,10
	.p2align 3
.L60:
	vmovsd	-72(%rbp), %xmm3
	vsubsd	(%rax), %xmm3, %xmm7
	addq	$64, %rax
	vbroadcastsd	-8(%rax), %ymm0
	vmovsd	-272(%rbp), %xmm3
	vsubsd	-56(%rax), %xmm3, %xmm3
	vmovsd	-336(%rbp), %xmm6
	vbroadcastsd	%xmm7, %ymm7
	vsubsd	-48(%rax), %xmm6, %xmm6
	vmovsd	-16(%rax), %xmm4
	vfmadd231pd	%ymm7, %ymm7, %ymm0
	vmovsd	-400(%rbp), %xmm1
	vsubsd	-40(%rax), %xmm1, %xmm9
	vbroadcastsd	%xmm3, %ymm12
	vmovsd	-80(%rbp), %xmm1
	vsubsd	-32(%rax), %xmm1, %xmm8
	vbroadcastsd	%xmm6, %ymm6
	vmovsd	-464(%rbp), %xmm1
	vsubsd	-24(%rax), %xmm1, %xmm11
	vmovapd	.LC1(%rip), %ymm1
	vbroadcastsd	%xmm9, %ymm9
	vmulsd	%xmm8, %xmm3, %xmm3
	vbroadcastsd	%xmm8, %ymm8
	vfmadd231pd	%ymm12, %ymm12, %ymm0
	vbroadcastsd	%xmm11, %ymm11
	vbroadcastsd	%xmm3, %ymm3
	vfmadd231pd	%ymm6, %ymm6, %ymm0
	vfmadd231pd	%ymm9, %ymm7, %ymm3
	vsqrtpd	%ymm0, %ymm0
	vfmadd231pd	%ymm11, %ymm6, %ymm3
	vdivpd	%ymm0, %ymm1, %ymm0
	vbroadcastsd	%xmm4, %ymm1
	vmulsd	.LC2(%rip), %xmm4, %xmm4
	vbroadcastsd	%xmm4, %ymm4
	vmulpd	%ymm3, %ymm4, %ymm4
	vmulpd	%ymm0, %ymm0, %ymm13
	vmulpd	%ymm13, %ymm0, %ymm0
	vmulpd	%ymm0, %ymm1, %ymm1
	vmulpd	%ymm0, %ymm13, %ymm0
	vfmadd213pd	-240(%rbp), %ymm1, %ymm8
	vfmadd231pd	%ymm12, %ymm1, %ymm14
	vfmadd231pd	%ymm9, %ymm1, %ymm10
	vmulpd	%ymm4, %ymm0, %ymm0
	vfmadd231pd	%ymm11, %ymm1, %ymm2
	vfmadd231pd	%ymm7, %ymm1, %ymm15
	vfmadd231pd	%ymm6, %ymm1, %ymm5
	vfnmadd132pd	%ymm0, %ymm8, %ymm12
	vfnmadd231pd	%ymm7, %ymm0, %ymm10
	vfnmadd231pd	%ymm6, %ymm0, %ymm2
	vmovapd	%ymm12, -240(%rbp)
	cmpq	%rax, %rdx
	jne	.L60
	vmovapd	-208(%rbp), %ymm6
	vmovapd	%ymm15, %ymm3
	vmovapd	-368(%rbp), %ymm13
	vmovapd	%ymm14, %ymm4
	vmovapd	-304(%rbp), %ymm15
	vmovapd	-432(%rbp), %ymm14
	vblendpd	$1, %ymm3, %ymm6, %ymm7
	vmovapd	-176(%rbp), %ymm6
	vblendpd	$1, %ymm5, %ymm13, %ymm13
	vmovapd	-112(%rbp), %ymm5
	vmovapd	%ymm7, -208(%rbp)
	vblendpd	$1, %ymm4, %ymm15, %ymm15
	vblendpd	$1, %ymm12, %ymm6, %ymm7
	vmovapd	-144(%rbp), %ymm6
	vblendpd	$1, %ymm10, %ymm5, %ymm5
	vmovapd	%ymm7, -176(%rbp)
	vblendpd	$1, %ymm2, %ymm6, %ymm7
	vmovapd	%ymm5, -112(%rbp)
	vmovapd	%ymm7, -144(%rbp)
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L67:
	vxorpd	%xmm7, %xmm7, %xmm7
	xorl	%esi, %esi
	vmovapd	%ymm7, -176(%rbp)
	vmovapd	%ymm7, %ymm11
	vmovapd	%ymm7, %ymm13
	vmovapd	%ymm7, %ymm15
	vmovapd	%ymm7, -144(%rbp)
	vmovapd	%ymm7, -112(%rbp)
	jmp	.L45
	.p2align 4,,10
	.p2align 3
.L69:
	vxorpd	%xmm5, %xmm5, %xmm5
	xorl	%edx, %edx
	vmovapd	%ymm5, -144(%rbp)
	vmovapd	%ymm5, %ymm13
	vmovapd	%ymm5, %ymm15
	vmovapd	%ymm5, -176(%rbp)
	vmovapd	%ymm5, -112(%rbp)
	vmovapd	%ymm5, -208(%rbp)
	jmp	.L57
	.p2align 4,,10
	.p2align 3
.L84:
	vmovsd	%xmm0, -512(%rbp)
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L40:
	movq	%rdi, -112(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-112(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L41
	call	*%rax
	movsbl	%al, %esi
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rdi, -144(%rbp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	-144(%rbp), %rdi
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	(%rdi), %rax
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L51
	call	*%rax
	movsbl	%al, %esi
	jmp	.L51
	.p2align 4,,10
	.p2align 3
.L44:
	call	_ZNSt6chrono3_V212system_clock3nowEv@PLT
	leaq	.LC11(%rip), %rdi
	movq	%rax, -520(%rbp)
	call	puts@PLT
	jmp	.L62
.L91:
	call	__stack_chk_fail@PLT
.L37:
	call	_ZSt16__throw_bad_castv@PLT
.L35:
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
	jne	.L97
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L97:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE8385:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB8949:
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
.LFE8949:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC1:
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
.LC2:
	.long	0
	.long	1074266112
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC5:
	.quad	25769803776
	.quad	77309411340
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	4294967295
	.long	2146435071
	.section	.rodata.cst32
	.align 32
.LC12:
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.section	.rodata.cst16
	.align 16
.LC15:
	.quad	34359738368
	.quad	103079215120
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
