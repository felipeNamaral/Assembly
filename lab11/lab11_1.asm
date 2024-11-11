title conversão 
.model SMALL
.stack 100h
pulalinha MACRO
    ;macro qu pula linha mantendo os valores dos registradoes
              push ax
              push dx
              mov  ah,02
              mov  dl,10
              int  21h
              mov  ah,02
              mov  dl,13
              int  21h
              pop  dx
              pop  ax
ENDM
.data
    msg1 db "escolha a entrada D para decimal H hexa ou B pra binario :$"
    msg2 db "Digite o numero : $"
    msg3 db "Escolha a saida D para decimal H hexa ou B pra binario :$"
    msg4 db "A conversao e: $"
.code
main proc
                   mov       ax,@data
                   mov       ds,ax

                   mov       ah,09
                   lea       dx,msg1           ;msg que pede para informar a entrada
                   int       21H

                   mov       ah,01
                   int       21H               ;digita o caractere para cada entrda

                   cmp       al,"D"            ;se for D a entrada e decimal e vai para o procedimento de entrada decimal
                   je        entraD
                   cmp       al,"H"            ;se for H a entrada e Hexa e vai para o procedimento de entrada hexa
                   je        entraH
                   cmp       al,"B"            ;se for B a entrada e binaria e vai para o procedimento de entrada binaria
                   je        entraB

    entraD:        
                   call      ENTRADADECIMAL    ;procedimento de entrda decimal
                   jmp       saida             ;salta para a saida do numero digitado
    entraH:        
                   call      ENTRADAHEXA       ;procedimento de entrda hexa
                   jmp       saida             ;salta para a saida do numero digitado
    entraB:        
                   call      ENTRADABINARIO    ;procedimento de entrda binaria
    
    saida:         
                   push      ax                ;guarada o valor de ax para exibir a mensagem e pedir o caracete
                   mov       ah,09
                   lea       dx,msg3           ;pede ao usuario para informar a saida
                   int       21H

                   mov       ah,01             ;digita o caracete da saida
                   int       21H


                   mov       bh,al             ;guarda o caractere digitado em bh
                   pop       ax                ;volta o valor de ax guardado na pilha(numero digitado)

                   cmp       bh,"D"            ;se for D vai para o procedimento de saida decimal
                   je        saiDe
                   cmp       bh,'H'            ;se for H vai para o procedimento de saida hexa
                   je        saiH
                   cmp       bh,'B'            ;se for B vai para o procedimento de saida binaria
                   je        saiB
    saiDe:         

                   call      SAIDADECIMAL      ;salta para o procedimento de saida decimal e depois finaliza o codigo
                   jmp       fim
    saiH:          
                   
                   call      SAINDAHEXA        ;salta para o procedimento de saida hexa e depois finaliza o codigo
                   jmp       fim
    saiB:          
                   
                   call      SAIDABINARIO      ;salta para o procedimento de saida decimal e depois finaliza o codigo

    Fim:           
                   mov       ah,4ch
                   int       21h
main endp


ENTRADADECIMAL proc
    ; lê um numero entre -32768 A 32767
                   push      BX
                   push      cx                ;guarda o valor dos registradores na pilha
                   push      dx
    a:             
                   pulalinha
                   mov       ah,09
                   lea       dx,msg2           ;solicita um numero
                   int       21H

                   xor       bx,bx             ;limpara bx e cx para guardar o numero e se é sinalizado ou nao
                   xor       cx,cx

                   mov       ah,1              ;pede um caracete
                   int       21h
                   cmp       al,'-'            ;se for informado sinal salta se nao pula para conferir o numero
                   je        negativo
                   cmp       al,'+'
                   je        positivo
                   jmp       pula

    negativo:      
                   mov       cx,1              ;se o sinal for negativo cx é 1
    positivo:      
                   int       21h               ;se for positivo pede um novo numero

    pula:          
                   cmp       al,'0'
                   jnge      ilegal            ;compara o caractere digitado ver se é um numero se for continua o codigo se nao salta para ilegal
                   cmp       al,'9'
                   jnle      ilegal

                   and       ax,000FH          ;trasforma o caracete em numero
                   push      ax                ;guarda o numero digitado

                   mov       ax,10             ;ax recebe 10 para multiplicar os caracetes para receber numeros de mais de 1 casa decimal
                   mul       bx
                   pop       bx                ;volta o valor digitado e soma com o valor da multiplicação
                   add       bx,ax

                   mov       ah,1              ; pede um novo caractere
                   int       21h
                   cmp       al,13             ;se for enter sai se nao volta para verificação
                   jne       pula

                   mov       ax,bx             ;ax recebe o numero digitado

                   or        cx,cx             ;se cx for 0 salta
                   je        saiD

                   neg       ax                ;invete e soma um no numero de ax

                   jmp       saiD

    ilegal:        
                   mov       ah,2
                   mov       dl,0DH            ;se o carctere for ilegal repete o codigo
                   int       21h
                   mov       dl,0AH
                   int       21h
                   jmp       a

    saiD:          
                   pop       dx
                   pop       cx                ;volta o valor dos registradores guardados na pilha
                   pop       BX

                   ret                         ;volta para main

