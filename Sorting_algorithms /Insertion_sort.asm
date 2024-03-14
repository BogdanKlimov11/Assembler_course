section .data
    arr db 64, 34, 25, 12, 22, 11, 90
    arr_len equ $ - arr

section .text
    global _start

_start:
    mov rsi, arr
    mov rcx, arr_len
    dec rcx              ; уменьшаем на 1, чтобы использовать счетчик в цикле

outer_loop:
    mov rdi, rsi
    mov rdx, [rsi]       ; ключ

inner_loop:
    mov rax, [rdi - 1]
    cmp rax, rdx
    jle end_inner_loop

    mov [rdi], rax
    sub rdi, 1
    cmp rdi, rsi
    jae inner_loop

end_inner_loop:
    mov [rdi], rdx
    add rsi, 1
    loop outer_loop

    mov eax, 60          ; код выхода
    xor edi, edi         ; статус завершения 0
    syscall
