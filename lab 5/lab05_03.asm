 Title Letras maiusculas e minusculas 
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
               mov  ah, 02H
               mov  dl, 65        ;utilizando a função 02 da biblioteca int 21h que imprime na tela o carectere armazenado em dl, o programa imprime o caracte 'A' que em decimal na tabela ASCII é 65
               mov  cx,26         ;cx recebe 26 (numero de letras do alfabeto) em decimal para utilizar no loop
    maiusculas:
               int  21H           ;executa a função
               inc  dl            ;incrementa 1 no valor de dl para exibir as outras letras do alfabeto
               loop maiusculas    ;compara o valor de cx se diferente de 0 executa a função novamente e incremeta dl se igual a 0 continua o programa

               mov  ah,02H
               mov  dl, 10        ;pula uma linha
               int  21H           ;executa a função de pular linha

               mov  ah, 02H
               mov  dl, 97        ;imprime o caracte 'a' que em decimal na tabela ASCII é 65
               mov  cx,26         ;cx recebe 26 (numero de letras do alfabeto) em decimal para utilizar no loop
    minusculas:
               int  21H           ;executa a função
               inc  dl            ;incrementa 1 no valor de dl para exibir as outras letras do alfabeto
               loop minusculas    ;compara o valor de cx se diferente de 0 executa a função novamente e incremeta dl se igual a 0 continua o programa



    fim:       
               MOV  AH,4CH        ; finaliza o programa
               INT  21H
MAIN ENDP
END MAIN