.model small
.data
    msg1 db 10,13,"Digite o multiplicando :$"
    msg2 db 10,13,"Digite o multiplicandor :$"
    msg3 db 10,13,"produto :$"
.code
main proc
    ;permite acesso de data atraves de ds
         mov  ax,@data
         mov  ds,ax
    ;exibe pela função 09 a string msg1
         mov  ah,09
         lea  dx,msg1
         int  21h
    ;recebe um caractere
         mov  ah,01
         int  21h
    ;converte o valor recebido em caractere e para numerico e coloca em bh para liberar al
         and  al,0fh
         mov  bh,al
    ;exibe a string msg2
         mov  ah,09
         lea  dx,msg2
         int  21h
    ;recebe um caractere
         mov  ah,01
         int  21h
    ;trasnforma para numerico e move para cl para ser usado de contador no loop(multiplicador)
         and  al,0fh
         mov  cl,al

    soma:
    ;adiciona em bl(que é 0)o multiplcando (bh) a quantidade de cl
         add  bl,bh
         loop soma
    ;exibe a string msg3
         mov  ah,09
         lea  dx,msg3
         int  21h
    ;volta para caractere o valor numerico de bl e move para dl para ser exibido
         or   bl,30h
         mov  dl,bl
    ;exibe o caractere
         mov  ah,02
         int  21h
    ;finaliza o codigo
         MOV  AH,4CH
         INT  21H
main endp
end main