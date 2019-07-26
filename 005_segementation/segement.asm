mov ah, 0x0e; tty
mov al, [the_secret]
int 0x10

mov bx, 0x700
mov ds, bx ; copy data to bx

mov al, [the_secret]
int 0x10

mov al, [es:the_secret]
int 0x10

mov bx, 0x7c0
mov es, bx
mov al, [es:the_secret]
int 0x10

jmp $
the_secret:
    db "H"

times 510-($-$$) db 0
dw 0xaa55
