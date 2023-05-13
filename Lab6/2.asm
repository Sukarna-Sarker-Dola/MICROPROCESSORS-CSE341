.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE   
    W DB "Enter the four numbers(press enter after entering each 8 bit input): $"
    ARR DB ? 
    X DB "Sum: $"
.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        MOV SI,OFFSET ARR 
        ; YOUR CODE STARTS HERE
        
        LEA DX,W  ;SHOWING THE PROMPT          
        MOV AH,9
        INT 21h 
        
        
        
        MOV CX,4  ;SETTING THE COUNTER TO 4
        
        INPUT:    ;TAKING INPUTS 
        MOV AH,2  ;GOING TO NEXT LINE
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
        MOV BH,AL
        MOV AL,BL   
        MUL DL     
        ADD AL,BH   
        MOV BL,AL
        JMP AGAIN  
        NEXT:
        MOV AL,BL
        MOV [SI],AL
        INC SI                
        LOOP INPUT
        
        
        MOV AH,2  ;GOING TO NEXT LINE
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h 
        
                
        MOV SI,OFFSET ARR  ;PRINTING THE ARRAY
        MOV CX,4 
        SUB BX,BX
        OUTPUT:
        MOV DL,[SI] ;DL A ASHTESE ARRAY ELEMENT          

        ;VAAG SHURU HOCCHE
        MOV AX,DX
        MOV BL,2H
        DIV BL
        CMP AH,0H
        JNE L1
        
        INC SI
        LOOP OUTPUT
        JMP DONE
        
        L1:
        CMP BH,0H
        JE L2
        JNE L3 
        JMP DONE
        L2: ;PROTHOM ODD NUMBER STORE KORTESI
        ADD BH,DL 
        INC SI
        LOOP OUTPUT 
        L3:
        ADD CH,DL
        SUB DX,DX
        MOV BL,BH
        SUB BH,BH
        MOV CL,CH
        SUB CH,CH
        ADD BX,CX
        JMP DONE

        DONE:
        MOV AX,BX    
        MOV CX,0
        MOV DX,0
        LABEL1:
        
        CMP AX,0
        JE PRINT1                      
        MOV BX,10       
        DIV BX                 
        PUSH DX             
        INC CX             
        XOR DX,DX
        JMP LABEL1
        PRINT1:
        CMP CX,0
        JE EXIT        
        POP DX                 
        ADD DX,48        
        MOV AH,02h
        INT 21h          
        DEC CX
        JMP PRINT1
 
        EXIT:
        ; YOUR CODE ENDS HERE
        
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN

                 
