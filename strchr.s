;; char *strchr(const char *s, char c);
;; returns  a  pointer  to the first occurrence of the character c in the string s.

section .text
	global strchr

strchr:
	push rbp
	mov rbp, rsp

	mov rax, rdi		; rax = s
	mov r9, rsi		; r9 = c
	jmp _while		; check condition before starting loop
_cwhile:			; while content
	inc rax			;   rax++
_while:				; while (*r8 != 0x0 && *r8 != r9)
	mov cl, [rax]
	cmp cl, 0x0
	je _done
	cmp cl, r9b
	je _done
	jmp _cwhile
_done:
	leave
	ret			; return rax

