 Title Letras maiusculas linha 
.MODEL SMALL
.STACK 100H
.data
    tex1 db 'Digite um numero:$'
    tex2 db 'a soma dos 5 numeros deu:$'
.CODE
MAIN PROC
    mov ax,@data
    mov ds, ax

    mov cx,5
pedidoDeNumero:
    mov ah,09h
    lea dx,tex1
    int 21h 

    mov ah,01h
    int 21h

    sub al,30h

    add bl,al

    mov ah,02h
    mov dl,10
    int 21H

    loop pedidoDeNumero

somaDoNumeros:

mov ah,09h
lea dx, tex2
int 21h

add bl, 30h

mov ah,02h
mov dl,bl 
int 21h


    fim:      
              MOV  AH,4CH       ; finaliza o programa
              INT  21H
MAIN ENDP
END MAIN