;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr:function

strchr:
	push rbp
	mov rbp, rsp

	mov rax, rdi		; rax = s
	cmp rax, 0x0		; if (rax == NULL)
	je return		;   return rax
while:				; while (
	cmp byte [rax], sil	;  *rax != c
	je done			; )
cwhile:				; {
	cmp byte [rax], 0	;   if (*s == 0)
	je done			;     return 0
	inc rax			;   rax++
	jmp while		; }
done:

return:
	leave
	ret			; return rax

