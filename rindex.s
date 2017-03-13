;; char *rindex(const char *s, int c);
;; returns a pointer to the last occurrence of the character c in the string s.

section .text
	global rindex:function

rindex:
	push rbp
	mov rbp, rsp

	mov rax, 0x0		; rax = 0
	push rdi		; save s because we will modify it
cwhile:				; while (1) {
	cmp byte [rdi], sil	;   if (*s == c)
	cmove rax, rdi		;     rax = s;
	cmp byte [rdi], 0	;   if (*s == 0)
	je done			;     break ;
	inc rdi			;   s++
	jmp cwhile		; }
done:
	pop rdi			; restore original s

	leave
	ret			; return rax

