title imprime matriz
.model small
.stack 100h
pulalinha macro
    ;macro para pular linha salvando os registradores
              push ax
              push dx
              mov  ah,02
              mov  dl,10
              int  21h
              pop  dx
              pop  ax
endm
.data
    matriz db 1,2,3,4
           DB 4,3,2,1
           DB 5,6,7,8
           DB 8,7,6,5
.code
main proc
               mov       ax,@DATA
               mov       ds,ax

               call      leeIMprime           ;vai para os respectivos procedimentos

               mov       ah,4CH               ;finaliza o codigo
               int       21h
main endp

leeIMprime proc
    ;procedimento que le e imprime uma matriz pulando linha
               xor       bx,bx                ;bx e si sao zerados para apontar para o primeiro valor da matriz
               xor       si,si
               mov       cx,16                ;cx recebe a quantidade de valores que tem a matriz

    a:         
               mov       ah,02                ; prepara para imprimr
               mov       dl,matriz[bx][si]    ;coloca em dl o valor que bx e si apontam
               or        dl,30h               ;transforma para caracere e imprime
               int       21h
               inc       si                   ;si aponta para proximo valor e quando for 4 pula linha e imprime novamente
               cmp       si,4
               je        p
               jmp       fim
    p:         
               pulalinha
               add       bx,4                 ;quando pula linha bx aponta para proxima linha add 4
               xor       si,si                ;si aponta pra primeiro valalor da coluna
    fim:       
               loop      a                    ;faz isso 16 vezes

               ret

leeIMprime endp
end main