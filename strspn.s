;; size_t strspn(const char *s, const char *accept);
;; calculates the length (in bytes) of the initial segment of s which consists entirely of bytes in accept.

section .text
	global strspn:function

strspn:
	push rbp
	mov rbp, rsp

	push rdi			; save s because we will modify it
	mov rax, 0			; rax = 0
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
	je _done			;       break ; // character found
	inc rbx				;     rbx++
	jmp _while			;   }
_done:
	cmp byte [rbx], 0		;   if (*rbx == 0) // no match
	je done				;     break ;
	inc rax				;   rax++
	inc rdi				;   s++
	jmp while			; }
done:
	pop rdi				; restore rdi

	leave
	ret				; return rax

