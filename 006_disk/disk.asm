disk_load:
    pusha

    push dx

    mov ah, 0x02 ; ah int 0x13 function and 0x02="read"
    mov al, dh   ; al # of sector to read
    mov cl, 0x02 ; cl sector ( 0x01 - 0x11 ) 0x01 is boot sector and 0x02 is 1st available
    mov ch, 0x00 ; ch : cylinder
    mov dh, 0x00 ; dh : head number


    ; from above call int 0x13
    int 0x13    ; interruption of BIOS
    jc disk_error ; if error store in carry bit

    pop dx
    cmp al, dh
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read" , 0
