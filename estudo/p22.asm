.model small 
.stack 100h
pulalinha macro
              push ax
              push dx
              mov  ah,2
              mov  dl,10
              int  21h
              pop  ax
              pop  dx 
endm
.data
    msg1    db "Nome:$"
    nome    db 10 dup('?')
    inicial db "iniciais:$"
.code
main proc
             mov       ax,@DATA
             mov       ds,ax

             call      LeNome
             call      imprime

             mov       ah,4CH
             int       21h
main endp
LeNome proc
             mov       ah,09
             lea       dx,msg1
             int       21h

             xor       bx,bx
             mov       cx,10
             mov       ah,01
    a:       
             int       21h
             cmp       al,13
             je        sai
             mov       nome[bx],al
             inc       bx
             loop      a
    sai:     
             ret
LeNome endp
imprime proc
             pulalinha
             
             mov       ah,09
             lea       dx,inicial
             int       21h

             mov       cx,bx
             xor       bx,bx
             xor       dx,dx
             mov       dl,nome[bx]
             mov       ah,02
             int       21h

    b:       
             mov       dl,nome[bx]
             cmp       dl,20h
             je        imprimeA
             jmp       volta
    imprimeA:
             inc       bx
             mov       dl,nome[bx]
             mov       ah,02
             int       21h
             dec       bx

    volta:   
             inc       bx
             loop      b

             ret
imprime endp
end main