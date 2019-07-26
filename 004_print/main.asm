[org 0x7c00] ; offset

; make sure the parameter and function are ready to call

mov bx, print_func01
call print

call print_nl ; newline

mov bx, print_func02
call print

call print_nl ; newline

mov bx, print_func03
call print

call print_nl ; newline

mov dx, 0x12fe
call print_hex

jmp $




%include "boot_sector_print.asm"
%include "boot_sector_print_hex.asm"


print_func01:
    db 'Hello, Prakort', 0

print_func02:
    db 'Welcome !!', 0

print_func03:
    db 'Please enjoy coding......'




times 510-($-$$) db 0
dw 0xaa55
