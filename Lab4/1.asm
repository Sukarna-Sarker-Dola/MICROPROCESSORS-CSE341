.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE 
    X DB "286 $" 
    Y DB "CAN NOT CALCULATE $"
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE STARTS HERE 
        SUB AX,AX
        SUB BX,BX
        SUB CX,CX
        SUB DX,DX
        MOV BX,0H
        MOV AX,2H 
        CMP BX,0H
        JE L2
        JMP NEXT
        L2:
        CMP BX,69H
        JL L1
        JMP L5
        L1:
        ADD BX,AX
        MOV CX,BX
        MOV BX,AX
        MOV AX,CX        
        ADD DX,BX
        JMP L2 

        
        L5:
        CMP DX,286
        JE L3
        JNE L4
        L3:
        MOV AX,DX
        LEA DX,X           
        MOV AH,9
        INT 21h
        SUB AX,AX
        JMP NEXT 
        L4:
        MOV AX,DX
        LEA DX,Y           
        MOV AH,9
        INT 21h
        SUB AX,AX 
        NEXT:
                                
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN

