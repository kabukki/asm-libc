;; size_t strlen(const char *s);
;; calculates the length of the string s, excluding the terminating null byte ('\0').

section .text
	global strlen

strlen:
	push rbp
	mov rbp, rsp

	mov rax, -1		; rax = -1
_cwhile:			; do {
	inc rax			;   rax++
	cmp byte [rdi+rax], 0x0	; } while (*(s + rax) != 0)
	jne _cwhile

	leave
	ret			; return rax

