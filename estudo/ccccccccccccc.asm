.model small
.stack 100h
.data
    vetor db 1,1,1,1,1,2,1,1
.code
main proc
            mov  ax,@data
            mov  ds,ax

            call soma
            call imprime

            mov  ah,4ch
            int  21h
main endp
soma proc
            xor  bx,bx
            xor  dx,dx
            mov  cx,8
    a:      
            add  dl,vetor[bx]
            inc  bx
            loop a
            ret
soma endp
imprime proc
            mov  ah,02
            or   dl,30H
            int  21H
            ret
imprime endp
end main