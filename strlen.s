;; size_t strlen(const char *s);
;; calculates the length of the string s, excluding the terminating null byte ('\0').

section .text
	global strlen:function

strlen:
	push rbp
	mov rbp, rsp

	mov rax, 0		; rax = 0
while:				; while (
	cmp byte [rdi+rax], 0	;  *(s + rax) != 0
	je done			; )
cwhile:				; {
	inc rax			;   rax++
	jne while		; }
done:
	leave
	ret			; return rax

