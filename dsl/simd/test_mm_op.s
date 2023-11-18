	.file	"test_mm_op.cpp"
	.text
	.section	.rodata
	.type	_ZStL19piecewise_construct, @object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.text
	.globl	main
	.type	main, @function
main:
.LFB7803:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	andq	$-32, %rsp
	subq	$104, %rsp
	vmovsd	.LC0(%rip), %xmm0
	vmovsd	%xmm0, -120(%rsp)
	vmovsd	.LC1(%rip), %xmm0
	vmovsd	%xmm0, -112(%rsp)
	vmovsd	-120(%rsp), %xmm0
	vmovsd	%xmm0, -96(%rsp)
	vbroadcastsd	-96(%rsp), %ymm0
	vmovapd	%ymm0, -88(%rsp)
	vmovsd	-112(%rsp), %xmm0
	vmovsd	%xmm0, -104(%rsp)
	vbroadcastsd	-104(%rsp), %ymm0
	vmovapd	%ymm0, -56(%rsp)
	vmovapd	-88(%rsp), %ymm0
	vaddpd	-56(%rsp), %ymm0, %ymm0
	vmovapd	%ymm0, -24(%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, 8(%rsp)
	vbroadcastsd	-120(%rsp), %ymm0
	vmovapd	%ymm0, 8(%rsp)
	vxorpd	%xmm0, %xmm0, %xmm0
	vmovapd	%ymm0, 40(%rsp)
	vbroadcastsd	-112(%rsp), %ymm0
	vmovapd	%ymm0, 40(%rsp)
	vmovsd	-120(%rsp), %xmm0
	vaddsd	-112(%rsp), %xmm0, %xmm0
	vbroadcastsd	%xmm0, %ymm0
	vmovapd	%ymm0, 72(%rsp)
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7803:
	.size	main, .-main
	.type	_Z41__static_initialization_and_destruction_0ii, @function
_Z41__static_initialization_and_destruction_0ii:
.LFB8319:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$1, -4(%rbp)
	jne	.L7
	cmpl	$65535, -8(%rbp)
	jne	.L7
	leaq	_ZStL8__ioinit(%rip), %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	leaq	__dso_handle(%rip), %rdx
	leaq	_ZStL8__ioinit(%rip), %rsi
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rax
	movq	%rax, %rdi
	call	__cxa_atexit@PLT
.L7:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8319:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB8320:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	$65535, %esi
	movl	$1, %edi
	call	_Z41__static_initialization_and_destruction_0ii
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8320:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1073741824
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
