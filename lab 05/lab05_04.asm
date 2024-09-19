 Title Letras maiusculas linha 
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
    mov cx,26
    mov bl,4
    mov bh,10
    mov dl,'a'
    mov ah,02
    primeiroloop:
    int 21H
    inc dl
    dec bl
    jnz salta
    xchg dl,bh
    mov ah,02
    int 21h
    xchg dl,bh
    mov bl,4
    salta:
    loop primeiroloop


    fim:      
              MOV  AH,4CH       ; finaliza o programa
              INT  21H
MAIN ENDP
END MAIN