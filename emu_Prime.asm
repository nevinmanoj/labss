//PRIME OR NOT-PRIME

DATA SEGMENT
    NUM DB 04H
    M1 DB "NUMBER IS PRIME$"
    M2 DB "NUMBER IS NOT PRIME$"
DATA ENDS  
 
     
PRINT MACRO MSG
    MOV AH,09H
    LEA DX,MSG
    INT 21H
ENDM    
     
     
CODE SEGMENT
    ASSUME CS:CODE,DS:DATA   
    START:
    MOV AX,DATA
    MOV DS,AX
    
    MOV AL,NUM
    MOV BL,02H
    MOV AH,00H
    
    CMP AL,02H
    JC NOT_PRIME 
    
    CMP AL,02H
    JZ PRIME
          
    LP:
    DIV BL
    CMP AH,00H
    JE NOT_PRIME
    
    MOV AX,0000H
    MOV AL,NUM 
    INC BL
    CMP AL,BL
    JNE LP 
     
    PRIME:
    PRINT M1     
    JMP EXIT
       
    NOT_PRIME:
    PRINT M2
    
    EXIT: 
    MOV AH,4CH
    INT 21H
CODE ENDS
END START