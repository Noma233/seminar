	.file	"pyker_check.cpp"
	.text
	.p2align 4
	.globl	_Z6kerneliPdS_S_S_S_S_S_S_S_S_S_
	.type	_Z6kerneliPdS_S_S_S_S_S_S_S_S_S_, @function
_Z6kerneliPdS_S_S_S_S_S_S_S_S_S_:
.LFB5766:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	56(%rbp), %r15
	pushq	%r14
	.cfi_offset 14, -32
	movq	48(%rbp), %r14
	pushq	%r13
	.cfi_offset 13, -40
	movq	%rcx, %r13
	pushq	%r12
	movq	24(%rbp), %rcx
	.cfi_offset 12, -48
	movq	%rdx, %r12
	pushq	%rbx
	.cfi_offset 3, -56
	movq	16(%rbp), %rdx
	testl	%edi, %edi
	jle	.L2
	vmovapd	.LC0(%rip), %ymm15
	vmovapd	.LC1(%rip), %ymm14
	movq	%rsi, %rbx
	xorl	%r11d, %r11d
	vmovapd	.LC2(%rip), %ymm13
	leal	-1(%rdi), %esi
	.p2align 4,,10
	.p2align 3
.L4:
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovapd	(%rbx,%r11,8), %ymm11
	vmovapd	(%r12,%r11,8), %ymm10
	xorl	%eax, %eax
	vmovapd	0(%r13,%r11,8), %ymm9
	vmovapd	%ymm5, %ymm6
	vmovapd	%ymm5, %ymm7
	vmovapd	%ymm5, %ymm8
	.p2align 4,,10
	.p2align 3
.L3:
	vbroadcastsd	(%r8,%rax,8), %ymm4
	vbroadcastsd	(%rcx,%rax,8), %ymm0
	movq	%rax, %r10
	vbroadcastsd	(%r9,%rax,8), %ymm3
	vbroadcastsd	(%rdx,%rax,8), %ymm2
	addq	$1, %rax
	vsubpd	%ymm4, %ymm11, %ymm4
	vsubpd	%ymm3, %ymm10, %ymm3
	vsubpd	%ymm2, %ymm9, %ymm2
	vfmadd231pd	%ymm4, %ymm4, %ymm0
	vfmadd231pd	%ymm3, %ymm3, %ymm0
	vfmadd231pd	%ymm2, %ymm2, %ymm0
	vdivpd	%ymm0, %ymm15, %ymm0
	vmulpd	%ymm0, %ymm0, %ymm1
	vmulpd	%ymm0, %ymm1, %ymm1
	vmulpd	%ymm1, %ymm0, %ymm0
	vmovapd	%ymm1, %ymm12
	vfmadd132pd	%ymm14, %ymm13, %ymm12
	vmulpd	%ymm12, %ymm0, %ymm0
	vfmadd231pd	%ymm0, %ymm4, %ymm8
	vfmadd231pd	%ymm0, %ymm3, %ymm7
	vfmadd231pd	%ymm0, %ymm2, %ymm6
	vaddpd	.LC3(%rip), %ymm1, %ymm0
	vmulpd	.LC4(%rip), %ymm1, %ymm1
	vfmadd231pd	%ymm1, %ymm0, %ymm5
	cmpq	%r10, %rsi
	jne	.L3
	movq	32(%rbp), %rax
	vmovapd	%ymm8, (%rax,%r11,8)
	movq	40(%rbp), %rax
	vmovapd	%ymm7, (%rax,%r11,8)
	vmovapd	%ymm6, (%r14,%r11,8)
	vmovapd	%ymm5, (%r15,%r11,8)
	addq	$4, %r11
	cmpl	%r11d, %edi
	jg	.L4
	vzeroupper
.L2:
	popq	%rbx
	xorl	%eax, %eax
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5766:
	.size	_Z6kerneliPdS_S_S_S_S_S_S_S_S_S_, .-_Z6kerneliPdS_S_S_S_S_S_S_S_S_S_
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
	.align 32
.LC1:
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.long	0
	.long	1078460416
	.align 32
.LC2:
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.long	0
	.long	-1070071808
	.align 32
.LC3:
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.long	0
	.long	-1074790400
	.align 32
.LC4:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
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
