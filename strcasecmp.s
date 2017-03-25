;; int strcasecmp(const char *s1, const char *s2);
;; compares the two strings s1 and s2, ignoring the case of the characters.  It returns an integer less than, equal to, or greater than zero if s1 is found,  respectively,  to  be less than, to match, or be greater than s2.

DEFAULT REL

section .text
	global strcasecmp:function
	extern tolower

strcasecmp:
	push rbp
	mov rbp, rsp

        mov rax, 0			; rax = 0
	mov rcx, 0			; rcx = 0
	mov r8, rdi			; r8 = s1 // backup for call to tolower
_cwhile:				; do {
	movzx rdi, byte [rsi+rcx]
	call tolower wrt ..plt
	lea rdx, [rax]			;   rdx = tolower(*(s2 + rcx))

	movzx rdi, byte [r8+rcx]
	call tolower wrt ..plt		;   rax = tolower(*(s1 + rcx))

	inc rcx				;   rcx++
_while:					; } while (
	cmp al, 0x0			; al != 0
	je _done			;  &&
	cmp dl, 0x0			; dl != 0
	je _done			;  &&
	cmp al, dl			; al == dl)
	je _cwhile
_done:
	sub rax, rdx
return:
	leave
	ret				; return rax
