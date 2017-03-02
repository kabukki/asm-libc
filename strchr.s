;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr

strchr:
	push rbp
	mov rbp, rsp

	mov rax, rdi		; rax = s
	jmp _while		; check condition before starting loop
_cwhile:			; while content
	inc rax			;   rax++
_while:				; while (
	cmp byte [rax], 0x0	; *rax != 0
	je _done		;  &&
	cmp byte [rax], sil	; *rax != c)
	jne _cwhile
_done:
	leave
	ret			; return rax

