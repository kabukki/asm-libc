;; size_t strcspn(const char *s, const char *reject);
;; calculates the length (in bytes) of the initial segment of s which consists entirely of bytes not in reject.

section .text
	global strcspn:function

strcspn:
	push rbp
	mov rbp, rsp

	push rdi			; save s because we will modify it
	mov rax, 0			; rax = 0
	cmp byte [rsi], 0		; if (*reject == 0)
	je done				;   return rax;
while:					; while (
	cmp byte [rdi], 0		;  *s != 0
	je done				; )
cwhile:					; {
	lea rdx, [rsi]			;   rdx = reject
_while:					;   while (
	cmp byte [rdx], 0		;    *rdx
	je _done			;   )
_cwhile:				;   {
	mov cl, byte [rdx]
	cmp byte [rdi], cl		;     if (*rdx == *s)
	je _done			;       break ; // character found
	inc rdx				;     rdx++
	jmp _while			;   }
_done:
	cmp byte [rdx], 0		;   if (*rdx != 0) // match
	jne done			;     break ;
	inc rax				;   rax++
	inc rdi				;   s++
	jmp while			; }
done:
	pop rdi				; restore rdi

	leave
	ret				; return rax

