;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr:function

strchr:
	push rbp
	mov rbp, rsp

	push rdi
while:				; while (
	cmp byte [rdi], sil	;  *rdi != c
	je done			; )
cwhile:				; {
	cmp byte [rdi], 0	;   if (*s == 0)
	je done			;     return 0
	inc rdi			;   rax++
	jmp while		; }
done:
	pop rdi

return:
	leave
	ret			; return rax

