[org 0x0100]

mov ax,0xb800
mov es,ax
mov di,0

nextpos:
  mov word[es:di],0x0720
  
  add di,2
  cmp d1,4000
  jne nextpos

  mov ax,0x4c00
  int 0x21