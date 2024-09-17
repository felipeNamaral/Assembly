 Title exibir caractere *
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
           MOV bl,50     ; bx recebe 50 em numero decimal para para ser utilizado como parametro de repetição
  inicio:  
           MOV AH,02H
           MOV DL,'*'    ;utilizando o função 02h da biblioteca int 21h que imprime na tela o carectere armazenado em dl, o programa imprime o caractere *
           int 21h       ;executa a fução
           dec bl        ; decrementa bl até chegar em 0

           cmp bl,0       
           jg  inicio   ; compara o conteudo de bl com 0 se for maior volta para 'inicio' quando bl chegar em 0 o progrma continua 
              



           mov bl,50    ; volta o conteudo de bl para 50 para realizar a segunda parte do programa 


  inicio_2:
           MOV AH,02H
           MOV DL,10     ; pula a linha
           int 21h       ;executa a fução para pula a linha
           mov ah,02h
           mov dl,'*'    ;imprime o caractere*
           int 21h       ;executa a função para imprimir o caractere
           dec bl        ; decrementa bl até chegar em 0
           cmp bl,0     ; compara o conteudo de bl com 0 se for maior volta para 'inicio_2' quando bl chegar em 0 o progrma continua
           jg  inicio_2

  fim:     
           MOV AH,4CH    ; finaliza o programa
           INT 21H
MAIN ENDP
END MAIN