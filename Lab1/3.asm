.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    W DB 1
    X DB 2
    Y DB 1
    Z DB 4
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        SUB AX,AX
        SUB CX,CX 
        MOV AL,W
        MOV BL,X
        MOV CL,Y
        MOV DL,Z
        MUL CL
        MOV CL,AL 
        MOV AL,BL
        MUL DL
        MOV BL,AL
        DIV CL
        DIV BL 
        MOV BL,AL
        
        

        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
