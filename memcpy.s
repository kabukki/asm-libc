;; void *memcpy(void *dest, const void *src, size_t n);
;; copies n bytes from memory area src to memory area dest. The memory areas must not overlap.

section .text
	global memcpy

memcpy:
	push rbp
	mov rbp, rsp

	push rdi		; save dest to return it later
	mov r8, rdi		; r8 = dest
	mov r9, rsi		; r9 = src
	mov r10, rdx		; r10 = n

_while:				; while (n > 0)
	cmp r10, 0		; n > 0
	jle _done
_cwhile:			; {
	mov al, BYTE [r9]
	mov BYTE [r8], al	;   *r8 = *r9
	inc r8			;   r8++
	inc r9			;   r9++
	dec r10			;   r10--
	jmp _while		; }
_done:
	pop rax			; rax = dest
	leave
	ret			; return rax

