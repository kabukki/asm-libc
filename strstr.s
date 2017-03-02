;; char *strstr(const char *haystack, const char *needle);
;; finds the first occurrence of the substring needle in the string haystack.

section .text
	global strstr

strstr:
	push rbp
	mov rbp, rsp

	push rdi			; save haystack because we will modify it
	cmp byte [rsi], 0		; if (*needle == 0)
	je done				;   return rax;
while:					; while (
	cmp byte [rdi], 0		;  *haystack != 0
	je done				; )
cwhile:					; {
	mov rax, rdi			;   rax = haystack
	mov rbx, rsi			;   rbx = needle
_while:					;   while (1) {
	mov cl, byte [rbx]
	cmp cl, 0			;     if (*rbx == 0)
	je done				;       return haystack
	cmp byte [rax], cl		;     if (*rbx != *rax)
	jne _done			;       break ;
	inc rax				;     rax++
	inc rbx				;     rbx++
	jmp _while			;   }
_done:
	inc rdi				;   haystack++
	jmp while			; }
done:
	mov rax, rdi			; rax = haystack
	pop rdi				; restore rdi

	leave
	ret				; return rax

