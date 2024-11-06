title conversão 
.model SMALL
.stack 100h
pulalinha MACRO
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
                   lea       dx,msg1
                   int       21H

                   mov       ah,01
                   int       21H

                   cmp       al,"D"
                   je        entraD
                   cmp       al,"H"
                   je        entraH
                   cmp       al,"B"
                   je        entraB

    entraD:        
                   call      ENTRADADECIMAL
                   jmp       saida
    entraH:        
                   call      ENTRADAHEXA
                   jmp       saida
    entraB:        
                   call      ENTRADABINARIO
    
    saida:        
                   push      ax
                   mov       ah,09
                   lea       dx,msg3
                   int       21H

                   mov       ah,01
                   int       21H


                    mov bh,al
                    pop ax

                   cmp       bh,"D"
                   je        saiDe
                   cmp       bh,'H'
                   je        saiH
                   cmp       bh,'B'
                   je        saiB
    saiDe:         
                   
                   call      SAIDADECIMAL
                   jmp       fim
    saiH:          
                   
                   call      SAINDAHEXA
                   jmp       fim
    saiB:          
                   
                   call      SAIDABINARIO

    Fim:           
                   mov       ah,4ch
                   int       21h
main endp


ENTRADADECIMAL proc
    ; lê um numero entre -32768 A 32767
                   push      BX
                   push      cx
                   push      dx
    a:             
                   pulalinha
                   mov       ah,09
                   lea       dx,msg2
                   int       21H

                   xor       bx,bx

                   xor       cx,cx

                   mov       ah,1
                   int       21h
                   cmp       al,'-'
                   je        negativo
                   cmp       al,'+'
                   je        positivo
                   jmp       pula

    negativo:      
                   mov       cx,1
    positivo:      
                   int       21h

    pula:          
                   cmp       al,'0'
                   jnge      ilegal
                   cmp       al,'9'
                   jnle      ilegal

                   and       ax,000FH
                   push      ax

                   mov       ax,10
                   mul       bx
                   pop       bx
                   add       bx,ax

                   mov       ah,1
                   int       21h
                   cmp       al,13
                   jne       pula

                   mov       ax,bx

                   or        cx,cx
                   je        saiD

                   neg       ax

                   jmp       saiD

    ilegal:        
                   mov       ah,2
                   mov       dl,0DH
                   int       21h
                   mov       dl,0AH
                   int       21h
                   jmp       a

    saiD:          
                   pop       dx
                   pop       cx
                   pop       BX

                   ret

ENTRADADECIMAL endp
ENTRADABINARIO proc
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
                   PUSH      CX
                   PUSH      DX


                   pulalinha
                   push      ax
                   mov       ah,09
                   lea       dx,msg4
                   int       21h
                   pop       ax


    ; if AX < 0
                   OR        AX,AX             ; AX < 0 ?
                   JGE       @END_IF1
    ;then
                   PUSH      AX                ;salva o numero
                   MOV       DL, '-'
                   MOV       AH,2
                   INT       21H               ; imprime -
                   POP       AX                ; restaura numero
                   NEG       AX

    ; digitos decimais
@END_IF1:
                   XOR       CX,CX             ; contador de d?gitos
                   MOV       BX,10             ; divisor
@REP1:
                   XOR       DX,DX             ; prepara parte alta do dividendo
                   DIV       BX                ; AX = quociente   DX = resto
                   PUSH      DX                ; salva resto na pilha
                   INC       CX                ; contador = contador +1

    ;until
                   OR        AX,AX             ; quociente = 0?
                   JNE       @REP1             ; nao, continua

    ; converte digito em caractere
                   MOV       AH,2

    ; for contador vezes
@IMP_LOOP:
                   POP       DX                ; digito em DL
                   OR        DL,30H
                   INT       21H
                   LOOP      @IMP_LOOP
    ; fim do for

                   POP       DX
                   POP       CX
                   POP       BX
                   POP       AX
                   RET
SAIDADECIMAL endp
SAIDABINARIO proc
                    push ax
                    pulalinha
                    mov ah,09
                    lea dx,msg4
                    int 21H
                    pop ax





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

