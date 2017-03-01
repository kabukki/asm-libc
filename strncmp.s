;; int strncmp(const char *s1, const char *s2, size_t n);
;; it compares the only first (at most) n bytes of s1 and s2.

section .text
	global strncmp

strncmp:
	push rbp
	mov rbp, rsp

	mov rcx, 0			; rcx = 0
_cwhile:				; do {
	movzx rax, byte [rdi+rcx]	;   rax = *(s1 + rcx)
	movzx rbx, byte [rsi+rcx]	;   rbx = *(s2 + rcx)
	dec rdx				;   n--
	inc rcx				;   rcx++
_while:					; } while (
	cmp al, 0x0			; al != 0
	je _done			;  &&
	cmp bl, 0x0			; bl != 0
	je _done			;  &&
	cmp dl, 0			; n > 0
	jle _done			;  &&
	cmp al, bl			; al == bl)
	je _cwhile
_done:
	sub rax, rbx

	leave
	ret				; return rax

