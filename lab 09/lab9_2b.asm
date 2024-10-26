TITLE PROGRAMA EXEMPLO PARA MANIPULAÇÃO DE VETORES USANDO SI ou DI
.MODEL SMALL
.DATA
    VETOR DB 1, 1, 1, 2, 2, 2
.CODE
MAIN PROC
          MOV  AX, @DATA        ;acessa data atravez de ax
          MOV  DS,AX            ;zera dl e coloca 6 em cx para usar de contador
          XOR  DL, DL
          MOV  CX,6
          XOR  DI, DI
    VOLTA:
          MOV  DL, VETOR[DI]    ;acessa o vetor atravez di di que aponta para 0 e move o valor para dl
          INC  DI               ;vai pra o proximo valor do vetor
          ADD  DL, 30H          ;trasforma em caractere o numro do vetor e imprime
          MOV  AH, 02
          INT  21H
          LOOP VOLTA            ;faz o loop de 6 vezes do volta
          MOV  AH,4CH
          INT  21H              ;finaliza o codigo
MAIN ENDP
end main
