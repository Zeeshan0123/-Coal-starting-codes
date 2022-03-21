[org 0x0100]         
jmp start
 num1: dw 45     ;45=00101101
 result: dw 0    ;lets suppose we have to set that 5th bit of number 45 
start:
  mov ax,[num1]  ;ax=45
  mov bx,1      ;bx=1
  mov cx,4       ; bx will shifts 4 times  
  loop1:          ;execute loop
     shl bx,1    ; at last bx=00010000
     dec cx
     jnz loop1
     or ax,bx     ; 00101101 or 00010000
     mov [result],ax  ; ax will be 00111101   means 5th bit in ax will set to 1
     mov ax,0x4c00   ;end the program
     int 0x21