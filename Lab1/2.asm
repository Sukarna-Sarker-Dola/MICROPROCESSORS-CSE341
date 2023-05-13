.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    A DB 5
    B DB 0
    C DB 6
    D DB 2
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        SUB AX,AX
        SUB CX,CX 
        MOV AL,A
        MOV BL,B
        MOV CL,C
        MOV DL,D
        SUB CL,AL
        SUB AL,CL 
        ADD DL,AL
        
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN