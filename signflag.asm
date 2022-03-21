[org 0x0100]
      
  jmp start
    num1: dw 8
    num2: dw 17
  start:
    mov ax,[num1]
    mov bx,[num2]
    sub ax,bx     ;our sign flag will set beacuse result is negative 
    js end
    end:
      mov ax,0x4c00
      int 0x21