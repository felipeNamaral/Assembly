Title Letra Maiúscula
.model small
.data
    tex1 db 'Digite uma letra minuscula:$'
    tex2 db 'A letra maiuscula correspondente eh:$'
.code
main proc 
    ;move o data para ds ,passando por ax(nao pode passar direto)
    mov ax,@data
    mov ds,ax
    ;imprime a mensagem do texto 1 na tela
    mov ah,9
    lea dx,tex1
    int 21h
    ;campo para inserir um caractere 
    mov ah, 1
    int 21h
    ;move o caractere inserido de al para bl 
    mov bl,al
    ;subtrai 20h em hexadecimal pra trasformar o caractere minusculo em maiusculo
    sub bl,20h 
    ;pega o caractere  
    mov ah,2
    mov dl,10
    int 21h
    ; volta para a esquerda do visor para nova frase 
    mov ah,2
    mov dl,13
    int 21h
    ; imprime a mensagem 2 na tela 
    mov ah,9
    lea dx,tex2
    int 21h
    ; imprime o numero subtraido na tela 
    mov ah,2
    mov dl,bl
    int 21h
    ; termina o codigo
    mov ah,4ch
    int 21h



main endp
end main    