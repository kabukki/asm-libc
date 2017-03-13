;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr:function

strchr:
	push rbp
	mov rbp, rsp

	mov rax, rdi		; rax = s
while:				; while (
	cmp byte [rax], 0	;  *rax != 0
	je done			;   &&
	cmp byte [rax], sil	;  *rax != c
	je done			; )
cwhile:				; {
	inc rax			;   rax++
	jmp while		; }
done:
	cmp byte [rax], 0	; if (*rax == 0)
	jne return
	mov rax, 0x0		;   rax = NULL;
return:
	leave
	ret			; return rax

