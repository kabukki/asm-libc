;; void *memset(void *s, int c, size_t n);
;; fills the first n bytes of the memory area pointed to by s with the constant byte c.

section	.text
	global	memset:function

memset:
	push rbp
	mov rbp, rsp

	push rdi		; save s to return it later
	mov r8, rdi		; r8 = s
	mov r9, rsi		; r9 = c
	mov r10, rdx		; r10 = n
	jmp _while
_cwhile:			; {
	mov BYTE [r8], r9b	;   *r8 = r9
	inc r8			;   r8++
	dec r10			;   r10--
_while:				; while (n > 0)
	cmp r10, 0		; n > 0
	jg _cwhile

	pop rax			; rax = s
	leave
	ret			; return rax
