.MODEL SMALL
.STACK 100H
.DATA 
MATRIX_1 DB 20 DUP (0)
         DB 0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0  ;ENCOURAÇADO 1,1,1,1
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0     ;1
         DB 0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0     ;1 1    HIDROAVIÃO
         DB 0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0     ;1
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0     ;1,1,1 FRAGATA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1     ;1
         DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1     ;1     SUBMARINO 
         DB 20 DUP (0)                      ;LINHA VAZIA
         DB 20 DUP (0)                      ;LINHA VAZIA

MATRIX_TIROS DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)
             DB 20 DUP (0)

ACERTO DB 10,13,'VOCE ACERTOU UMA EMBARCACAO!!! $'
ERRO DB 10,13,'VOCE ERROU! $'
CONTINUAR DB 10,13,'DESEJA CONTINUAR? S OU N $'
TIRO DB 10,13,'ESCOLHA AONDE QUER ATIRAR, (LINHA/ENTER DEPOIS COLUNA/ENTER): $'

.CODE 
    MAIN PROC 
        MOV AX,@DATA 
        MOV DS,AX 

        LOOP_1: 
        CALL ATIRAR
        CALL MATRIX 

        MOV AH,9
        LEA DX,CONTINUAR
        INT 21H        

        MOV AH,1
        INT 21H
        CMP AL,'S'
        JE SEGUE
        JMP FIM
        SEGUE:
        INC BH
        CMP BH,20
        JE FIM 
        JMP LOOP_1

        FIM:
        MOV AH,4CH
        INT 21H

    MAIN ENDP 

    ATIRAR PROC 

        MOV AH,9
        LEA DX,TIRO 
        INT 21H 

        XOR BX,BX
        MOV AH,1
        PEGAR_LINHA:
            INT 21H
            CMP AL,0DH          ;COMPARA AL COM O (ENTER)
            JE PEGAR_COLUNA 
            SUB AL,'0'
            ADD BL,AL
            JMP PEGAR_LINHA
        PEGAR_COLUNA:
            XOR AX,AX
            MOV AH,1
            INT 21H 
            CMP AL,0DH 
            JE VERIFICAR 
            XOR AH,AH
            SUB AL,'0'
            ADD SI,AX 
            JMP PEGAR_COLUNA
        VERIFICAR: 
            XOR DX,DX
            MOV AX,20
            MUL BX
            MOV BX,AX
            CMP MATRIX_1[BX][SI],1
            JE CERTO
            MOV AH,9
            LEA DX,ERRO
            INT 21H
            JMP CONTINUA 
        CERTO:
            MOV AH,9
            LEA DX,ACERTO
            INT 21H
        CONTINUA:
            MOV BYTE PTR MATRIX_TIROS[BX][SI],1
            RET
    ATIRAR ENDP      

    MATRIX PROC    
       MOV AH,2
       MOV CX,20
       XOR BX,BX
       XOR SI,SI
       IMPRIME_MATRIX:
            MOV DL, MATRIX_TIROS[BX][SI]
            INT 21H 
            CMP SI,19
            JE SOMA_20
            INC SI 
            JMP CONTINUE
        SOMA_20:
            ADD BX,20
            XOR SI,SI
            MOV DL,10
            INT 21H
        CONTINUE:
            LOOP IMPRIME_MATRIX
            RET
    MATRIX ENDP

    END MAIN