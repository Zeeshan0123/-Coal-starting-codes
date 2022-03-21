[org 0x0100]
jmp start
  multiplicant: db 13 
  multiplier: db 5
start:
    
   mov bl,[multiplicant]
   mov dl,[multiplier]
   mov cl,4
   
   checkbit:
        shl dl,1
        jnc skip
            add [result],bl
        skip:
           shr bl,1
    dec cl
    jne checkbit
 
mov ax,0x4c00
int 0x21