Reverse a string:
data segment
    s1 db "hello$"
    s2 db 6 dup ('$')
    m1 db 'original:$'
    m2 db 'reversed:$'
data ends  


print macro msg
    mov ah,9
    lea dx,msg
    int 21h
endm       


code segment
    assume cs:code,ds:data   
    start:
    mov ax,data
    mov ds,ax
    
      
    print m1
    print s1
    
    
    mov cx,05h
    lea SI,s2
    lea DI,s1
    add DI,04h
lp: mov al,[DI]
    mov [SI],al 
    inc SI
    dec DI
    loop lp 
    
    
    print m2
    print s2
    
    
    mov ah,4ch
    int 21h
code ends
end start