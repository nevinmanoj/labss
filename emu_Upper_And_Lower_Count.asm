//UPPER AND LOWER COUNT

DATA SEGMENT
    S1 DB "abABAB$"   
    UC DB 00H
    LC DB 00H
DATA ENDS  


CODE SEGMENT
    ASSUME CS:CODE,DS:DATA   
    START:
    MOV AX,DATA
    MOV DS,AX
    
    
    MOV DL,00H  
    MOV DH,00H
    MOV CX,06H
    LEA SI,S1
       
       
    LP:
    MOV AL,[SI]
    
    CMP AL,'A'
    JB V_INC
    
    CMP AL,'Z'
    JA V_INC
    
    INC DH ;INC UPPER COUNT
    INC SI 
    LOOP LP
    JMP EXIT 
     
     
    V_INC:
    INC DL  ;INC LOWER COUNT
    INC SI
    LOOP LP
     
     
    EXIT:
    MOV LC,DL 
    MOV UC,DH  
    MOV AH,4CH
    INT 21H
CODE ENDS
END START