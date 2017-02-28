;; size_t strlen(const char *s);
;; calculates the length of the string s, excluding the terminating null byte ('\0').

section .text
	global strlen

strlen:
	push rbp
	mov rbp, rsp

	mov rax, 0		; rax = 0
	mov r8, rdi		; r8 = str
	jmp _while		; check condition before starting loop
_cwhile:			; while content
	inc r8			;   r8++
	inc rax			;   rax++
_while:				; while (*r8 != 0x0)
	mov cl, [r8]
	cmp cl, 0x0
	jne _cwhile

	leave
	ret			; return rax

