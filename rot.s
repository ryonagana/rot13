	.file	"rot.cc"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Invalid String"
.LC1:
	.string	"%s\n"
	.text
	.globl	_Z5rot13Pc
	.type	_Z5rot13Pc, @function
_Z5rot13Pc:
.LFB29:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	test	rdi, rdi
	jne	.L2
	mov	rsi, QWORD PTR stderr[rip]
	mov	edi, OFFSET FLAT:.LC0
	call	fputs
	mov	edi, 1
	call	exit
.L2:
	mov	r12, rdi
	call	strlen
	mov	rdx, r12
	dec	eax
	cdqe
	mov	BYTE PTR [r12+1+rax], 0
.L8:
	mov	al, BYTE PTR [rdx]
	test	al, al
	je	.L3
	lea	ecx, [rax-97]
	cmp	cl, 13
	jbe	.L12
	lea	ecx, [rax-65]
	cmp	cl, 13
	ja	.L6
.L12:
	add	eax, 13
	jmp	.L10
.L6:
	lea	ecx, [rax-78]
	cmp	cl, 12
	jbe	.L11
	lea	ecx, [rax-110]
	cmp	cl, 12
	ja	.L5
.L11:
	sub	eax, 13
.L10:
	mov	BYTE PTR [rdx], al
.L5:
	inc	rdx
	jmp	.L8
.L3:
	mov	rdi, QWORD PTR stdout[rip]
	mov	rdx, r12
	mov	esi, OFFSET FLAT:.LC1
	xor	eax, eax
	pop	r12
	.cfi_def_cfa_offset 8
	jmp	fprintf
	.cfi_endproc
.LFE29:
	.size	_Z5rot13Pc, .-_Z5rot13Pc
	.section	.rodata.str1.1
.LC2:
	.string	" "
	.text
	.globl	_Z12process_argsiPPcS_
	.type	_Z12process_argsiPPcS_, @function
_Z12process_argsiPPcS_:
.LFB30:
	.cfi_startproc
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	mov	r13d, edi
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	mov	rbp, rdx
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rax, QWORD PTR [rsi]
	mov	rbx, rsi
	cmp	BYTE PTR [rax], 45
	jne	.L15
	mov	rax, QWORD PTR [rsi+8]
	cmp	BYTE PTR [rax], 45
	jne	.L15
	mov	rax, QWORD PTR [rsi+16]
	cmp	BYTE PTR [rax], 100
	jne	.L15
	mov	DWORD PTR debug_mode[rip], 1
	mov	DWORD PTR has_args[rip], 1
.L15:
	cmp	DWORD PTR has_args[rip], 0
	jne	.L19
	xor	r12d, r12d
.L18:
	inc	r12
	cmp	r13d, r12d
	jle	.L14
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rbp
	call	strcat
	mov	r14, QWORD PTR [rbx+r12*8]
	mov	rdi, r14
	call	strlen
	mov	rsi, r14
	mov	rdi, rbp
	mov	rdx, rax
	call	strncat
	jmp	.L18
.L19:
	mov	r12d, 2
.L16:
	cmp	r13d, r12d
	jle	.L14
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rbp
	call	strcat
	mov	r14, QWORD PTR [rbx+r12*8]
	inc	r12
	mov	rdi, r14
	call	strlen
	mov	rsi, r14
	mov	rdi, rbp
	mov	rdx, rax
	call	strncat
	jmp	.L16
.L14:
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE30:
	.size	_Z12process_argsiPPcS_, .-_Z12process_argsiPPcS_
	.globl	_Z10read_inputPc
	.type	_Z10read_inputPc, @function
_Z10read_inputPc:
.LFB31:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	sub	rsp, 24
	.cfi_def_cfa_offset 48
	mov	QWORD PTR [rsp], 0
	mov	QWORD PTR [rsp+8], 0
.L23:
	mov	rdx, QWORD PTR stdin[rip]
	lea	rsi, [rsp+8]
	mov	rdi, rsp
	call	getline
	inc	rax
	je	.L21
	mov	esi, OFFSET FLAT:.LC2
	mov	rdi, rbx
	call	strcat
	mov	rbp, QWORD PTR [rsp]
	mov	rdi, rbp
	call	strlen
	mov	rdi, rbx
	mov	rsi, rbp
	mov	rdx, rax
	call	strncat
	mov	rdi, rbp
	call	free
	jmp	.L23
.L21:
	add	rsp, 24
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE31:
	.size	_Z10read_inputPc, .-_Z10read_inputPc
	.section	.rodata.str1.1
.LC3:
	.string	"DEBUG"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB32:
	.cfi_startproc
	sub	rsp, 2056
	.cfi_def_cfa_offset 2064
	mov	r8d, edi
	xorps	xmm0, xmm0
	xor	eax, eax
	lea	rdi, [rsp+16]
	mov	ecx, 508
	movups	XMMWORD PTR [rsp], xmm0
	rep stosd
	cmp	r8d, 1
	jle	.L26
	mov	rdx, rsp
	mov	edi, r8d
	call	_Z12process_argsiPPcS_
	cmp	DWORD PTR has_args[rip], 0
	je	.L27
	cmp	DWORD PTR debug_mode[rip], 0
	je	.L27
	mov	edi, OFFSET FLAT:.LC3
	xor	eax, eax
	call	printf
	mov	rsi, QWORD PTR stdout[rip]
	mov	rdi, rsp
	call	fputs
.L27:
	mov	rdi, rsp
	call	_Z5rot13Pc
	xor	edi, edi
	call	exit
.L26:
	mov	rdi, rsp
	call	_Z10read_inputPc
	mov	rdi, rsp
	call	_Z5rot13Pc
	xor	eax, eax
	add	rsp, 2056
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE32:
	.size	main, .-main
	.globl	has_args
	.bss
	.align 4
	.type	has_args, @object
	.size	has_args, 4
has_args:
	.zero	4
	.globl	debug_mode
	.align 4
	.type	debug_mode, @object
	.size	debug_mode, 4
debug_mode:
	.zero	4
	.ident	"GCC: (GNU) 10.2.1 20201125 (Red Hat 10.2.1-9)"
	.section	.note.GNU-stack,"",@progbits
