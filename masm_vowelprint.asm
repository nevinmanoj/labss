DATA SEGMENT
    S1 DB "HELLO$"  
    VC DB 00H   
    m1 db 2 dup ('$')
DATA ENDS  
print macro msg
    mov ah,9
    lea dx,msg
    int 21h
    endm


CODE SEGMENT
    ASSUME CS:CODE,DS:DATA   
    START:
    MOV AX,DATA
    MOV DS,AX
    
    
    MOV DL,00H
    MOV CX,05H
    LEA SI,S1
       
       
    LP:
    MOV AL,[SI]
    
    CMP AL,'A'
    JZ V_INC
    
    CMP AL,'I'
    JZ V_INC
    
    CMP AL,'E'
    JZ V_INC
    
    CMP AL,'O'
    JZ V_INC
    
    CMP AL,'U'
    JZ V_INC
    
    INC SI
    LOOP LP
    JMP EXIT 
     
     
    V_INC:  
    mov m1,AL
    print m1
    INC DL
    INC SI
    LOOP LP
     
     
    EXIT:
    MOV VC,DL   
    MOV AH,4CH
    INT 21H
CODE ENDS
END START