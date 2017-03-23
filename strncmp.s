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
	movzx rbx, byte [rsi+rcx]	;   rbx = *(s2 + rcx)
	dec rdx				;   n--
	inc rcx				;   rcx++
while:					; } while (
	cmp al, 0x0			;  al != 0
	je done				;   &&
	cmp bl, 0x0			;  bl != 0
	je done				;   &&
	cmp dl, 0			;  n > 0
	jle done			;   &&
	cmp al, bl			;  al == bl
	je cwhile			; )
done:
	sub rax, rbx			; rax = rax - rbx
return:
	leave
	ret				; return rax

