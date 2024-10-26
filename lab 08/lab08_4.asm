.model small
.data
.code
main proc
           mov bx,0ba11h    ;bx recebe um valor em hexa
           mov ch,4
           mov cl,4         ;ch e cl recebem 4 para usar de contador de caracteres e deslocamento e prepara para imprimir 
           mov ah,02 
    p1:    
           mov dl,bh        ;coloca em dl 8 bits de bx
           shr dl,cl        ;desloca 4 para esquerda para restar 4 bits em dl 
           cmp dl,0Ah       ;tsta se os 4 bits é numero ou letra
           jae eLetra
           add dl,30h       ; soma 30h no numero para virar caractere
           jmp p2    
    eLetra:
           add dl,37h       ; soma 37h no valor em letra hexa para virar caracete
    p2:    
           int 21H          ;imprime o caracete
           rol bx,cl        ;roda 4 bits para direita para fazer o outro caractere em hexa 
           dec ch           ;decremeta ch e faz o for com 4 numeros 
           jnz p1
             
    fim:   
           MOV AH,4CH       ;finaliza o programa 
           INT 21H
main endp
end main