;; char *strpbrk(const char *s, const char *accept);
;; locates the first occurrence in the string s of any of the bytes in the string accept.

section .text
	global strpbrk

strpbrk:
	push rbp
	mov rbp, rsp

	push rdi			; save s because we will modify it
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
	pop rdi				; restore rdi

	leave
	ret				; return rax

