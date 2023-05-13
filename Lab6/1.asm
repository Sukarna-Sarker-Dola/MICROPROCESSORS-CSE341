.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    X DB "WHAT IS THE LENGTH OF YOUR NAME $"
    ARR DB 50 DUP(?) ; declaring array with null value 

.CODE
    MAIN PROC
        
        MOV AX,@DATA
        MOV DS,AX
        SUB BX,BX
        SUB CX,CX
        
        ; YOUR CODE STARTS HERE 
        LEA DX,X           
        MOV AH,9
        INT 21h 
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h
        
        
        
        
        
        MOV DL,10  
        MOV BL,0         

        AGAIN:

        MOV AH,01H
        INT 21H

        CMP AL,13   
        JE  NEXT 

        MOV AH,0  
        SUB AL,48   

        MOV CL,AL
        MOV AL,BL   

        MUL DL     

        ADD AL,CL   
        MOV BL,AL

        JMP AGAIN  
        
        
        
        
        
        NEXT:
        CMP BL,15
        JLE STEP1
        JG STEP2
        
        STEP1: 
        MOV AL,BL          
        MOV BX,AX  
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
        
        MOV AX,BX
                

        MOV CL,AL
        MOV BL,AL
        MOV SI,0

        INPUT:
        INT 21H
        MOV ARR[SI],AL
        INC SI
        LOOP INPUT

        MOV AH,2    
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
                       
        MOV CX,BX
        MOV SI,0
        MOV AH,2  
               
        OUTPUT:
        MOV DL,ARR[SI] 
        MOV DH,41H
        CMP DL,61H
        JGE SMALL 
        CMP DL,20H
        JE SPACE
        JMP CAPITAL   
        
        SMALL:
        CMP DL,7AH
        JLE S1 
        JMP CAPITAL
        
        S1:
        MOV DL,68H
        INT 21h
        INC SI
        LOOP OUTPUT
        JMP DONE
        
        CAPITAL: 
        CMP DL,41H
        JGE C1
        JMP DONE
        
        C1:
        CMP DL,5AH
        JLE C2
        JMP DONE 
        
        C2:
        MOV DL,47H
        INT 21h
        INC SI
        LOOP OUTPUT  
        
        SPACE:
        CMP DL,20H
        JE L1
        JMP DONE
        L1:
        INT 21h
        INC SI
        LOOP OUTPUT 
        
        
        
        
        STEP2:
        ADD BL,6H  
        MOV AL,BL          
        MOV BX,AX  
        
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
        
        MOV AX,BX
                

        MOV CL,AL
        MOV BL,AL 
        SUB CL,6H

        INPUT1:
        INT 21H
        MOV ARR[SI],AL
        INC SI
        LOOP INPUT1

        MOV AH,2    
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
                       
        MOV CX,BX
        MOV SI,0
        MOV AH,2  
               
        OUTPUT1:
        MOV DL,ARR[SI] 
        MOV DH,41H
        CMP DL,61H
        JGE SMALL1 
        CMP DL,20H
        JE SPACE1
        JMP CAPITAL1   
        
        SMALL1:
        CMP DL,7AH
        JLE S6 
        JMP CAPITAL1
        
        S6:
        MOV DL,68H
        INT 21h
        INC SI
        LOOP OUTPUT1
        JMP DONE
        
        CAPITAL1: 
        CMP DL,41H
        JGE C6
        JMP DONE
        
        C6:
        CMP DL,5AH
        JLE C7
        JMP DONE 
        
        C7:
        MOV DL,47H
        INT 21h
        INC SI
        LOOP OUTPUT1  
        
        SPACE1:
        CMP DL,20H
        JE L4
        JMP DONE
        L4:
        INT 21h
        INC SI
        LOOP OUTPUT1 
        
        
        DONE:

        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
