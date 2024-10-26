.model small
.data
.code
main proc
            xor  bx,bx          
            mov  cx,16          ;limpa bx e coloca 16 em cx para usar de contador 
            mov  ah,01          ;recebe os caractere digitados 
    entrada:
            int  21h
            cmp  al,13          ;compara o caractere digitado com enter se for continua o programa na p0
            je   p0
            and  al,0fh         ;trasforma em numero o caractere digitado
            shl  bx,1           ;move bx um bit para esquerda 
            or   bl,al          ;coloca o valor digitado na casa que foi liberada em bx
            loop entrada
    p0:        
            mov  cx,16          ;coloca 16 em bx para exibir 16 bits
            mov  ah,02h         ;prepara para imprimir 

    p1:     
            rol  bx,1           ;rotaciona bx com cf se cf for 0 salta para imprimir o caractere
            jnc  p2             
            mov  dl,31h         ;se cf for 1 imprime 1 
            int  21H
            jmp  p3
    p2:     
            mov  dl,30h         ;imprime os 0s
            int  21H

    p3:     
            loop p1
  
            MOV  AH,4CH         ;finaliza o codigo 
            INT  21H
main endp
end main