section .text
	global write:function

write:
	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall
	
	mov rsp, rbp
	pop rbp
	ret
