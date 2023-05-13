.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
         SUB AX,AX
         SUB CX,CX
         MOV AX,5
         MOV CX,2
         MUL CX
         MOV CX,AX
         ADD BX,4
         SUB BX,0 
         ADD CX,BX          
         MOV DX,5
         ADD DX,3
         ADD DX,2
         ADD CX,DX
         SUB BX,BX 
         MOV AL,6
         MOV BL,2
         DIV BL
         SUB CX,BX
         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN