title programa de inverter vetores
.model SMALL
.stack 100h
.DATA
    vetor db 1,2,3,4,5,6,7
.code
main proc
             mov  ax, @DATA        ;acessa data atravez de ax
             mov  ds,ax
             
             xor  bx,bx            ;zera bx para apontar o primeiro valor do vetor e aponta si para ultimo valor
             mov  si,6


             call ler              ;chama ler ,inverter e imprimir
             call inverter
             call imprimir

             mov  ah,4CH           ;finaliza o codigo
             int  21h
main endp
ler proc

             mov  cx,7             ;numero de valores do vetor em cx
    pt1:     
             mov  al, vetor[bx]    ;acessa o valor 0 do veotr atravez de bx e coloca em al
             inc  bx               ; vai para o proximo valor
             loop pt1              ;faz o loop para ler os 7 valores
             ret                   ;volta apra main
ler endp
inverter proc
             mov  cx,3             ;3 é o numero de vezes que vai fer a troca ,e zera bx
             xor  bx,bx
    pt2:     
             mov  al,vetor[bx]     ;acessa o primerio e ultimo valor do vetor e faz um xchg para inverter eles
             xchg al,vetor[si]
             mov  vetor[bx],al
             dec  si               ;vai para os proximos valores do vetor
             inc  bx
             loop pt2              ;faz o loop para trocar 3 vezes
             ret                   ;volta mein
inverter endp
imprimir proc
             xor  di,di            ;di aponta para o valor 0 do vetor ,cx é o cotador de numeros do vetor e prepara para imprimir
             mov  cx,7
             mov  ah,02
    pt3:     
             mov  dl,vetor[di]     ;dl recebe o valor do vetor apontado por di
             or   dl,30h           ;transforma em caractere
             inc  di               ;vai para o proximo valor do vetor e imprime
             int  21h
             loop pt3
             ret
imprimir endp
end main
