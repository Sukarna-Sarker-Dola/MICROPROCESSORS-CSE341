.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    X DB "1st Input: $"
    Y DB "2nd Input: $"
    S DB "Divisible $"
    T DB "Not Divisible $"

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE
        SUB AX,AX
        SUB BX,BX
        SUB CX,CX
        SUB DX,DX         
        
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
        
        SUB BL,30H
        
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
        
        SUB CL,30H
        
        MOV AL,BL
        MUL CL
        MOV DX,AX 
        MOV BL,2H
        DIV BL
        MOV CX,AX
        MOV AX,DX
        MOV BL,5H
        DIV BL 
        MOV BX,AX
        SUB AX,AX
        SUB DX,DX
        
        CMP CH,0H
        JA L1
        CMP CH,0H
        JE L2
        CMP BH,0H
        JA L1
        CMP BH,0H
        JE L2
        JBE NEXT          
     
        L1: 
        LEA DX,T            
        MOV AH,9
        INT 21h 
        JMP NEXT  
        L2:
        LEA DX,S            
        MOV AH,9
        INT 21h 
        JMP NEXT
        NEXT:
        
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
        
