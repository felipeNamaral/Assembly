 title Numero ou Letra 
; esse programa utiliza as instruções de comparação(cmp),salto(jb,jmp,ja) e a criação de rotúlos(:), para verificar se o caractere digitado pelo usúario é um numero ou nao.
.model small
.stack 100h
;armazena variáveis    
.data
    msg    db 10,13,"Digite um caractere, ou espaco para finalizar o programa: $"
    numero db 10,13,"O caractere digitado e um numero.$"
    letra  db 10,13,"O caractere digitado e uma letra.$"
    des    db 10,13,"O caractere digitado e um caractere desconhecido.$"
.code
main proc
    inicio:      
    ;acessa às variaveis em.data (nao pode acessar direto pelo ds).
                 mov ax,@data
                 mov ds,ax
                  
    ;exibe a string msg na tela atraves da função 9 da interrupção 21h.
                 mov ah,9
                 mov dx, offset msg
                 int 21h
    ;le um caractere digitado e armazena em al atraves da função 1.
                 mov ah,1
                 int 21h
    ;coloca em bl o conteudo lido em al para liberar al para nova leitura.
                 mov bl,al

                 cmp bl,32
                 je fim

                 


    ;compara bl com 48(codigo de 0 na tabela ASCII).
                 cmp bl,48
    ;Se bl for menor que 48 salta para o rotulo desconhecido.
                 jb  desconhecido
    ; compara bl com 57(codigo de 9 na tabela ASCII).
                 cmp bl,57
    ; Se bl for maior que 57, salta para testletra.
                 ja  testletra
    ; Se o caractere digitado for um numero imprime o conteudo da variavel sim.
                 mov ah,9
                 mov dx,offset numero
                 int 21h
    ;Após exibir a variavel na tela salta para o rotulo fim.
                 jmp retorno
    ;rotulo desconhecido.
    desconhecido:
    ;exibe na tela o conteudo da variavel des.
                 mov ah,9
                 mov dx,offset des
                 int 21h
                 jmp retorno
    ;rotulo que analiza o caractere para identificar se é uma letra (maiúscula e minúscula).
    testletra:   
    ;compara bl com 65(A), se for menor salta para desconhecido.
                 cmp bl,65
                 jb  desconhecido
    ;compara bl com 90(Z), se for menor ou igual salta para o rotulo eletra.
                 cmp bl,90
                 jbe eletra
    ;compara bl com 97(a),se for menor salta para o rotulo desconhecido.
                 cmp bl,97
                 jb  desconhecido
    ;compara bl com 122(z),se for menor ou igual salta para  o rotulo eletra.
                 cmp bl,122
                 jbe eletra
    ;se nao for verdadeiro, salta incondicionalmete para desconhecido.
                 jmp desconhecido
    ;rotulo que exibe a variavel letra.
    eletra:      
                 mov ah,9
                 mov dx,offset letra
                 int 21h
                 jmp retorno
    ;rotulo que finaliza o código.
    retorno:     
                 cmp bl,0
                 jae inicio

    fim:         
                 mov ah,4ch
                 int 21h

                 


main endp
end main    

