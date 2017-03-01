;; void *memmove(void *dest, const void *src, size_t n);
;; copies n bytes from memory area src to memory area dest. The memory areas may overlap: copying takes place as though the bytes in src are first  copied  into  a temporary array that does not overlap src or dest , and the bytes are then copied from the temporary array to dest.

DEFAULT REL

section .text
	global memmove
	extern memcpy

memmove:
	push rbp
	mov rbp, rsp

	push rdi		; save dest to return it later
	cmp rdx, 0
	je _return		; if (n == 0) return
	cmp rdi, rsi
	je _return		; if (dest == src) return
	jg _backward		; if (dest > src) backward else forward
_forward:
				; copie dans rdi les donnees de rsi (src)
	call memcpy wrt ..plt	; memcpy(rdi, rsi, rdx);
	jmp _return
_backward:
	mov r8, rdi		; r8 = dest
	mov r9, rsi		; r9 = src
	mov r10, rdx		; r10 = n
_while:				; do {
	dec r10			; r10--
	mov al, BYTE [r9+r10]
	mov BYTE [r8], al	; *r8 = *(r9 + r10)
	inc r8
	inc r9

	cmp r10, 0
	jne _while		; } while (n > 0);

_return:
	pop rax			; rax = dest
	leave
	ret			; return rax

