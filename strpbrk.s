;; char *strpbrk(const char *s, const char *accept);
;; locates the first occurrence in the string s of any of the bytes in the string accept.
;; returns a pointer to the byte in s that matches one  of  the bytes in accept, or NULL if no such byte is found.

section .text
	global strpbrk:function

strpbrk:
	push rbp
	mov rbp, rsp

	push rdi			; save s because we will modify it
	mov rax, 0			; rax = NULL
	cmp byte [rsi], 0		; if (*accept == 0)
	je done				;   return rax;
while:					; while (
	cmp byte [rdi], 0		;  *s != 0
	je done				; )
cwhile:					; {
	mov rbx, rsi			;   rbx = accept
_while:					;   while (
	cmp byte [rbx], 0		;    *rbx
	je _done			;   )
_cwhile:				;   {
	mov cl, byte [rbx]
	cmp byte [rdi], cl		;     if (*rbx == *s)
	je done				;       return rax ;
	inc rbx				;     rbx++
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

