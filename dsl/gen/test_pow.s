	.file	"test_pow.cpp"
	.text
	.p2align 4
	.globl	_Z9check_powd
	.type	_Z9check_powd, @function
_Z9check_powd:
.LFB1819:
	.cfi_startproc
	endbr64
	movsd	aa(%rip), %xmm1
	divsd	%xmm0, %xmm1
	movapd	%xmm1, %xmm0
	ret
	.cfi_endproc
.LFE1819:
	.size	_Z9check_powd, .-_Z9check_powd
	.p2align 4
	.globl	_Z8check_opd
	.type	_Z8check_opd, @function
_Z8check_opd:
.LFB1821:
	.cfi_startproc
	endbr64
	pxor	%xmm2, %xmm2
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movapd	%xmm0, %xmm1
	ucomisd	%xmm0, %xmm2
	sqrtsd	%xmm1, %xmm1
	ja	.L6
.L4:
	movsd	.LC1(%rip), %xmm0
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	divsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm1
	mulsd	%xmm0, %xmm1
	mulsd	%xmm1, %xmm0
	ret
.L6:
	.cfi_restore_state
	movsd	%xmm1, 8(%rsp)
	call	sqrt@PLT
	movsd	8(%rsp), %xmm1
	jmp	.L4
	.cfi_endproc
.LFE1821:
	.size	_Z8check_opd, .-_Z8check_opd
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"time = %lf\n"
.LC4:
	.string	"get op time = %lf\n"
.LC5:
	.string	"op_time - pow_time = %lf\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1822:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	leaq	-77824(%rsp), %rax
	cmpq	%rax, %rsp
	je	.L9
.L23:
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	cmpq	%rax, %rsp
	jne	.L23
.L9:
	subq	$2176, %rsp
	orq	$0, 2168(%rsp)
	movq	%rsp, %rbx
	leaq	-77824(%rsp), %rax
.L11:
	cmpq	%rax, %rsp
	je	.L12
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L11
.L12:
	subq	$2176, %rsp
	orq	$0, 2168(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %r12
	.p2align 4,,10
	.p2align 3
.L14:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movsd	%xmm0, (%rbx,%rax,8)
	movsd	%xmm0, (%r12,%rax,8)
	addq	$1, %rax
	cmpq	$10000, %rax
	jne	.L14
	call	clock@PLT
	movsd	aa(%rip), %xmm1
	xorl	%edx, %edx
	movq	%rax, %r13
	movq	%rbx, %rax
	.p2align 4,,10
	.p2align 3
.L15:
	pxor	%xmm0, %xmm0
	movapd	%xmm1, %xmm4
	addq	$8, %rax
	cvtsi2sdl	%edx, %xmm0
	addl	$10, %edx
	divsd	%xmm0, %xmm4
	movsd	%xmm4, -8(%rax)
	cmpl	$100000, %edx
	jne	.L15
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	subq	%r13, %rax
	movl	$1, %ebx
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -56(%rbp)
	call	__printf_chk@PLT
	call	clock@PLT
	pxor	%xmm3, %xmm3
	movsd	.LC1(%rip), %xmm2
	movq	%rax, %r13
	movapd	%xmm3, %xmm1
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L18:
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%ebx, %xmm0
	ucomisd	%xmm0, %xmm3
	movapd	%xmm0, %xmm1
	sqrtsd	%xmm1, %xmm1
	ja	.L24
.L17:
	addq	$1, %rbx
.L16:
	movapd	%xmm2, %xmm5
	divsd	%xmm1, %xmm5
	movapd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
	mulsd	%xmm5, %xmm0
	movsd	%xmm0, -8(%r12,%rbx,8)
	cmpq	$10000, %rbx
	jne	.L18
	call	clock@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC4(%rip), %rsi
	subq	%r13, %rax
	cvtsi2sdq	%rax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, -64(%rbp)
	call	__printf_chk@PLT
	movsd	-64(%rbp), %xmm0
	subsd	-56(%rbp), %xmm0
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	movl	$1, %eax
	call	__printf_chk@PLT
	movq	-40(%rbp), %rax
	xorq	%fs:40, %rax
	jne	.L25
	leaq	-24(%rbp), %rsp
	xorl	%eax, %eax
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L24:
	.cfi_restore_state
	movsd	%xmm1, -64(%rbp)
	call	sqrt@PLT
	movq	.LC1(%rip), %rax
	movsd	-64(%rbp), %xmm1
	pxor	%xmm3, %xmm3
	movq	%rax, %xmm2
	jmp	.L17
.L25:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1822:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_aa, @function
_GLOBAL__sub_I_aa:
.LFB2303:
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
.LFE2303:
	.size	_GLOBAL__sub_I_aa, .-_GLOBAL__sub_I_aa
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_aa
	.globl	aa
	.data
	.align 8
	.type	aa, @object
	.size	aa, 8
aa:
	.long	0
	.long	1074266112
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1072693248
	.align 8
.LC2:
	.long	0
	.long	1093567616
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
