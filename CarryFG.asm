jmp start
       num1: db 316
       num2: db 334
    start:
        mov ax,[num1]
        mov bx,[num2]
        add ax,bx
        jnc last        ;here our carry flag will set due to overflow 
    last:
        mov ax,0x4c00
        int 0x21