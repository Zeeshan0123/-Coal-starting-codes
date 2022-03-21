[org 0x0100]
jmp start
  num1: dw 7,5,4,2
start:
  mov ax,[num1]
  mov bx,0
  mov cx,4
  mov si,0
  mov dx,0
Function:
  call Compare_And_Swap
  add bx,2
  mov ax,[num1+bx]
  add si,2
  mov dx,0
  dec cx
  jnz Function
  mov ax,0x4c00
  int 0x21
  

Compare_And_Swap:
   push ax
   push bx
   push cx
   push si
   push dx
   compare2:
   cmp [num1+bx],ax
   jge skip
     mov ax,[num1+bx]
     mov dx,[bx]
   skip:
    add bx,2
    dec cx
    jnz compare2
   swap:
     mov ax,[num1+dx]
     xchg ax,[num1+s1]
     mov [num1+dx],ax
   pop dx
   pop si
   pop cx
   pop bx
   pop ax
   
  ret


  