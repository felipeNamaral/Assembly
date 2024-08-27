TITLE Caractere
.model small
.data
    msg1 db "Digite um caractere:$"
    msg2 db "O caractere digitado foi:$"
.code
main proc
    mov ax,@data
    mov ds,ax
    ;exibe a mensagem com a função 9 que printa a mensagem salva em .data  
    mov ah,9
    lea dx,msg1
    int 21h 
    ;le um caractere inserido no teclado com a função 1 e guarda no al 
    mov ah,1
    int 21h
    ; coloca ao caractere digitado no bl 
    mov bl,al
    ;move o cursor para a proxima linha 
    mov ah,2
    mov dl,10
    int 21h
    ;move o cursor para a esquerda 
    mov ah,2
    mov dl,13
    int 21h
    ;exibe a mensagem dois armazenada em .data 
    mov ah,9
    lea dx,msg2
    int 21h
    ;imprime o caractere digitado e armazenado no bl
    mov ah,2
    mov dl,bl
    int 21h

main endp
end main    







