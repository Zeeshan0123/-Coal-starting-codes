[org 0x0100]

jmp start
 Factorial_D: dw 0
 power_D: dw 0
 Answer: dw 0
start:

mov ax,5
push ax
call Summation
mov ax,0x4c
int 0x21

Summation:
  push bp
  mov bp,sp
  push cx
  push bx
  mov cx,[bp+4]
  mov bx,0

  loop1:
     mov ax,2
     mov dx,-1
     mul bx
     inc ax
     push ax
     call factorial
     push dx
     push bx
     call power
     push word[Factorial_D]
     push word[power_D]
     call Final
     mov[Factorial_D],0
     mov[power_D],0
     inc bx
     loop loop1
  pop bx
  pop cx
  mov sp,bp
  pop bp
  ret 2

factorial:
   push bp
   mov bp,sp
   push ax
   push bx
   push cx
   push dx

   mov bp,sp
   mov ax,[bp+4]
   mov dx,[ax]
   sub dx
   jnz skip
      mov[Factorial_D],ax
      ret 2
   skip:
   mov cx,[ax]
   sub cx
   mov bx,[ax]
   loop2:
      sub bx
      mul bx
      loop loop2
   mov[Factorial_D],ax
   pop dx
   pop cx
   pop bx
   pop ax
   mov sp,bp
   pop bx
   ret 2

power:
  push bp
  mov bp,sp
  push ax
  push bx
  push cx
  push dx

  mov ax,[bp+6]   ;dx
  mov cx,[bp+4]   ;bx

  cmp cx,0
  mov[power_D],1
  pop dx
  pop cx
  pop bx
  pop ax
  mov sp,bp
  pop bp
  ret 4
  
  cmp cx,1
  mov[power_D],-1
  pop dx
  pop cx
  pop bx
  pop ax
  mov sp,bp
  pop bp
  ret 4

  loop3:
     mul ax
     loop loop3
     mov[power_D],ax
     pop dx
     pop cx
     pop bx
     pop ax
     mov sp,bp
     pop bp
     ret 4


final:
  push bp
  mov bp,sp
  push ax
  push bx

  mov ax,[bp+4]     ;power_D
  mov bx,[bp+6]     ;factoral_D
  mul bx
  add [Answer],ax

  pop bx
  pop ax
  mov sp,bp
  pop bp
 
  ret 4 






   