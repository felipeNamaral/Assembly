Title soma de numeros 
.model small
.data
    tex1 db 'Digite um primeiro numero:$'
    tex2 db 'Digite um segundo numero:$'
    tex3 db  'A soma dos dois numeros eh:$'
.code
main proc 
;move o data para ds ,passando por ax(nao pode passar direto)
 mov ax, @data
 mov ds,ax 
 ;imprime a mensagem do texto 1 na tela
 mov ah,9
 lea dx,tex1
 int 21h
 ;campo para inserir um caractere 
 mov ah, 1
 int 21h
 ; move para bl o caractere digitado 
 mov bl,al
 ; subtrai 30h de bl para virar um numero em hexadecimal 
 sub bl, 30h
;pula a linha e via para a esquerda 
 mov ah,2
 mov dl,10
 int 21h
;exibe na tela o texto 2 
 mov ah,9
 lea dx,tex2
 int 21h 
; solicita um novo caractere 
 mov ah, 1
 int 21h
;subtrai 30h de al pra virar o numero em hexadecima 
 sub al,30h
 ;armazena o dado em cl para liberar o al 
 mov cl,al
;pula a linha e vai para a esquerda 
 mov ah,2
 mov dl,10
 int 21h
;exibe na tela o texto 3 
 mov ah,9
 lea dx,tex3
 int 21h
; faz a soma dos numeros armazenados em bl e cl que ja estao em hexadecimal 
 add bl,cl
;adiciona 30h para voltar o numero  
 add bl,30h
;imprime a soma dos dois numeros solicitados 
 mov ah,2
 mov dl,bl
 int 21h
;finaliza o codigo 
 mov ah,4ch
 int 21h

main endp
end main 