title entrda e saida decimal 
.model SMALL
.stack 100h
pulalinha macro
    ;macro para pular linha salvando os valores dos registradores
              push ax
              push dx
              mov  ah,02
              mov  dl,10
              int  21h
              pop  dx
              pop  ax

endm
.data
    matriz db 1,0,5,2
           DB 2,0,1,4
           DB 0,1,6,0
           DB 4,3,0,3

    msg1   db "A soma da matriz e: $"

.code
main proc
             mov       ax,@DATA
             mov       ds,ax


             call      lematriz
             call      soma                 ;vai para os respectivos procedimentos


             mov       ah,4ch               ;finaliza o codigo
             int       21h
main endp
lematriz proc

    ;procedimento que le e  imprime a matriz pulando linha
             xor       bx,bx
             xor       si,si                ;zera bx e si para aponar para o primeiro valor da matriz
             mov       cx,16                ;contador de 16 numero de elementos da matriz

    a:       
             mov       ah,02                ;prepara para imprimir
             mov       dl,matriz[bx][si]    ;coloca o valor da matriz em dl para imprir e transforma em caractere
             or        dl,30h
             int       21h                  ;imprime o numero da matriz
             inc       si                   ;vai para o proximo valor da matriz incrementado 1 ,se for 4 pula linha se nao continua imprimindo
             cmp       si,4
             je        p
             jmp       fim
    p:       
             pulalinha
             add       bx,4                 ;pula  linha com a macro ,e passa para proxima linha da matriz adicionando 4 a bx
             xor       si,si                ;aponta para a primeira coluna da matriz
    fim:     
             loop      a                    ;faz a leitura e escrita 16 vezes
             ret
lematriz endp
soma proc
    ;procedimento que soma todos os valores da matriz e imprime o resultado
             pulalinha
             xor       bx,bx                ;bx aponta para o primeiro valor da matriz e dx é zerado para receber o valor da soma
             xor       dx,dx
    ab:      
             xor       si,si                ;si aponta para o primeiro numero da matriz
             mov       cx,4                 ; cx é o contador de caracteres na linha da matriz
    abc:     
             add       dl,matriz[bx+si]     ;é adicionado no dl , o valor da matriz que aponta bx+ si
             inc       si                   ;si recebe o proximo valor
             loop      abc                  ;faz isso 4 vezes e passa para a proxima linha
             add       bx,4
             cmp       bx,16
             jne       ab
             push      dx                   ; guarda o valor de dx na pilha para poder imprimir a msg de soma
             mov       ah,9
             lea       dx,msg1              ;imprime a msg de soma
             int       21H
             pop       dx                   ;volta o valor guardado na pilha
             mov       ax,dx                ;coloca em ax o resultado da soma

             mov       bx,10                ;bx recebe 10 para fazer a divisao
             xor       cx,cx                ;cx vai ser o contador de quantos valores foram para a pilha
    imprimea:
             xor       dx,dx                ;zera dx para reber o resto da divisao
             div       bx                   ;divide ax por bx e guarda o resto na pilha
             push      dx
             inc       cx                   ;incrementa  cx
             cmp       al,0                 ;faz esse procedimento até ax ser 0
             jne       imprimea
             mov       ah,02                ;prepara para imprimir
    imprimeB:
             pop       dx                   ;desenpilha os valores do resto transforma em numero e imprime
             or        dl,30h
             int       21H
             loop      imprimeB
             ret
soma endp
end main