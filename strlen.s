section .data
	

section .text
	global _start

_printRBX:
	mov rax, 1		; sys_write
	mov rdi, 1		; stdout
	mov rsi, [edi]		; argv[0]
	mov r10, 1		; longueur de la chaine 
	syscall
	ret

_start:
	mov rbx, rsp
	add rbx, 32		; argv

	call _printRBX

	mov rax, 60
	mov rdi, 0
	syscall
	ret
	
