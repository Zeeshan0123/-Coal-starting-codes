[org 0x0100]
jmp start       
data: dw   4, 2, 7
start: 
    mov  cx, 1                          ; make 4 passes, has to be outside the loop! 
    outerloop: 
        mov  bx, 0    
        mov dx,20
        innerloop: 
            mov  ax, [data + bx]
            add dx,ax               
            add  bx, 2
            cmp  bx, 8
            jne  innerloop
        
        sub cx, 1                       ; check outer loop termination 
        jnz outerloop 
                                         
    mov  ax, 0x4c00                     ;  at last exit system call 
    int  0x21