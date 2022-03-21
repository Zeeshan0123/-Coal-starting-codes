[org 0x0100]         
jmp start
 num1: db 45     ;45=00101101
 result: db 0    ;lets suppose we have to Clear the 6th bit of number 45 
start:
  mov ax,[num1]  ;ax=45
  mov bx,1      ;bx=1
  mov cx,5       ; bx will shifts 5 times  
  loop1:          ;execute loop
     shl bx,1    ; at last bx=00010000
     dec cx
     jnz loop1
     NOT bx     ; bx will change to 11101111
     and ax,bx  ; ax=00001101
     mov [result],ax  ; ax will be 00001101   means 5th bit in ax will be cleared successfully 
     mov ax,0x4c00   ;end the program
     int 0x21