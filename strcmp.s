;; int strcmp(const char *s1, const char *s2);
;; compares the two strings s1 and s2. It returns an integer less than, equal to, or greater than zero if s1 is found, respectively, to be less than, to match, or be greater than s2.

section .text
	global strcmp

strcmp:
	push rbp
	mov rbp, rsp

	mov rax, 0		; rax = 0
	mov r8, rdi		; r8 = s1
	mov r9, rsi		; r9 = s2
	jmp _while
_cwhile:			; {
	inc r8			;   r8++
	inc r9			;   r9++
_while:				; while (*r8 != 0 && *r9 != 0 && *r8 == *r9)
	mov cl, [r8]
	mov dl, [r9]

	cmp cl, 0x0		; *r8 != 0
	je _done
	cmp dl, 0x0		; *r9 != 0
	je _done
	cmp cl, dl		; *r8 != *r9
	je _cwhile
	jmp _done
_done:				; }
	cmp cl, dl
	je _equal		; if (*r8 == *r9)
	jl _less		; else if (*r8 < *r9)
_more:				; else // sous-entendu *r8 > *r9
	mov rax, 1		; rax = 1
	jmp _return
_less:
	mov rax, -1		; rax = -1
	jmp _return
_equal:
	mov rax, 0		; rax = 0;
	jmp _return

_return:
	leave
	ret			; return rax

