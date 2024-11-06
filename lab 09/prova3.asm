title converter
.model small
.stack 100h
.data
    msg1 db "Digite o numero decimal: $"
    msg2 db 10,13,"O numero em hexa e: $"
    msg3 db 10,13,"O numero em binario e: $"
    msg4 db 10,13,"o numero em octal e: $"
.code
main proc
                mov  ax,@data
                mov  ds,ax


                call entraD
                call binario
                call hexa
                call octal

                mov  ah,4ch
                int  21h
main endp
entraD proc
                mov  ah,09
                lea  dx,msg1
                int  21h


                xor  ax,ax
                xor  bx,bx

    p:          
                mov  ah,01
                int  21h
                cmp  al,13
                je   sai
                and  ax,000fh
                push ax
                mov  ax,10
                mul  bx
                pop  bx
                add  bx,ax
                jmp  p
    sai:        
                ret
entraD endp
binario proc
    ;imprimo o numero
                push bx

                mov  ah,09
                lea  dx,msg3
                int  21h

                xor  dx,dx
                mov  cl,16
                mov  ah,02
             
    b:          
                rol  bx,1
                jnc  imprime0
                mov  dl,31h
                int  21h
                jmp  imprime
    imprime0:   
                mov  dl,30h
                int  21h
    imprime:    
                loop b
                pop  bx
                ret
binario endp

hexa proc
                push bx

                mov  ah,09
                lea  dx,msg2
                int  21H

                mov  ch,4
                mov  cl,4
                mov  ah,02
    tp:         
                mov  dl,bh
                shr  dl,cl
                cmp  dl,9
                ja   eletra
                or   dl,30h
                jmp  imprimeHexa
    eletra:     
                add  dl,37h
    imprimeHexa:
                int  21h
                rol  bx,cl
                dec  ch
                jnz  tp

                pop  bx
                ret
hexa endp
octal proc
                push bx

                mov  ah,09
                lea  dx,msg4
                int  21h

                xor  dx,dx
                xor  cx,cx
                mov  ax,bx
                mov  bx,8

    Oc:         
                div  bx
                push dx
                inc  cx
                cmp  al,0
                jne  Oc

                mov  ah,02
    im:         
                pop  dx
                or   dl,30h
                int  21h
                loop im

                pop  bx
                ret
octal endp
end main    