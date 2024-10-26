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
    msg2   db "Precione Enter para comecar$"
    msg3   db "Digite o valor de X de 00 a 19 ou enter para sair $"
    msg4   db "Digite o valor de y de 00 a 19 ou enter para sair  $"
    msg5   db "Voce ganhou !! fim de jogo $"

    matriz db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
           db 20 dup(30h)
.code

main proc
                  mov       ax,@DATA
                  mov       ds,ax


                  mov       ah,09h
                  lea       dx,msg1
                  int       21h

                  pulaLinha
                  pulaLinha

                  mov       ah,09h
                  lea       dx,msg2
                  int       21h

                  pulaLinha

                  mov       ah,01
    a:            
                  int       21h
                  cmp       al,13
                  jne       a
    ; inicia o jogo
  
                  call      barco
                  call      imprimeMatriz

    b:            
                  call      tiro
                  jmp       b
    fim:          
                  mov       ah,4CH
                  int       21h



main endp

barco proc
                  mov       ah,00h
                  int       1Ah
                  mov       ax,dx
                  and       ax,3
                
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
                  mov       cx,4
    pt1E:         
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1E
                
    ;  Fragata
                  mov       bx,40
                  mov       si,2
                  mov       cx,3
    pt1f:         
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1f

    ;  Submarino1
                  mov       bx,180
                  mov       si,17
                  mov       cx,2
    pt1s1:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1s1
    ;submarino2
  
                  mov       bx,140
                  mov       si,3
                  mov       cx,2
    pt1Es2:       
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1Es2

    ; Hidroavião1
                
                  mov       bx,280
                  mov       si ,5
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14
    ; Hidroavião
                  mov       bx,80
                  mov       si ,15
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14

                  ret



    modo2:        
    ; Encouraçado
                  mov       bx,220
                  mov       si,5
                  mov       cx,4
    pt1E2:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1E2
                
    ;  Fragata
                  mov       bx,20
                  mov       si,3
                  mov       cx,3
    pt1f2:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1f2

    ;  Submarino1
                  mov       bx,80
                  mov       si,15
                  mov       cx,2
    pt1s12:       
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1s12
    ;submarino2
  
                  mov       bx,140
                  mov       si,3
                  mov       cx,2
    pt1Es22:      
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1Es22

    ; Hidroavião1
                
                  mov       bx,340
                  mov       si ,7
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14
    ; Hidroavião
                  mov       bx,300
                  mov       si ,17
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14

                  ret
    modo1:        
    ; Encouraçado
                  mov       bx,360
                  mov       si,5
                  mov       cx,4
    pt1E1:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1E1
                
    ;  Fragata
                  mov       bx,240
                  mov       si,13
                  mov       cx,3
    pt1f1:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1f1

    ;  Submarino1
                  mov       bx,180
                  mov       si,17
                  mov       cx,2
    pt1s11:       
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1s11
    ;submarino2
  
                  mov       bx,140
                  mov       si,3
                  mov       cx,2
    pt1Es21:      
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1Es21

    ; Hidroavião1
                
                  mov       bx,80
                  mov       si ,5
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14
    ; Hidroavião
                  mov       bx,80
                  mov       si ,15
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14

                  ret
    modo0:        
    ; Encouraçado
                  mov       bx,360
                  mov       si,15
                  mov       cx,4
    pt1E0:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1E0
                
    ;  Fragata
                  mov       bx,360
                  mov       si,2
                  mov       cx,3
    pt1f0:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1f0

    ;  Submarino1
                  mov       bx,20
                  mov       si,1
                  mov       cx,2
    pt1s0:        
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1s0
    ;submarino2
  
                  mov       bx,140
                  mov       si,3
                  mov       cx,2
    pt1Es0:       
                  mov       matriz[bx][si],7eh
                  inc       si
                  loop      pt1Es0

    ; Hidroavião1
                
                  mov       bx,200
                  mov       si ,13
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14
    ; Hidroavião
                  mov       bx,40
                  mov       si ,15
                  mov       matriz[bx][si],7eh
                  dec       SI
                  mov       matriz[bx][si],7eh
                  sub       bx,20
                  mov       matriz[bx][si],7eh
                  add       bx,40
                  mov       matriz[bx][si],7eh
                  mov       bx,60
                  mov       si, 14

                  ret


barco endp


imprimeMatriz proc
                  mov       ah,09
                  lea       dx,msg1
                  int       21h
                  pulaLinha
                  pulaLinha

                  xor       bx,bx
                  mov       cx,20
                  mov       ah,02
    pt1:          
                  mov       dl,matriz[bx]
    ;   sub       dl,30h
    ;   add       dl,35
                  or        dl,4eh
                  int       21h
                  inc       bx
                  cmp       bx,400
                  je        fimMatriz
                  dec       cx
                  jnz       pt1
                  mov       cx,20
                  mov       ah,02
                  mov       dl,10
                  int       21h
                  mov       ah,02
                  mov       dl,13
                  int       21h
                  jmp       pt1
    
    fimMatriz:    
                  ret

imprimeMatriz endp


tiro proc
                  pulaLinha
                  mov       ah,09h
                  lea       dx,msg3
                  int       21h
                  pulaLinha
    ;eixo x
                  mov       ah,01
                  int       21h
                  and       al,0fh
                  mov       bh,al
                  mov       ah,01h
                  int       21h
                  and       al,0fh
                  mov       bl,al
                  mov       al,10
                  mul       bh
                  add       ax,bx
                  xor       ah,ah
                  mov       si,ax

                  pulaLinha
                  mov       ah,09h
                  lea       dx,msg4
                  int       21h
                  pulaLinha

    ;eixo y
                  mov       ah,01
                  int       21h
                  and       al,0fh
                  mov       bh,al
                  mov       ah,01h
                  int       21h
                  and       al,0fh
                  mov       bl,al
                  mov       al,10
                  mul       bh
                  add       ax,bx
                  xor       ah,ah
                  mov       bx,ax
                  mov       ax,20
                  mul       bx
                  mov       bx,ax
                  mov       al,matriz[bx][si]
                  cmp       ax,7eh
                  je        acertou
                  cmp       ax,00h
                  je        fimA

                  mov       matriz[bx][si],4fh
                  jmp       fimA
                
    acertou:      
                  
                  mov       matriz[bx][si],00h
                  xor cx,cx
                  push cx
    
    fimA:         
                  pulaLinha
                  call      imprimeMatriz

                  ret

tiro endp


end main