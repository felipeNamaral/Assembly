title entrda e saida decimal 
.model SMALL
.stack 100h
.data 
.code
main proc

call entrada
call sainda

mov ah,4ch
int 21h
main endp
entrada proc
xor bx,bx
xor ax,ax

p:
    mov ah,01
    int 21h
    cmp al,13
    je fim
    and ax,000fh
    PUSH ax
    mov ax,10
    mul bx
    pop BX
    add bx,ax
    jmp p
fim:
ret


entrada endp
sainda proc
            mov ax,bx
             mov       bx,10
             xor       cx,cx

    topo:    
    xor dx,dx
             div       bx
             push      dx
             inc       cx
             cmp       al,0
             jne       topo
             mov       ah,02
    topo2:   
             pop       dx
             or        dl,30h
             int       21h
             loop topo2
             ret
sainda endp
end main