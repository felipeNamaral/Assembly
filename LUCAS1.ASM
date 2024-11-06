TITLE PROJETO
.MODEL SMALL
.STACK 100H

PULALINHA MACRO
              PUSH AX       ; ax para a pilha para nao perder o valor
              PUSH DX       ; dx para a pilha para nao perder o valor
              MOV  AH,2     ; imprime um pula linha
              MOV  DL,10
              INT  21H
              POP  AX       ; ax sai da pilha
              POP  DX       ; dx sai da pilha
ENDM

.DATA

    MATRIZ DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
           DB 20 DUP("#")
    
.CODE
MAIN PROC

                 MOV       AX,@DATA
                 MOV       DS,AX

                 CALL      EMBARCACAO
                 CALL      IMPRIME
                 CALL      TIRO

                 MOV       AH,4CH
                 INT       21H

MAIN ENDP
   
EMBARCACAO PROC
    
                 PULALINHA
                 PULALINHA

                 MOV       AH,0
                 INT       1AH
                 MOV       AX,DX
                 AND       AX,3
                 CMP       AX,0
                 JE        PRIMEIRO
                 CMP       AX,1
                 JE        SEGUNDO
                 CMP       AX,2
                 JE        TERCEIRO
                 CMP       AX,3
                 JE        QUARTO

    PRIMEIRO:    
                 JMP       N0

    SEGUNDO:     
                 JMP       N1

    TERCEIRO:    
                 JMP       N2

    QUARTO:      
                 JMP       N3

    N0:          
                 XOR       SI,SI
                 XOR       BX,BX
                 MOV       CX,4

                 MOV       AL,'@'
    ENC1:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      ENC1

                 ADD       BX,20
                 ADD       SI,20
                 MOV       CX,3

    FRA1:        
    
                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      FRA1
    
                 XOR       SI,SI
                 ADD       BX,80
                 ADD       SI,18
                 MOV       CX,2

    SUB1:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB1

                 ADD       BX,100
                 XOR       SI,SI
                 MOV       CX,2
                 ADD       SI,4

    SUB2:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB2

                 ADD       BX,60
                 ADD       SI,4
                 MOV       CX,3

    HID1:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID1

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 ADD       BX,20
                 SUB       SI,9
                 MOV       CX,3

    HID2:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID2

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 RET
    
    N1:          

                 ADD       SI,6
                 XOR       BX,BX
                 MOV       CX,4

                 MOV       AL,'@'

    ENC2:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      ENC2

                 ADD       BX,20
                 ADD       SI,4
                 MOV       CX,3

    FRA2:        
    
                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      FRA2
    
                 XOR       SI,SI
                 ADD       BX,60
                 MOV       CX,2

    SUB3:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB3

                 ADD       BX,180
                 XOR       SI,SI
                 MOV       CX,2
                 ADD       SI,6

    SUB4:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB4

                 ADD       BX,60
                 ADD       SI,4
                 MOV       CX,3

    HID3:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID3

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 SUB       SI,9
                 MOV       CX,3

    HID4:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID4

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 RET

    N2:          

                 XOR       BX,BX
                 ADD       SI,3
                 ADD       BX,240
                 MOV       CX,4

                 MOV       AL,'@'
    ENC3:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      ENC3

                 ADD       BX,20
                 ADD       SI,4
                 MOV       CX,3

    FRA3:        
    
                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      FRA3
    
                 XOR       SI,SI
                 XOR       BX,BX
                 MOV       CX,2

    SUB5:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB5

                 ADD       BX,40
                 ADD       SI,13
                 MOV       CX,2

    SUB6:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB6

                 ADD       BX,60
                 ADD       SI,4
                 MOV       CX,3

    HID5:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID5

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 SUB       SI,9
                 MOV       CX,3


    HID6:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID6

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL


                 RET

   
    N3:          
   
                 XOR       BX,BX
                 ADD       SI,6
                 ADD       BX,260
                 MOV       CX,4

                 MOV       AL,'@'
    
    ENC4:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      ENC4

                 ADD       BX,60
                 ADD       SI,4
                 MOV       CX,3

    FRA4:        
    
                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      FRA4
    
                 ADD       SI,18
                 XOR       BX,BX
                 MOV       CX,2

    SUB7:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB7

                 ADD       BX,40
                 ADD       SI,13
                 MOV       CX,2

    SUB8:        

                 MOV       MATRIZ[BX][SI],AL
                 INC       SI
                 LOOP      SUB8

                 ADD       BX,60
                 ADD       SI,4
                 MOV       CX,3

    HID7:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID7

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 SUB       SI,9
                 MOV       CX,3

    HID8:        

                 MOV       MATRIZ[BX][SI],AL
                 ADD       BX,20
                 LOOP      HID8

                 SUB       BX,40
                 INC       SI
                 MOV       MATRIZ[BX][SI],AL

                 RET

EMBARCACAO ENDP

IMPRIME PROC
    
                 XOR       BX,BX                              ; inicializa o bx para apontar para a 1a linha
    REP2:        
                 MOV       AH,2                               ; chama a funcao para exibir
                 MOV       CX,20                              ; cx 4 (numero de vezes a fazer)
                 XOR       SI,SI                              ; Si para apontar para a primeira coluna

    REP1:        

                 MOV       AL, MATRIZ[BX][SI]                 ;valor de bx si vai para al
                 MOV       DL,AL                              ; al para dl para a impressao
                 INT       21H
                 INC       SI                                 ; si aponta para o prox elemento
                 LOOP      REP1                               ; se cx nao for 0 vai para rep1
    
                 PULALINHA                                    ; macro pulalinha
    
   
                 ADD       BX,20                              ; vai para a prox linha
                 CMP       BX,400                             ; checa se ja fez todas as vezes necessarias
                 JNE       REP2                               ; se nao fez vai para rep2
                 RET
IMPRIME ENDP

TIRO PROC

                 MOV       AH,9
                 LEA       DX,TIRO
                 INT       21H

                 XOR       BX,BX
                 MOV       AH,1
    PEGAR_LINHA: 
                 INT       21H
                 CMP       AL,0DH                             ;COMPARA AL COM O (ENTER)
                 JE        PEGAR_COLUNA
                 SUB       AL,'0'
                 ADD       BL,AL
                 JMP       PEGAR_LINHA
    PEGAR_COLUNA:
                 XOR       AX,AX
                 MOV       AH,1
                 INT       21H
                 CMP       AL,0DH
                 JE        VERIFICAR
                 XOR       AH,AH
                 SUB       AL,'0'
                 ADD       SI,AX
                 JMP       PEGAR_COLUNA
    VERIFICAR:   
                 XOR       DX,DX
                 MOV       AX,20
                 MUL       BX
                 MOV       BX,AX
                 CMP       matriz[BX][SI],1
                 JE        CERTO
                 MOV       AH,9
                 LEA       DX,ERRO
                 INT       21H
                 JMP       CONTINUA
    CERTO:       
                 MOV       AH,9
                 LEA       DX,ACERTO
                 INT       21H
                 jmp fim
    CONTINUA:    
                 
                 RET

    sai:
    
    ret             

TIRO ENDP

END MAIN