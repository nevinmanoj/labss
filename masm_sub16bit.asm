data segment
    a dw 9203h
    b dw 9202h
    c dw ?
    brw db 00H
data ends
 
code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    mov ax,a
    mov bx,b
    sub ax,bx
    mov c,ax
    jnc move
    mov dl,01H
    
    move:
    mov byte ptr brw,dl

int 3
code ends
end start  
