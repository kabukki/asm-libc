;; int toupper(int c);
;; If c is a lowercase letter, tolower() returns its uppercase equivalent, otherwise, it returns c.

section .text
	global toupper

toupper:
	push rbp
	mov rbp, rsp

	mov rax, rdi			; rax = c
	cmp rax, 'a'			; if (rax >= 'a'
	jl _return			;  &&
	cmp rax, 'z'			; rax <= 'z')
	jg _return
	sub rax, 32			;   rax -= 32
_return:
	leave
	ret				; return rax
