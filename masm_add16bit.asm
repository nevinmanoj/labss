data segment
    a dw 9202h
    b dw 9408h
    c dw ?
data ends
 
code segment
    assume cs:code,ds:data
    start:
    mov ax,data
    mov ds,ax
    mov ax,a
    mov bx,b
    add ax,bx
    mov c,ax
    jnc move
    mov dl,01H
    
    move:
    mov byte ptr c+2,dl

int 3
code ends
end start
