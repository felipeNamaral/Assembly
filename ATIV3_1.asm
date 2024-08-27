title Numero 
; esse programa utiliza as instruções de comparação(cmp),salto(jb,jmp,ja) e a criação de rotúlos(:), para verificar se o caractere digitado pelo usúario é um numero ou nao.
.model small
.stack 100h
;armazena variáveis    
.data
    msg  db "Digite um caractere: $"
    sim  db 10,13,"O caractere digitado e um numero.$"
    nao  db 10,13,"O caractere digitado nao e um numero.$"
.code
main proc
    ;acessa às variaveis em.data (nao pode acessar direto pelo ds)
               mov ax,@data
               mov ds,ax
    ;exibe a string msg na tela atraves da função 9 da interrupção 21h
               mov ah,9
               mov dx, offset msg
               int 21h
    ;le um caractere digitado e armazena em al atraves da função 1
               mov ah,1
               int 21h
    ;coloca em bl o conteudo lido em al para liberar al para nova leitura
               mov bl,al
    ;compara bl com 48(codigo de 0 na tabela ASCII)
               cmp bl,48
    ;Se bl for menor que 48 salta para o rotulo naoenumero
               jb  naoenumero
    ; compara bl com 57(codigo de 9 na tabela ASCII)
               cmp bl,57
    ; Se bl for maior que 57, salta para naoenumero
               ja  naoenumero
    ; Se o caractere digitado for um numero imprime o conteudo da variavel sim
               mov ah,9
               mov dx,offset sim
               int 21h
    ;Após exibir a variavel na tela salta para o rotulo fim
               jmp fim
    ;rotulo naoenumero
    naoenumero:
    ;exibe na tela o conteudo da variavel nao
               mov ah,9
               mov dx,offset nao
               int 21h
    ;rotulo fim
    fim:       
    ;finaliza o programa atravez da função 4ch
               mov ah,4ch
               int 21h
main endp
end main    

