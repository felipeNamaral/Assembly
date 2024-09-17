 Title exibir caractere *
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
              MOV  AH,02H
              MOV  DL,'*'       ;utilizando a função 02 da biblioteca int 21h que imprime na tela o carectere armazenado em dl, o programa imrime o caractere *
              MOV  CX,50        ; cx recebe 50 em numero decimal para para ser utilizado no loop
    retorno:  
              int  21h          ;executa a fução
              loop retorno      ; loop decrementa de cx até chegar em 0,se cx for diferete de 0 ele salta para 'retoro' e xecuta a função novamente se na ocontnua o programa (JNZ)

              mov  cx,50        ;começa a segunda parte do programa voltando cx para 50

    retorno_2:
              MOV  AH,02H
              MOV  DL,10        ; pula a linha
              int  21h          ;executa a fução para pula a linha
              mov  ah,02h
              mov  dl,'*'       ;imprime o caractere*
              int  21h          ;executa a função para imprimir o caractere
              loop retorno_2    ; derementa cx e volta para retorno_2

    fim:      
              MOV  AH,4CH       ; finaliza o programa
              INT  21H
MAIN ENDP
END MAIN