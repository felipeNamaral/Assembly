title 
.model SMALL
.stack 100h

pulaLinha MACRO
              mov ah,02
              mov dl,10
              int 21h
              mov ah,02
              mov dl,13
              int 21h
ENDM

.DATA
    msg1   db "        //BATALHA NAVAL\\    $"
    msg2   db "Pressione Enter para comecar$"
    msg3   db "Digite o valor de X de 0 a 19 e pressione enter $"
    msg4   db "Digite o valor de y de 0 a 19 e pressione enter  $"
    msg5   db "Voce ganhou !! fim de jogo $"
    

    matriz db 400 dup(0)
           
.code
main proc
                  mov       ax,@DATA
                  mov       ds,ax
                  MOV       es,ax

                  call      iniciaJogo
                  call      geraBarco
                  call      imprimeMatriz
                  call      tiro
                  call      fimdejogo


                  mov       ah,4ch
                  int       21h
                  
main endp

iniciaJogo proc
    ;inicia o jogo mostrando o titulo e pressione enter para continuar
                  mov       ah,09
                  lea       dx,msg1
                  int       21h
                  pulaLinha
                  pulaLinha
                  mov       ah,09
                  lea       dx,msg2
                  int       21h

                  mov       ah,1
    inicio:       
                  int       21h
                  cmp       al,13
                  je        inicioFim
                  jmp       inicio

    inicioFim:    
                  ret
iniciaJogo endp

geraBarco proc
    ;gera um  numero aleatorio e salta para um modelo de barcos aleatorio
                  mov       ah,00h
                  int       1Ah
                  mov       ax,dx
                  and       ax,3
                  mov       al,3
    ; ax tem um numero alelatorio de 0 a 3
                  cmp       al,0
                  je        g0
                  cmp       al,1
                  je        g1
                  cmp       al,2
                  je        g2
                  jmp       modo3
    ; gambiarra
    g0:           
                  jmp       modo0
    g1:           
                  jmp       modo1
    g2:           
                  jmp       modo2


    modo3:        
    ; Encouraçado
                  mov       bx,0
                  mov       si,10
                  mov       cx,2
    pt1E:         
                  mov       matriz[bx][si],1
                  inc       si
                  loop      pt1E
                
    ; ;  Fragata
    ;                 mov       bx,40
    ;                 mov       si,2
    ;                 mov       cx,3
    ; pt1f:
    ;                 mov       matriz[bx][si],1
    ;                 inc       si
    ;                 loop      pt1f

    ; ;  Submarino1
    ;                 mov       bx,180
    ;                 mov       si,17
    ;                 mov       cx,2
    ; pt1s1:
    ;                 mov       matriz[bx][si],1
    ;                 inc       si
    ;                 loop      pt1s1
    ; ;submarino2
  
    ;                 mov       bx,140
    ;                 mov       si,3
    ;                 mov       cx,2
    ; pt1Es2:
    ;                 mov       matriz[bx][si],1
    ;                 inc       si
    ;                 loop      pt1Es2

    ; ; Hidroavião1
                
    ;                 mov       bx,280
    ;                 mov       si ,5
    ;                 mov       matriz[bx][si],1
    ;                 dec       SI
    ;                 mov       matriz[bx][si],1
    ;                 sub       bx,20
    ;                 mov       matriz[bx][si],1
    ;                 add       bx,40
    ;                 mov       matriz[bx][si],1
    ;                 mov       bx,60
    ;                 mov       si, 14
    ; ; Hidroavião
    ;                 mov       bx,80
    ;                 mov       si ,15
    ;                 mov       matriz[bx][si],1
    ;                 dec       SI
    ;                 mov       matriz[bx][si],1
    ;                 sub       bx,20
    ;                 mov       matriz[bx][si],1
    ;                 add       bx,40
    ;                 mov       matriz[bx][si],1
    ;                 mov       bx,60
    ;                 mov       si, 14

                  ret



    modo2:        
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
    modo1:        
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
    modo0:        
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

                  ret
geraBarco endp


imprimeMatriz proc
    ; ;imprime a matriz no valor atual que ela se encontra com a máscara aplicada
    ;                 mov       ah, 09h
    ;                 lea       dx, msg1
    ;                 int       21h
    ;                 pulaLinha
    ;                 pulaLinha
    ;                 xor       bx, bx
    ;                 mov       cx, 20
    ;                 mov       ah, 02h
    ; pt1:
    ;                 mov       dl, matriz[bx]
    ; ; Aplica máscara com AND para distinguir os valores
    ;                 mov       al, dl
    ;                 and       al, 0Ch              ; Aplica máscara `AND 0Ch`
    ;                 cmp       al, 0                ; Água ou barco
    ;                 je        mostraAguaBarco
    ;                 cmp       al, 4                ; Acerto
    ;                 je        mostraAcerto
    ;                 cmp       al, 8                ; Erro
    ;                 je        mostraErro
    ;                 jmp       exibeCaractere
    ; mostraAguaBarco:
    ;                 mov       dl, '~'              ; Exibir ~ para água e barco
    ;                 jmp       exibeCaractere
    ; mostraAcerto:
    ;                 mov       dl, 'X'              ; Exibir X para acerto
    ;                 jmp       exibeCaractere
    ; mostraErro:
    ;                 mov       dl, 'O'              ; Exibir O para erro
    ; exibeCaractere:
    ;                 int       21h
    ;                 inc       bx
    ;                 cmp       bx, 400
    ;                 je        fimMatriz
    ;                 dec       cx
    ;                 jnz       pt1
    ;                 mov       cx, 20
    ;                 pulaLinha
    ;                 jmp       pt1
    ; fimMatriz:
                  ret
imprimeMatriz endp


tiro proc
    ;o jogador da o tiro informando x,y e troca valor da matriz
                  pulaLinha
                  mov       ah,09
                  lea       dx,msg3
                  int       21h
                  pulaLinha


                  xor       bx,bx
    x:            
                  mov       ah,01
                  int       21h
                  cmp       al,13
                  je        saix
                  and       ax,000fh
                  PUSH      ax
                  mov       ax,10
                  mul       bx
                  pop       BX
                  add       bx,ax
                  jmp       x
    saix:         
                  mov       si,bx

                  mov       ah,09
                  lea       dx,msg4
                  int       21h
                  pulaLinha

                  xor       bx,bx
    y:            
                  mov       ah,01
                  int       21h
                  cmp       al,13
                  je        saiy
                  and       ax,000fh
                  PUSH      ax
                  mov       ax,10
                  mul       bx
                  pop       BX
                  add       bx,ax
                  jmp       y
    saiy:         
    ;valor ja esta em bx
                  mov       ax,20
                  mul       bx
                  mov       bx,ax

                  call      validatiro

                  ret
tiro endp

validatiro proc
    ;compara valor digitado com o valor da matriz e muda a mensagem

                  mov       dl,matriz[bx][si]
                  cmp       dl,1
                  je        acertou
                  cmp       dl,4
                  je        saiV
                  mov       matriz[bx][si],8
                  jmp       saiV
    acertou:      
                  mov       matriz[bx][si],4
    saiV:         
                    
                    
                  mov cx,400
                  cld
                  lea       di,matriz
                  mov       al,1
                  repne     scasb
                  jz        saidaFim

                  ret

    saidaFim:     
                  call      imprimeMatriz
                  jmp      tiro
validatiro endp


fimdejogo proc
                

                  pulaLinha
                  mov       ah,09
                  lea       dx,msg5
                  int       21h

                  ret

fimdejogo endp
end main 
