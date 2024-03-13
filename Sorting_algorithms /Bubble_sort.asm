section .text
    global bubble_sort

bubble_sort:
    push rbp
    mov rbp, rsp
    
    mov r8, rdi                ; Адрес начала массива
    mov r9, rsi                ; Размер массива

    xor r10, r10               ; Флаг swapped
outer_loop:
    xor r11, r11               ; Переменная i
    xor r12, r12               ; Переменная j
inner_loop:
    mov rax, r11
    inc rax
    cmp rax, r9                ; Сравниваем i + 1 с размером массива
    je end_inner_loop          ; Если i + 1 == размеру массива, завершаем внутренний цикл

    mov r13, [r8 + r11 * 4]    ; arr[i]
    mov r14, [r8 + rax * 4]    ; arr[i + 1]
    cmp r13, r14               ; Сравниваем arr[i] с arr[i + 1]
    jle no_swap                ; Если arr[i] <= arr[i + 1], пропускаем обмен

    mov [r8 + r11 * 4], r14    ; arr[i] = arr[i + 1]
    mov [r8 + rax * 4], r13    ; arr[i + 1] = arr[i]
    mov r10, 1                 ; Устанавливаем флаг swapped

no_swap:
    inc r11                    ; Увеличиваем i
    cmp r11, r9                ; Сравниваем i с размером массива
    jl inner_loop              ; Если i < размера массива, продолжаем внутренний цикл

end_inner_loop:
    test r10, r10              ; Проверяем флаг swapped
    jnz outer_loop             ; Если флаг установлен, повторяем внешний цикл

    pop rbp
    ret
