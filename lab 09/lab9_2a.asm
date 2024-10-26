TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO SI ou DI
.MODEL SMALL
.DATA
    VETOR DB 1, 1, 1, 2, 2, 2
.CODE
MAIN PROC
          MOV  AX, @DATA    ;acessa data atravez de ax
          MOV  DS,AX        ;zera dl e coloca 6 em cx para usar de contador
          XOR  DL, DL
          MOV  CX,6
          LEA  SI, VETOR    ;acessa o vetor atravez do lea pelo si
    VOLTA:
          MOV  DL, [SI]     ;colocar o valor 0 do vetor em dl
          INC  SI           ;si aponta para o proximo valor do vetor
          ADD  DL, 30H      ;trasforma em caractere o numro do vetor e imprime
          MOV  AH, 02
          INT  21H
          LOOP VOLTA        ;faz o loop de 6 vezes do volta
          MOV  AH,4CH
          INT  21H          ;finaliza o codigo
MAIN ENDP
END MAIN
