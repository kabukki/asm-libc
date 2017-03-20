;; int tolower(int c);
;; If c is a uppercase letter, tolower() returns its lowercase equivalent, otherwise, it returns c.

section .text
	global tolower:function

tolower:
	push rbp
	mov rbp, rsp

	mov rax, rdi
	cmp rax, 'A'			; if (rax >= 'A'
	jl return			;  &&
	cmp rax, 'Z'			; rax <= 'Z')
	jg return
	add rax, byte 'a' - 'A'		;   rax += 32
return:
	leave
	ret				; return rax
