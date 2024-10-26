.model small
.data
    msg1 db 10,13,"Digite o dividendo :$"
    msg2 db 10,13,"Digite o divisor :$"
    msg3 db 10,13,"Quociente :$"
    msg4 db 10,13,"Resto:$"
.code
main proc
    ;permite acesso de data atraves de ds
              mov ax,@data
              mov ds,ax
    ;exibe pela função 09 a string msg1
              mov ah,09
              lea dx,msg1
              int 21h
    ;recebe um caractere
              mov ah,01
              int 21h
    ;converte o valor recebido em caractere  para numerico e coloca em bl para liberar al
              and al,0fh
              mov bl,al
    ;exibe a string msg2
              mov ah,09
              lea dx,msg2
              int 21h
    ;recebe um caractere
              mov ah,01
              int 21h
    ;tranforma em numerico e move para bh
              and al,0fh
              mov bh,al
    ;zera o valor de cl para usar de quociente
              xor cl,cl
    
    subtracao:
    ;faz a subtração do dividendo pelo divisor
              sub bl,bh
    ;incrementa o quociente
              inc cl
    ;compara bl com bh se maior ou igual salta para subtrair novamente
              cmp bl,bh
              jae subtracao

    ;exibe a string msg3
              mov ah,09
              lea dx,msg3
              int 21h
    ;move o quociente(cl) para dl para exibir o caractere pelo 02h
              mov dl,cl
    ;trasforma de numero para caractere
              or  dl,30h
              mov ah,02
              int 21h
    ;exibe a string msg4
              mov ah,09
              lea dx,msg4
              int 21h
    ;volta o valor de bl para caractere e move para dl para exibir o caracete(resto)
              or  bl,30h
              mov dl,bl
              mov ah,02
              int 21h
    ;finaliza o codigo 
              MOV AH,4CH
              INT 21H
main endp
end main