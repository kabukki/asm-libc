;; void *memmove(void *dest, const void *src, size_t n);
;; copies n bytes from memory area src to memory area dest. The memory areas may overlap: copying takes place as though the bytes in src are first  copied  into  a temporary array that does not overlap src or dest , and the bytes are then copied from the temporary array to dest.

section .text
	global memmove
	extern memcpy

memmove:
	push rbp
	mov rbp, rsp

	push rdi		; save dest to return it later
	mov r8, rdi		; r8 = dest
	mov r9, 0		; r9[]

	mov rdi, r9		; dest = r9
	call memcpy		; memcpy(r9, rsi, rdx);

	mov rdi, r8
	mov rsi, r9
	call memcpy		; memcpy(r8, r9, rdx);

	pop rax			; rax = dest
	leave
	ret			; return rax

