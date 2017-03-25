;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr:function

strchr:
	push rbp
	mov rbp, rsp

	push rdi
	xor rax, rax		; rax = 0
while:				; while (
	cmp byte [rdi + rax], sil	;  *rdi != c
	je done			; )
cwhile:				; {
	cmp byte [rdi + rax], 0	;   if (*(s + rax) == 0)
	je done			;     return 0
	inc rax			;   rax++
	jmp while		; }
done:
	lea rax, [rdi + rax]	; rax = rdi + rax;
	pop rdi

	cmp byte [rax], 0	; if (rax == \0)
	jne return
	xor rax, rax		;   rax = NULL

return:
	leave
	ret			; return rax

