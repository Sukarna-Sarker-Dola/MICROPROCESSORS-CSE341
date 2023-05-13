.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    X DB "The result is$"
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
        SUB BX,BX
        SUB CX,CX
        
        MOV AH,01H
        INT 21h
        MOV AH, 0  
        SUB AL, 48         
        MOV CL,AL 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h

        
        MOV AH,01H
        INT 21h
        MOV AH, 0  
        SUB AL, 48                  
        MOV BL,AL
                 
                 
        MOV DL,0Dh
        MOV AH,2
        INT 21h
        MOV DL,0Ah
        MOV AH,2
        INT 21h
        LEA DX,X
        MOV AH,9
        INT 21h
        SUB DX,DX 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        
         
        ADD CL,BL
        ADD CL,48
        MOV DL,CL
        

        MOV AH,2       
        INT 21h
                        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
