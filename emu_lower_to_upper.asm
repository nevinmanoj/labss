data segment
    s1 db "hello$"
    s2 db 6 dup ('$')
data ends
print macro msg
    mov ah,9
    lea dx,msg
    int 21h 
    endm
code segment
    assume cs:code, ds:data
    start:
    mov ax,data
    mov ds,ax
    lea si,s1  
    lea di,s2
    mov cx,05h
   lp:mov al,[si]
    sub al,20h
    mov [di],al
    inc si
    inc di
    loop lp
    print s2
    mov ah,4ch
    int 21h
    code ends
end start
    
    