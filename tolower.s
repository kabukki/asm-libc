;; int tolower(int c);
;; If c is a uppercase letter, tolower() returns its lowercase equivalent, otherwise, it returns c.

section .text
	global tolower

tolower:
	push rbp
	mov rbp, rsp

	mov rax, rdi			; rax = c
	cmp rax, 'A'			; if (rax >= 'A'
	jl _return			;  &&
	cmp rax, 'Z'			; rax <= 'Z')
	jg _return
	add rax, 32			;   rax += 32
_return:
	leave
	ret				; return rax
