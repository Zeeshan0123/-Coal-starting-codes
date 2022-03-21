[org 0x0100]
jmp start
     message: db 'Hello World'
     lenght: dw 11  
     clrscr:
       push ax
       push es
       push di
       mov ax,0xb800
       mov es,ax
       mov di,0
       nextloc:
           mov word[es:di],0x0720
           add di,2
           cmp di,4000
           jne nextloc
       pop di
       pop es
       pop ax
start:
  call clrscr
  mov ah,0x1
  int 0x21
  mov ax,0x4c00
  int 0x21