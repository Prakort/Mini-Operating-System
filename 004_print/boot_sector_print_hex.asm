print_hex:
    pusha
    mov cx, 0; index of variable

    ; we will get the last char of base address
    ; convert it to ASCII

    hex_loop:
    cmp cx, 4 ; loop 4 times
    je end

    mov ax, dx ; ax will be register
    and ax, 0x000f ; 0x1234 to 0x0004 by changing 123 to 000
    add al, 0x30 ; convert it to ASCII
    cmp al, 0x39 ; if bigger 9 , add 8 to hex format "A" to "F"
    jle nextstep
    add al, 7 ; in ASCII 'A' is 65 not 58 then difference is 8

nextstep:
    ; find correct index to place ASCII in the string
    ; base address 'dx' + str.len - char index
    mov bx, HEX_OUT +5 ; base and len
    sub bx, cx ; index variable
    mov [bx], al ; make copy of char on al on bx
    ror dx, 4

    add cx, 1
    jmp hex_loop

end:


    ; prep parameter and call function
    ; input parameter is bx
    mov bx, HEX_OUT
    call print
    popa
    ret

HEX_OUT:
    db '0x0000', 0;
