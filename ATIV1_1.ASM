TITLE Mensagens
.model small
.data
    msg1 db "Mensagem 1.$"
    msg2 db 10,13,"Mensagem 2.$"
.code
 main proc 
    mov ax,@data
    mov ds,ax

    mov ah,9
    lea dx,msg1
    int 21h

    mov ah,9
    lea dx,msg2
    int 21h

    mov ah,4ch
    int 21h
main endp
end main

