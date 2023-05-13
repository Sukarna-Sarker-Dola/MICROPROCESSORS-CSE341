.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE   
    ARR DB 8,6,2,9,5
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        ; YOUR CODE ENDS HERE 
        
        MOV DL,0      
        L1:      
        CMP DL,3
        JG PRINT
    
        MOV CX,4
        MOV SI,0
        MOV DI,1
    
        L2:
        MOV AL,ARR[SI]
        MOV BL,ARR[DI]
        CMP AL,BL
        JG L3   ;IF AL IS LARGE    
        JMP L4
                   
        L3:
        MOV ARR[SI],BL  ;STORING SMALL ONE       
        MOV ARR[di],AL  ;STORING LARGE ONE
    
        L4:
        ADD SI,1
        ADD DI,1     
        LOOP L2    
        ADD DL,1 ;SORTING COMPLETED   
        JMP L1  
    
        PRINT:
        MOV CX,5 ;PRITING COMMAND STARTED FROM HERE
        MOV SI,0
        MOV AH,2
    
        DONE:
    
        MOV DL,ARR[SI]
        ADD DL,30H
        INT 21H 
        MOV DL,20H
        INT 21H
        ADD SI,1
        LOOP DONE

         ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN


