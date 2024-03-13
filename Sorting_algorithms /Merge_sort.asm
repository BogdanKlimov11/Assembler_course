section .text
    global merge_sort

merge_sort:
    push rbp
    mov rbp, rsp
    
    mov rdi, rdx        ; arr
    mov rsi, rcx        ; left
    mov rdx, r8         ; right

    cmp rsi, rdx
    jge .exit           ; if left >= right, return

    sub rdx, rsi        ; rdx = right - left
    shr rdx, 1          ; rdx = (right - left) / 2
    inc rdx             ; rdx = mid

    push rdx            ; save mid
    push rsi            ; save left

    call merge_sort     ; merge_sort(arr, left, mid)

    pop rsi             ; restore left
    pop rdx             ; restore mid

    inc rdx             ; rdx = mid + 1

    push rdx            ; save mid + 1
    push rsi            ; save left

    call merge_sort     ; merge_sort(arr, mid + 1, right)

    pop rsi             ; restore left
    pop rdx             ; restore mid + 1

    call merge          ; merge(arr, left, mid, right)

.exit:
    pop rbp
    ret
