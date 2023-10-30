	.file	"setpd.cpp"
	.text
	.p2align 4
	.globl	_Z5setpddddd
	.type	_Z5setpddddd, @function
_Z5setpddddd:
.LFB5533:
	.cfi_startproc
	endbr64
	vunpcklpd	%xmm3, %xmm2, %xmm2
	vunpcklpd	%xmm1, %xmm0, %xmm0
	vinsertf128	$0x1, %xmm2, %ymm0, %ymm0
	ret
	.cfi_endproc
.LFE5533:
	.size	_Z5setpddddd, .-_Z5setpddddd
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
