.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    X DB "Enter the month no: $"
    Y DB "31 $"
    Z DB "28 $"
    W DB "30 $"

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
        
        CMP BL,31H
        JE L1
        CMP BL,33H
        JE L1
        CMP BL,35H
        JE L1
        CMP BL,32H
        JE L2
        JMP L3
        L1:LEA DX,Y            
        MOV AH,9
        INT 21h 
        JMP NEXT  

 
        L2:LEA DX,Z            
        MOV AH,9
        INT 21h 
        JMP NEXT  
        
        L3:LEA DX,W            
        MOV AH,9
        INT 21h 
        JMP NEXT  

        NEXT:
       
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