ENTRADADECIMAL endp
ENTRADABINARIO proc

                    pulalinha
                    mov ah,09
                    lea dx,msg2
                    int 21h


                   xor       bx,bx
                   mov       cx,16             ;limpa bx e coloca 16 em cx para usar de contador
                   mov       ah,01             ;recebe os caractere digitados
    entrada:       
                   int       21h
                   cmp       al,13             ;compara o caractere digitado com enter se for continua o programa na p0
                   je        fimBB
                   and       al,0fh            ;trasforma em numero o caractere digitado
                   shl       bx,1              ;move bx um bit para esquerda
                   or        bl,al             ;coloca o valor digitado na casa que foi liberada em bx
                   loop      entrada


    fimBB:         
                   mov       ax,bx
                   ret
ENTRADABINARIO endp
ENTRADAHEXA proc
                   pulalinha
                   mov       ah,09
                   lea       dx,msg2
                   int       21H

                   xor       bx,bx
                   mov       cx,4              ;limpa bx , coloca 4 em cx para usar de contador  e solicita um caracete
                   mov       ah,01
    qu:            
                   int       21h
                   cmp       al,13             ;compara o caractere digitado com enter se for finaliza o programa
                   je        SAI
                   cmp       al,39h            ;compara o valor digitado com 39 para saber se e letra ou numero se for letra salta
                   jg        eLetra
                   and       al,0fh            ;trasforma o caractere digitado em numero
                   jmp       converte
    eLetra:        
                   sub       al,37h            ;subtrai 37 de da letra digitada para transformar em numero binario
    converte:      
                   shl       bx,4              ;desloca 4 para direita para colocar o numero em binario
                   or        bl,al             ;coloca o valor em binario nos 4 bits
                   loop      qu
    SAI:           
                   mov       ax,bx
                   RET

ENTRADAHEXA endp

    ;---------------------------------------------------
SAIDADECIMAL proc
                   PUSH      AX
                   PUSH      BX
                   PUSH      CX                ;guarda os valores dos registradores
                   PUSH      DX


                   pulalinha
                   push      ax                ;guarda ax para exibir a mensagem
                   mov       ah,09
                   lea       dx,msg4           ;exibe a menasagem de conversao
                   int       21h
                   pop       ax                ;volta o valor de ax


    
                   OR        AX,AX             ; AX for negativo
                   JGE       @qwe
    ;then
                   PUSH      AX                ;salva o numero
                   MOV       DL, '-'
                   MOV       AH,2
                   INT       21H               ; se o numero for negativo imprime o sinal
                   POP       AX                ; restaura numero
                   NEG       AX                ; volta o numero para positivo

    
@qwe:
                   XOR       CX,CX             ; zera cx para receber a quantidade de numeros
                   MOV       BX,10             ; bx recebe 10 para usar na divisao
@tyu:
                   XOR       DX,DX             ; zera dx para receber o resto da divisao
                   DIV       BX                ; AX = quociente   DX = resto
                   PUSH      DX                ; salva resto na pilha
                   INC       CX                ; incremeta o contador de restos

    
                   OR        AX,AX             ; se o resultado da divisao der 0 sai se nao salta para dividir novamente
                   JNE       @tyu

    
                   MOV       AH,2              ;prepara para imprmir

    
@imp:
                   POP       DX                ;pega o ultimo resto da pilha
                   OR        DL,30H            ;tranforma em caracte
                   INT       21H               ;impime
                   LOOP      @imp
    ; fim do for

                   POP       DX
                   POP       CX                ;volta os valores dos registradores
                   POP       BX
                   POP       AX
                   RET
SAIDADECIMAL endp
SAIDABINARIO proc
                   push      ax
                   pulalinha
                   mov       ah,09
                   lea       dx,msg4
                   int       21H
                   pop       ax





                   mov       bx,ax
    p0:            
                   mov       cx,16             ;coloca 16 em bx para exibir 16 bits
                   mov       ah,02h            ;prepara para imprimir

    p1:            
                   rol       bx,1              ;rotaciona bx com cf se cf for 0 salta para imprimir o caractere
                   jnc       p2
                   mov       dl,31h            ;se cf for 1 imprime 1
                   int       21H
                   jmp       p3
    p2:            
                   mov       dl,30h            ;imprime os 0s
                   int       21H

    p3:            
                   loop      p1

                   ret
SAIDABINARIO endp
SAINDAHEXA PROC
                   pulalinha
                   push      ax
                   mov       ah,09
                   lea       dx,msg4
                   int       21h
                   pop       ax

                   mov       bx,ax
                   mov       ch,4
                   mov       cl,4              ;ch e cl recebem 4 para usar de contador de caracteres e deslocamento e prepara para imprimir
                   mov       ah,02
    p11:           
                   mov       dl,bh             ;coloca em dl 8 bits de bx
                   shr       dl,cl             ;desloca 4 para esquerda para restar 4 bits em dl
                   cmp       dl,10             ;tsta se os 4 bits é numero ou letra
                   jae       heLetra
                   add       dl,30h            ; soma 30h no numero para virar caractere
                   jmp       p22
    heLetra:       
                   add       dl,37h            ; soma 37h no valor em letra hexa para virar caracete
    p22:           
                   int       21H               ;imprime o caracete
                   rol       bx,cl             ;roda 4 bits para direita para fazer o outro caractere em hexa
                   dec       ch                ;decremeta ch e faz o for com 4 numeros
                   jnz       p11

                   ret
SAINDAHEXA endp
end main 

