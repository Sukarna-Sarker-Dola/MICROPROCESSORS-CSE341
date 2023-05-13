.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    X DB "1st Input: $"
    Y DB "2nd Input: $"
    Z DB "3rd Input: $"

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
        
        CMP CL,BL
        JA L1
        JMP L2
        L1:MOV DL,CL 
        JMP L3:
        L2:MOV DL,BL 
        JMP L4:
              
        
        L3:CMP CL,CH
        JA L5         
        JMP L6: 
        
        L5:MOV DL,CL 
        MOV AH,2 
        INT 21h
        JMP NEXT 
        
        L6:MOV DL,CH 
        MOV AH,2 
        INT 21h
        JMP NEXT 
        
        L4:CMP BL,CH        
        JA L7         
        JMP L8:
        
        L7:MOV DL,BL 
        MOV AH,2 
        INT 21h
        JMP NEXT
        
        L8:MOV DL,CH 
        MOV AH,2 
        INT 21h
        JMP NEXT
        

        
        
        NEXT:
       
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN

