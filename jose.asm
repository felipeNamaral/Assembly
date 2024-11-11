TITLE ENTRADAS E SAÍDAS
.MODEL SMALL
.STACK 100h
Proximalinha macro
    ;macro que pula linha sem alterar os valores de AX e DX
                 PUSH AX
                 PUSH DX
                 MOV  AH,2
                 MOV  DL,10
                 INT  21h
                 MOV  AH,2
                 MOV  DL,13
                 INT  21h
                 POP  DX
                 POP  AX
endm
.DATA
    MSG1 DB "Escolha sua entrada: Digite 1 para Decimal, digite 2 para Binario ou digite 3 para Hexadecimal:$"
    MSG2 DB "Digite um numero:$"
    MSG3 DB "Escolha sua saida: Digite 1 para Decimal, digite 2 para Binario ou digite 3 para Hexadecimal:$"
    MSG4 DB "O valor convertido e:$"


.CODE
MAIN PROC
                       MOV          AX,@DATA
                       MOV          DS,AX

                       MOV          AH,9
                       LEA          DX,MSG1
                       INT          21H

                       MOV          AH,1
                       
                       INT          21H
                       and          al,0fh

                       CMP          AL,1
                       JE           dec1
                       CMP          AL,2
                       JE           bin2
                       CMP          AL,3
                       JE           hex3

    dec1:              
                       call         entradadecimal
                       JMP          saida
    bin2:              
                       CALL         entradabinario
                       JMP          saida
    hex3:              
                       CALL         entradahexadecimal

    saida:             
                       PUSH         AX
                       MOV          AH,9
                       LEA          DX,MSG3
                       INT          21H

                       MOV          AH,1
                       INT          21H
                       
                       and          al,0fh

                       
                       CMP          AL,1
                       JE           dec11
                       CMP          AL,2
                       JE           bin22
                       CMP          AL,3
                       JE           hex33

    dec11:             
                       POP          AX
                       CALL         saidadecimal
                       JMP          FEIN
    bin22:             
                       POP          AX
                       CALL         saidabinario
                       JMP          FEIN
    hex33:             
                       POP          AX
                       CALL         saidahexadecimal
    FEIN:              
                       MOV          AH,4Ch
                       INT          21h
MAIN ENDP

entradadecimal proc
                       PUSH         BX
                       PUSH         CX
                       PUSH         DX
    topo:              
                       Proximalinha
                       MOV          AH,9
                       LEA          DX,MSG2
                       INT          21H
    
                       XOR          BX,BX
                       XOR          CX,CX
    
                       MOV          AH,1
                       INT          21H

                       CMP          AL,'-'
                       JE           negativo
                       CMP          AL,'+'
                       JE           go
                       JMP          vai
    negativo:          
                       MOV          CX,1
    go:                
                       INT          21H
    vai:               
                       CMP          AL, '0'
                       JNGE         não
                       CMP          AL, '9'
                       JNLE         não

                       AND          AX,000FH
                       PUSH         AX

                       MOV          AX,10
                       MUL          BX
                       POP          BX
                       ADD          BX,AX

                       MOV          AH,1
                       INT          21H
                       CMP          AL,13
                       JNE          vai

                       MOV          AX,BX

                       OR           CX,CX
                       JE           sai

                       NEG          AX

                       jmp          sai
não:

                       MOV          AH,2
                       MOV          DL, 0DH
                       INT          21H
                       MOV          DL, 0AH
                       INT          21H
                       JMP          topo
    sai:               
                       POP          DX
                       POP          CX
                       POP          BX
                       RET
entradadecimal ENDP
saidadecimal PROC
                       Proximalinha
                       PUSH         AX
                       PUSH         BX
                       PUSH         CX
                       PUSH         DX
    
                       PUSH         AX
                       MOV          AH,9
                       LEA          DX,MSG4
                       INT          21H
                       POP          AX

                       OR           AX,AX
                       JGE          maior

                       PUSH         AX
                       MOV          DL, '-'
                       MOV          AH,2
                       INT          21H
                       POP          AX
                       NEG          AX
    maior:             
                       XOR          CX,CX
                       MOV          BX,10
    repete:            
                       XOR          DX,DX
                       DIV          BX
                       PUSH         DX
                       INC          CX

                       OR           AX,AX
                       JNE          repete

                       MOV          AH,2
    looping:           
                       POP          DX
                       OR           DL,30H
                       INT          21H
                       LOOP         looping

                       POP          DX
                       POP          CX
                       POP          BX
                       POP          AX
                       RET
saidadecimal ENDP
entradabinario PROC
                       Proximalinha
                       MOV          AH,9
                       LEA          DX,MSG2
                       INT          21H

                       MOV          CX,16
                       MOV          AH,1
                       XOR          BX,BX
                       INT          21h
    ;while
    TOPOO:             
                       CMP          AL,0DH
                       JE           FIMMMM
                       AND          AL,0FH
                       SHL          BX,1
                       OR           BL,AL
                       INT          21h
                       LOOP         TOPOO
    ;end_while
    FIMMMM:            
                       RET
entradabinario ENDP
saidabinario PROC
                       PUSH         AX
                       Proximalinha
                       MOV          AH,9
                       LEA          DX,MSG4
                       INT          21H
                       POP          AX

                       MOV          BX,AX
                       MOV          CX,16
                       MOV          AH,2
    abra:              
                       ROL          BX,1
                       JNC          bulbasaur
                       MOV          DL,31h
                       INT          21h
                       JMP          charmander
    bulbasaur:         
                       MOV          DL,30h
                       INT          21h
    charmander:        
                       LOOP         abra
                       RET
saidabinario ENDP
entradahexadecimal PROC
                       Proximalinha
                       MOV          AH,9
                       LEA          DX,MSG2
                       INT          21H

                       XOR          BX,BX                 ;zera o registrador BX
                       MOV          CL,4                  ;atribui o valor 4 ao contador CL
                       MOV          AH,1                  ;lê um caracter do teclado
                       INT          21H
    TOPO0:             
                       CMP          AL,0DH                ;compara com o caracter "enter", se for igual vai para "FIM"
                       JE           FIMM
                       CMP          AL,39H                ;compara o número com "9", se for maior pula para "LETRA"
                       JG           LETRA
                       AND          AL,0FH                ;transforma o caractere em número
                       JMP          DESLOCA
    LETRA:             
                       SUB          AL,37H                ;transforma o caractere em letra
    DESLOCA:           
                       SHL          BX,CL                 ;desloca BX quatro bits para a esquerda
                       OR           BL,AL                 ;faz um or entre BL e AL
                       INT          21H                   ;lê outro caractere digitado do teclado
                       JMP          TOPO0                 ;salta novamente para TOPO para repetir o processo e pegar outro caractere
    FIMM:              
                       RET
entradahexadecimal ENDP
saidahexadecimal PROC
                       PUSH         AX
                       Proximalinha
                       MOV          AH,9
                       LEA          DX,MSG4
                       INT          21H
                       POP          AX

                       MOV          BX,AX
                       MOV          CH,4
                       MOV          CL,4
                       MOV          AH,2
    TOPO1:             
                       MOV          DL,BH
                       SHR          DL,CL
                       CMP          DL,0AH
                       JAE          LETRA1
                       ADD          DL,30h
                       JMP          depois
    LETRA1:            
                       ADD          DL,37H
    depois:            
                       INT          21H
                       ROL          BX,CL
                       DEC          CH
                       JNZ          TOPO1
                       RET
saidahexadecimal ENDP

END MAIN
