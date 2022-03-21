[org 0x0100] ; This is a .com file, not an .exe. DOS .com files start at 100h 

mov ax,6 ; move 6 in ax registere

add ax,6 ; calculate sum

add ax,6 

add ax,6

add ax,6

add ax,6 ; ax = 36

mov ax, 0x4c00 ; stop the program

int 0x21; interept to stop a program