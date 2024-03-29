section .data
    arr db 64, 34, 25, 12, 22, 11, 90
    arr_len equ $ - arr

section .text
    global _start

_start:
    mov esi, arr       ; адрес начала массива
    mov ecx, arr_len   ; количество элементов в массиве

outer_loop:
    mov edi, esi       ; адрес минимального элемента
    mov edx, ecx       ; количество оставшихся элементов

inner_loop:
    inc edi            ; переходим к следующему элементу
    dec edx            ; уменьшаем счетчик оставшихся элементов
    cmp edx, 0         ; если все элементы проверены, завершаем внутренний цикл
    je end_inner_loop

    mov al, [edi]      ; загружаем текущий элемент в AL
    cmp al, [esi]      ; сравниваем его с минимальным элементом
    jge inner_loop     ; если текущий элемент больше или равен минимальному, продолжаем внутренний цикл

    mov esi, edi       ; обновляем адрес минимального элемента
    jmp inner_loop     ; продолжаем внутренний цикл

end_inner_loop:
    mov al, [esi]      ; загружаем минимальный элемент в AL
    xchg al, [arr]     ; обмениваем его с первым элементом массива
    xchg al, [esi]     ; обмениваем его обратно с минимальным элементом
    inc esi            ; переходим к следующему элементу
    loop outer_loop    ; продолжаем внешний цикл
