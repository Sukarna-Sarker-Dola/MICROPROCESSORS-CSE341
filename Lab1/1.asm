.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        MOV BX,9
        MOV AX,5 
        ADD AX,BX
        SUB DX,BX 
        ADD DX,AX
        SUB AX,DX
        SUB BX,BX
        ADD BX,DX
        
        
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN