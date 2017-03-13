;; int toupper(int c);
;; If c is a lowercase letter, tolower() returns its uppercase equivalent, otherwise, it returns c.

section .text
	global toupper

toupper:
	push rbp
	mov rbp, rsp

	mov rax, rdi			; rax = c
	cmp rax, 'a'			; if (rax >= 'a'
	jl return			;  &&
	cmp rax, 'z'			; rax <= 'z')
	jg return
	sub rax, byte 'a' - 'A'		;   rax -= 32
return:
	leave
	ret				; return rax
