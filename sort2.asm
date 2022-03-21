[org 0x0100]

jmp start       

data: dw   6, 4, 5, 2


start: 
    mov  cx, 4                          
    outerloop: 
        mov  bx, 0    
        innerloop: 
            mov  ax, [data + bx]
            cmp  ax, [data + bx + 2]    

            jge  noswap                 
                                        
                ; the swap potion 
                mov  dx, [data + bx + 2]
                mov  [data + bx + 2], ax    ; 
                mov  [data + bx], dx

            noswap:
            add  bx, 2
            cmp  bx, 6
            jne  innerloop
      
        sub cx, 1    ; check outer loop termination 
        jnz outerloop 

    
    mov  ax, 0x4c00      ; exit system call 
    int  0x21