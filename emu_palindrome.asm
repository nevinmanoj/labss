data segment
    abc dd 12345678h
    def dd 9ABCDEF0h
    ghi dw ?
data ends
 
code segment
    assume cs:code, ds:data
    start:
    mov ax,data
    mov ds,ax
    mov dl,00h
    mov ax, word ptr abc
    mov bx, word ptr def
    sub ax,bx
    mov word ptr ghi,ax
    mov ax, word ptr abc+2
    mov bx, word ptr def+2
    sbb ax,bx
    mov word ptr ghi+2,ax
    jnc move
    
    inc dl
    
    move:
    mov byte ptr ghi+4,dl
    int 3h
code ends
end start

