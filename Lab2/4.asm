.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE
    X DB "ENTER FIRST HEX DIGIT: $"
    Y DB "ENTER SECOND HEX DIGIT: $"
    Z DB "IN DECIMAL SUBTRACTION IS $"
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
        
        MOV DL,49
        SUB BL,DL
        SUB CL,DL
        SUB BL,CL
        
        
        ADD BL,48
        MOV DL,BL
        
        MOV AH,2       
        INT 21h

        

        

         
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN