title batalha naval
.model SMALL
.stack 100h

pulaLinha MACRO
  ;macro para pular linha
            mov ah,02
            mov dl,10
            int 21h
            mov ah,02
            mov dl,13
            int 21h
ENDM

.DATA
  msg1   db "        //BATALHA NAVAL\\    $"
  msg2   db "Pressione Enter para comecar ou Esc para sair$"
  msg3   db "Digite o valor de X de 0 a 19 ou Esc para sair $"
  msg4   db "Digite o valor de y de 0 a 19 ou Esc para sair  $"
  msg5   db "Voce ganhou !! fim de jogo $"
    

  matriz db 400 dup(0)                                           ;matriz 20x20 com valores em inicialmente em 0

.code
main proc
                   mov       ax,@DATA
                   mov       ds,ax
                   mov       es,ax

                   call      iniciaJogo
                   call      geraBarco
                   call      imprimeMatriz
                   call      tiro
                   call      fimdejogo


                   mov       ah,4ch             ;finaliza o codigo
                   int       21h
                  
main endp

iniciaJogo proc
  ;inicia o jogo mostrando o titulo e pressione enter para continuar
                   mov       ah,09
                   lea       dx,msg1            ;exibe o titulo do jogo
                   int       21h
                   pulaLinha
                   pulaLinha
                   mov       ah,09
                   lea       dx,msg2            ;exibe a mensagem de de iniciar o jogo
                   int       21h

                   mov       ah,1
  inicio:          
                   int       21h
                   cmp       al,13              ;recebe um caractere digitado se for enter comeeça o jogo e se for esc finaliza o codigo
                   je        inicioFim
                    
                   cmp       al,1bh             ;1bh é a tecla esc na tebela ascii
                   je        quebraI
                   jmp       inicio

  inicioFim:       
                   ret                          ;volta para o main para ir no proximo procedimento

  quebraI:         
                   mov       ah,4ch             ;finaliza o codigo
                   int       21h

iniciaJogo endp

geraBarco proc
  ;procedimento que gera um  numero aleatorio entre 0 e 3 e baseado nesse numero  salta para um modelo de barco difirente
  ;os modelos trocam o valor da matriz para 1 ,para sinalizar os barcos
                   mov       ah,00h
                   int       1Ah                ;pega o timer do sistema e armazena em os ticks do sistema em ax e dx
                   mov       ax,dx              ;trafere o valor de dx para ax
                   and       ax,3               ;aplica um and 3 para ficar so com os 2 ultimos bits do numero assim tendo um numero entre 0 e 11 em bbinario

  ; ax tem um numero alelatorio de 0 a 3
                   cmp       al,0
                   je        g0
                   cmp       al,1               ;compra o numero gerado e salta para um dos 4 modelos de embarcação dispostas na matriz
                   je        g1
                   cmp       al,2
                   je        g2
                   jmp       modo3
  ; ampliar o saltos condicionais
  g0:              
                   jmp       modo0
  g1:              
                   jmp       modo1              ;labels para ampliar os saltos condicionais
  g2:              
                   jmp       modo2


  modo3:                                        ;modelo 3 de disposição dos barcos na matriz
  ; Encouraçado
                   mov       bx,0
                   mov       si,10
                   mov       cx,4
  pt1E:            
                   mov       matriz[bx][si],1   ;coloca um encouraçado na linha 0 e coluna 10
                   inc       si                 ;muda os valores das 4 colunas na mesma linha
                   loop      pt1E
                
  ;  Fragata
                   mov       bx,40
                   mov       si,2
                   mov       cx,3
  pt1f:            
                   mov       matriz[bx][si],1   ;coloca na matriz na linha 2 coluna 2 um barco de 3 casas na mesma linha
                   inc       si
                   loop      pt1f

  ;  Submarino1
                   mov       bx,180
                   mov       si,17
                   mov       cx,2
  pt1s1:           
                   mov       matriz[bx][si],1   ;coloca na matriz um barco de duas casas na linha 9 coluna 17
                   inc       si
                   loop      pt1s1
  ;submarino2
  
                   mov       bx,140
                   mov       si,3
                   mov       cx,2
  pt1Es2:          
                   mov       matriz[bx][si],1   ;coloca outro submarino na posição
                   inc       si
                   loop      pt1Es2

  ; Hidroavião1
                
                   mov       bx,280
                   mov       si ,5
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20              ;coloca o hidroavião na matriz mudando o valor de bx e si para 1 e posteriormente decrementa si para ir na coluna anterior decremetna bx para subir uma linha depois subtrai 40 para ir duas linhas para baixo
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14
  ; Hidroavião
                   mov       bx,80
                   mov       si ,15
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1   ;coloca nos memos pradrao o outro hidroaviao em uma posição diferente
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14

                   ret                          ;volta pra o main para continuar o jogo



  modo2:                                        ;faz o mesmo procedimento do modo3 apenas mundando a posição das embarcaçoes
  ; Encouraçado
                   mov       bx,220
                   mov       si,5
                   mov       cx,4
  pt1E2:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1E2
                
  ;  Fragata
                   mov       bx,20
                   mov       si,3
                   mov       cx,3
  pt1f2:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1f2

  ;  Submarino1
                   mov       bx,80
                   mov       si,15
                   mov       cx,2
  pt1s12:          
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1s12
  ;submarino2
  
                   mov       bx,140
                   mov       si,3
                   mov       cx,2
  pt1Es22:         
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1Es22

  ; Hidroavião1
                
                   mov       bx,340
                   mov       si ,7
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14
  ; Hidroavião
                   mov       bx,300
                   mov       si ,17
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14

                   ret
  modo1:                                        ;faz o mesmo procedimento do modo3 apenas mundando a posição das embarcaçoes
  ; Encouraçado
                   mov       bx,360
                   mov       si,5
                   mov       cx,4
  pt1E1:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1E1
                
  ;  Fragata
                   mov       bx,240
                   mov       si,13
                   mov       cx,3
  pt1f1:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1f1

  ;  Submarino1
                   mov       bx,180
                   mov       si,17
                   mov       cx,2
  pt1s11:          
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1s11
  ;submarino2
  
                   mov       bx,140
                   mov       si,3
                   mov       cx,2
  pt1Es21:         
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1Es21

  ; Hidroavião1
                
                   mov       bx,80
                   mov       si ,5
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14
  ; Hidroavião
                   mov       bx,80
                   mov       si ,15
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14

                   ret
  modo0:                                        ;faz o mesmo procedimento do modo3 apenas mundando a posição das embarcaçoes
  ; Encouraçado
                   mov       bx,360
                   mov       si,15
                   mov       cx,4
  pt1E0:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1E0
                
  ;  Fragata
                   mov       bx,360
                   mov       si,2
                   mov       cx,3
  pt1f0:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1f0

  ;  Submarino1
                   mov       bx,20
                   mov       si,1
                   mov       cx,2
  pt1s0:           
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1s0
  ;submarino2
  
                   mov       bx,140
                   mov       si,3
                   mov       cx,2
  pt1Es0:          
                   mov       matriz[bx][si],1
                   inc       si
                   loop      pt1Es0

  ; Hidroavião1
                
                   mov       bx,200
                   mov       si ,13
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14
  ; Hidroavião
                   mov       bx,40
                   mov       si ,15
                   mov       matriz[bx][si],1
                   dec       SI
                   mov       matriz[bx][si],1
                   sub       bx,20
                   mov       matriz[bx][si],1
                   add       bx,40
                   mov       matriz[bx][si],1
                   mov       bx,60
                   mov       si, 14

                   ret                          ;volta para o main para continuar o jogo
geraBarco endp

imprimeMatriz proc
  ;imprime a matriz no valor atual que ela se encontra de acordo com o valor da matriz 0,1,4,8 imprimindo o 0 e 1 com o mesmo caractere na esconder o barco
                   pulaLinha
                   mov       ah, 09h
                   lea       dx, msg1           ;exibe o tiltulo do jogo
                   int       21h
                   pulaLinha
                   pulaLinha
                   xor       bx, bx
                   mov       cx, 20             ;cx recebe o valor de caracetes por linha
                   mov       ah, 02h            ;prepara para imprimir
  pt1:             
                   mov       dl, matriz[bx]     ;dl recebe o valor da matriz indicado por bx (inicialmente 0)
    
                   mov       al, dl
                   and       al, 0Ch            ; Aplica máscara and 0ch para transformar 1 e 0 em zero e manter os valores 4 e 8
                   cmp       al, 0              ;se for agua ou barco ( valor 0 apos a mascara ) salta para imprimir '~'
                   je        aguaBarco
                   cmp       al, 4              ; se for 4 salta para imprimir x para indicar o acerto
                   je        exibeAcerto
                   cmp       al, 8              ; sefor 8 salta para imprimir O para indicar erro
                   je        exibeErro
                   jmp       imprimecaractere
  aguaBarco:       
                   mov       dl, '~'            ; dl recebe ~ para água e barco
                   jmp       imprimecaractere
  exibeAcerto:     
                   mov       dl, 'X'            ; dl recebe X para acerto
                   jmp       imprimecaractere
  exibeErro:       
                   mov       dl, 'O'            ; dl recebe O para erro
  imprimecaractere:
                   int       21h
                   inc       bx                 ;imprime o caractere baseado no valor da matriz
                   cmp       bx, 400            ;se ja exibou os 400 caracteres salta para voltar na main
                   je        fimMatriz
                   loop      pt1                ;exibe 20 valores até cx ser 0 ,qunado for 0 pula linha e faz novamente até imprimir os 400 caractes
                   mov       cx, 20
                   pulaLinha
                   jmp       pt1
  fimMatriz:       
                   ret                          ;volta para main para ir para o proximo procedimento
imprimeMatriz endp

tiro proc
  ;o jogador da o tiro informando dois valores entre 0 e 20 para usar de x e y
                   pulaLinha
                   mov       ah,09
                   lea       dx,msg3            ;msg que solicita o valor de x
                   int       21h
                   pulaLinha


                   xor       bx,bx
  x:               
                   mov       ah,01              ;solicita um caractere
                   int       21h
                   cmp       al,13              ;se for enter sai da entrada decimal
                   je        saix
                   cmp       al,1bh             ;compara a entrada com esc para sair do codigo
                   je        quebra
                   and       ax,000fh           ;trasforma o caractere em numero
                   PUSH      ax                 ;salva na pilha e coloca 10 em ax pra multiplocar bx
                   mov       ax,10
                   mul       bx                 ;bx vai receber o numero multiplicado por 10
                   pop       BX                 ;volta o valor digitado e soma com bx para ter o numero final
                   add       bx,ax
                   jmp       x                  ;salta para fazer novamente
  saix:            
                   mov       si,bx              ;si recebe o primeiro valor (coluna)

                   mov       ah,09
                   lea       dx,msg4            ;msg que solicita a o valor da linha(bx)
                   int       21h
                   pulaLinha

                   xor       bx,bx
  y:               
                   mov       ah,01
                   int       21h
                   cmp       al,13
                   je        saiy
                   cmp       al,1bh
                   je        quebra             ;faz o mesmo procedimento da entrada do x (coluna),perem o numero fica em bx
                   and       ax,000fh
                   PUSH      ax
                   mov       ax,10
                   mul       bx
                   pop       BX
                   add       bx,ax
                   jmp       y
  saiy:            
  ;valor ja esta em bx
                   mov       ax,20              ;ax recebe 20 para multiplicar o valor da linha inserido (matriz tem 20 valores por linha)
                   mul       bx
                   mov       bx,ax

                   call      validatiro         ;vai para o procedimento de validar o tiro

                   ret                          ;volta para o main


  quebra:          
                   mov       ah,4ch             ;se o esc for apartado finaliza o codigo
                   int       21h
tiro endp

validatiro proc
  ;procedimento que valida o tiro mudando o valor da matriz no local desejado ,depois verifica se todos as embarcaçoes foram acertadas
  
                   mov       dl,matriz[bx][si]  ;coloca em dl o valor da matriz baseado no tiro do usuario
                   cmp       dl,1
                   je        acertou            ;se o valor da matriz for um salgta pra acerto
                   cmp       dl,4
                   je        saiV               ;se o valor digitado ja estiver marcado nao faz nada e continua o codigo
                   mov       matriz[bx][si],8   ;se o tiro nao acertou a embarcação muda o valor para 8
                   jmp       saiV
  acertou:         
                   mov       matriz[bx][si],4   ;se o tiro acertou a embarcação muda o valor da matriz para 4
  saiV:            
  saiV:                                         ;verifica se todas as embarcaçoes ja foram acertadas para finaliazar o codigo
                   mov       cx,400
                   cld                          ;cx recebe o numero de caracteres da matriz e df é zerado 
                   lea       di,matriz          ;di acessa a matriz   
                   mov       al,1               ;al recebe 1 para ser comparado com os valores da matriz 
                   repne     scasb              ;compara cada elemento da matriz com al até ser igual ,se nao tiver volta para tiro que volta pra main 
                   jz        VoltaTiro          ;se tiver embarcação salta para imprimir a matriz atualizada e solicitar um novo tiro  


                  call imprimeMatriz            ;imprime a matriz com todos as embarcaçoes atingidas  
                   ret                          ;volta para tiro 

  VoltaTiro:       
                   call      imprimeMatriz        ;imprime a matriz atualizada 
                   jmp       tiro                 ;salta pra tiro 
validatiro endp

fimdejogo proc
;procedimento que imprime a msg de fim de jogo 
                
                   mov       cx,2    ;cx recebe 2 para imprimir a msg duas vezes 
  msgFim:          
                   pulaLinha
                   mov       ah,09
                   lea       dx,msg5    ;imprime a msg de fim de jogo 
                   int       21h
                   loop      msgFim
                   ret                  ;volta pra main
fimdejogo endp
end main 
