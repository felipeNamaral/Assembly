TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO SI ou DI
.MODEL SMALL
.DATA
    VETOR DB 1, 1, 1, 2, 2, 2
.CODE
MAIN PROC
          MOV  AX, @DATA
          MOV  DS,AX        ;acessa data atravez de ax
          xor  dl,dl        ;zera dl e coloca 6 em cx para usar de contador
          mov  cx,6
          lea  si,VETOR     ;acessa o vetor
    VOLTA:
          mov  dl,[si]      ;coloca em dl o valor em 0 do vetor
          inc  si           ;passa para o proximo valor do vetor
          or   dl,30h       ;trasforma em caractere o numro do vetor e imprime
          mov  ah,02
          INT  21H
          LOOP VOLTA        ;faz o loop de 6 vezes do volta
          MOV  AH,4CH
          INT  21H          ;finaliza o codigo
MAIN ENDP
END MAIN
