.MODEL SMALL  
.STACK 100H  
.DATA
    ; DEFINE YOUR VARIABLES HERE  
    S DB "DIVIDE OR MULTIPLY $"
    X DB "REMAINDER IS: $"
    MSG DB 60 DUP(?)
     

.CODE
    MAIN PROC 
                 
        
        MOV AX, @DATA
        MOV DS, AX
        MOV SI,OFFSET MSG
        
        ; YOUR CODE STARTS HERE 
        LEA DX,S            
        MOV AH,9
        INT 21h
        SUB DX,DX 


        input: 
        mov ah,1
        int 21h
        cmp al,13
        je display
        mov [si],al
        inc si
        jmp input

        display: 
        mov [si],'$'
        mov di,offset msg
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h

        again:
        cmp [di],'$'
        je last
        cmp [di],32
        je next
        mov dl,[di]
        mov ah,2
        Int 21h
        inc di
        Jmp again

        next: 
        mov dl,13
        mov ah,2
        int 21h
        mov dl,10
        mov ah,2
        int 21h
        inc di
        jmp again

        last:
        MOV AH,4CH
        MOV DL,AL
        MOV BX,2050 
        MOV AX,4                 
        CMP DL,45H
        JE L1
        CMP DL,65H
        JE L1
        JMP L2
        
        L1:
        SUB CX,CX
        SUB DX,DX
        
        START:
        ADD CX,1 
        SUB BX,AX        
        CMP BX,AX
        JL L3        
        JMP START
        
        L2:
        SUB CX,CX
        SUB DX,DX

        STARTS:
        ADD CX,1 
        ADD DX,BX        
        CMP CX,AX
        JE L4        
        JMP STARTS 
        
        L3:
        MOV AH,2
        MOV DL,0DH
        INT 21h
        MOV DL,0AH
        INT 21h

        
        LEA DX,X            
        MOV AH,9
        INT 21h 

        ADD BL,30H      
        MOV DL,BL
        MOV AH,2
        INT 21h  
        
        L4: 
        
                                          
        ; YOUR CODE ENDS HERE
        MOV AX, 4C00H
        INT 21H
        
    MAIN ENDP
    END MAIN
