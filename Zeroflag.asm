[org 0x0100]
 jmp start 
     num1: dw 10
     num2: dw 10
     start:
         mov ax, [num1]
         mov bx, [num2]
         sub ax,bx           ;zf flag is set when destination will be equal to zero
         jz last                     
         
         last:
             mov ax,0x4c00
             int 0x21