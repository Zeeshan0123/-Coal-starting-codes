[org 0x0100]
  mov ax,[num1]
  mov [result],ax
  mov ax,[num1+2]
  mov [result],ax
  mov ax,[num1+4]
  mov [result],ax

  mov ax,0x4c00
  int 0x21
 
  num1: dw 5,10,15
  result: dw 0