;; char *strstr(const char *haystack, const char *needle);
;; finds the first occurrence of the substring needle in the string haystack.

section .text
	global strstr:function

strstr:
	push rbp
	mov rbp, rsp

	push rdi			; save haystack because we will modify it
	mov rax, 0			; rax = NULL
	cmp byte [rsi], 0		; if (*needle == 0)
	je done				;   return rax;
while:					; while (
	cmp byte [rdi], 0		;  *haystack != 0
	je done				; )
cwhile:					; {
	mov rax, rdi			;   rax = haystack
	mov rdx, rsi			;   rdx = needle
_while:					;   while (1) {
	mov cl, byte [rdx]
	cmp cl, 0			;     if (*rdx == 0)
	je done				;       return haystack
	cmp byte [rax], cl		;     if (*rdx != *rax)
	jne _done			;       break ;
	inc rax				;     rax++
	inc rdx				;     rdx++
	jmp _while			;   }
_done:
	inc rdi				;   haystack++
	jmp while			; }
done:
	mov rax, rdi			; rax = haystack
	cmp byte [rax], 0		; if (*rax == 0)
	jne return
	mov rax, 0x0			;   rax = NULL;
return:
	pop rdi				; restore rdi

	leave
	ret				; return rax

