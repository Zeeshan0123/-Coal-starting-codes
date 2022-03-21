[org 0x0100]
jmp start
 num1: dw 45     ;45=00101101
 result: dw 0
start:
  mov ax,[num1]  ;ax=45
  mov bx,1      ;bx=1
  mov cx,5       ; bx will shifts 5 times  
  loop1:          ;execute loop
     shl bx,1    ; at last bx=00100000
     dec cx
     jnz loop1
     and ax,bx     ; 00101101 and 00100000
     mov [result],ax  ; ax will be  00100000 means 6th bit in ax is 1 but if 6th bit is not 1 then ax=000000000
     mov ax,0x4c00   ;end the program
     int 0x21