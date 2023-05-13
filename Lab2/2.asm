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
        
        MOV AH,01H
        INT 21h
        MOV CL,AL 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        SUB DX,DX
        MOV DL,00
        INT 21h

        
        MOV BL,32
        SUB CL,BL
        MOV DL,CL
        
        MOV AH,2       
        INT 21h
                       
 
        

         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN