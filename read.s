section .text
        global read:function

write:
        push rbp
        mov rbp, rsp

        mov rax, 0
        syscall

        mov rsp, rbp
        pop rbp
        ret
