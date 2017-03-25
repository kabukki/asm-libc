;; int strncmp(const char *s1, const char *s2, size_t n);
;; it compares the only first (at most) n bytes of s1 and s2.

section .text
	global strncmp:function

strncmp:
	push rbp
	mov rbp, rsp

        mov rax, 0			; rax = 0
	mov rcx, 0			; rcx = 0
cwhile:					; do {
	movzx rax, byte [rdi+rcx]	;   rax = *(s1 + rcx)
	movzx r8, byte [rsi+rcx]	;   r8 = *(s2 + rcx)
	dec rdx				;   n--
	inc rcx				;   rcx++
while:					; } while (
	cmp al, 0x0			;  al != 0
	je done				;   &&
	cmp r8b, 0x0			;  r8b != 0
	je done				;   &&
	cmp dl, 0			;  n > 0
	jle done			;   &&
	cmp al, r8b			;  al == r8b
	je cwhile			; )
done:
	sub rax, r8			; rax = rax - r8
return:
	leave
	ret				; return rax

