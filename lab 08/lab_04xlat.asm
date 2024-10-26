
.model small
.data
    tabela db 30h,31h,32h,33h,34h,35h,36h,37h,38h,39h,41h,42h,43h,44h,45h,46h       ;valores numericos e letras da tabela ascii
.code
main proc
         mov  ax,@data
         mov  ds,ax

         mov  bx,0BA11h    ;bx recebe um valor em hexa
         mov  cl,4         ;cl contador de caracteres
         mov  ah,02        ;prepara para imprimir 
    p1:  
         mov  dl,bh        ;coloca em dl 8 bits de bx
         shr  dl,4         ;desloca 4 de dl para ficar com os bits mais significativo 
         
         push bx            ;salva bl
         lea  bx,tabela     ;entra no vetor e troca o valor de al para valor em caractere com o xlat
         mov  al,dl
         xlat
         pop bx            ;volta bx
         mov  dl,al 
         int  21H          ;imprime o caracete

         rol  bx,4         ;roda 4 bits para direita para fazer o outro caractere em hexa
         dec  cl           ;decremeta cl e faz o for com 4 numeros
         jnz  p1
             
    fim: 
         MOV  AH,4CH       ;finaliza o programa
         INT  21H
main endp
end main