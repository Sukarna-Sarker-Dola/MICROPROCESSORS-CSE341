.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    X DB "1st Side: $"
    Y DB "2nd Side: $"
    Z DB "3rd Side: $"
    A DB "Y $"
    B DB "N $"

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
        MOV CH,AL
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        SUB CH,30H        
        
        LEA DX,Z            
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
        
        MOV BH,BL         
        ADD BL,CH
        CMP BL,CL
        JA L1
        JMP L4
        
        L1:
        MOV BL,BH
        ADD BL,CL
        CMP BL,CH
        JA L2 
        JMP L4
        
        L2:
        MOV BL,BH
        ADD CH,CL
        CMP CH,BL
        JA L3
        JMP L4
        
        L3:
        LEA DX,A            
        MOV AH,9
        INT 21h 
        JMP NEXT
        
        L4:
        LEA DX,B            
        MOV AH,9
        INT 21h 
        JMP NEXT 

        
        NEXT:

 

        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
