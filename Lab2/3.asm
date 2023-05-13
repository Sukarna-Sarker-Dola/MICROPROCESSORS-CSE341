.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    X DB "Enter First Initial: $"
    Y DB "Enter Second Initial: $"
    Z DB "Enter Third Initial: $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        LEA DX,X            
        MOV AH,9
        INT 21h
        MOV AH,1
        INT 21h
        MOV BL,AL 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h

        
        LEA DX,Y            
        MOV AH,9
        INT 21h
        MOV AH,1
        INT 21h
        MOV CL,AL
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h

        
        LEA DX,Z            
        MOV AH,9
        INT 21h
        MOV AH,1
        INT 21h
        MOV CH,AL 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h

        
        LEA DX,Z            
        MOV AH,9
        INT 21h
        MOV AH,1
        INT 21h
        MOV BH,AL
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h  
        
        MOV DL,BL
        INT 21h
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        MOV DL,CL
        INT 21h
        MOV DL,CH
        INT 21h
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        MOV DL,BH
        INT 21h
        
        
        
        
        

        
        



        
        

         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN