.model small
.data
.code
main proc
             xor bx,bx   
             mov cx,4   ;limpa bx , coloca 4 em cx para usar de contador  e solicita um caracete
             mov ah,01
    entrada: 
             int 21h
             cmp al,13  ;compara o caractere digitado com enter se for finaliza o programa
             je  fim
             cmp al,39h  ;compara o valor digitado com 39 para saber se e letra ou numero se for letra salta 
             jg  eLetra
             and al,0fh ;trasforma o caractere digitado em numero
             jmp converte
    eLetra:  
             sub al,37h     ;subtrai 37 de da letra digitada para transformar em numero binario
    converte:
             shl bx,4       ;desloca 4 para direita para colocar o numero em binario
             or  bl,al      ;coloca o valor em binario nos 4 bits 
             loop entrada
    fim:     
             MOV AH,4CH     ;finaliza o codigo 
             INT 21H
main endp
end main