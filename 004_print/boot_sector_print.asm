print:
    pusha

start:
    mov al, [bx] ; base address is bx
    cmp al, 0
    je done

    mov ah, 0x0e ; using BIOS to aide
    int 0x10

    add bx, 1 ; will increment point
    jmp start

done:
    popa
    ret

print_nl:
    pusha

    mov ah, 0x0e
    mov al, 0x0a ; '\n' newline
    int 0x10
    mov al, 0x0d
    int 0x10

    popa
    ret 
