	.file	"test.c"
	.intel_syntax noprefix
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp

	.cfi_def_cfa_register 6
	mov	eax, 0

	
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.ident	"GCC: (SUSE Linux) 4.8.3 20140627 [gcc-4_8-branch revision 212064]"
	.section	.note.GNU-stack,"",@progbits
