;; int strcasecmp(const char *s1, const char *s2);
;; compares the two strings s1 and s2, ignoring the case of the characters.  It returns an integer less than, equal to, or greater than zero if s1 is found,  respectively,  to  be less than, to match, or be greater than s2.

DEFAULT REL

section .text
	global strcasecmp
	extern tolower

strcasecmp:
	push rbp
	mov rbp, rsp

	mov rcx, 0			; rcx = 0
	mov r8, rdi			; r8 = s1 // backup for call to tolower
_cwhile:				; do {
	movzx rdi, byte [rsi+rcx]
	call tolower wrt ..plt
	mov rbx, rax			;   rbx = tolower(*(s2 + rcx))

	movzx rdi, byte [r8+rcx]
	call tolower wrt ..plt		;   rax = tolower(*(s1 + rcx))

	inc rcx				;   rcx++
_while:					; } while (
	cmp al, 0x0			; al != 0
	je _done			;  &&
	cmp bl, 0x0			; bl != 0
	je _done			;  &&
	cmp al, bl			; al == bl)
	je _cwhile
_done:
	sub rax, rbx

	leave
	ret				; return rax
