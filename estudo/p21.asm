.model small
.stack 100h
pulalinha macro
              push ax
              push dx
              mov  ah,2
              mov  dl,10
              int  21h
              mov  ah,02
              mov  dl,13
              int  21h
              pop  ax
              pop  bx
endm
.data
    msg1 db "quantidade de  bits 1 e :$"
.code
main proc
            mov       ax,@data
            mov       ds,ax

            call      entra
            call      imprime

            mov       ah,4ch
            int       21h
main endp
entra proc
            xor       dx,dx
            mov       ah,01
            int       21h
            mov       cl,8
    a:      
            test      al,1
            jnz       incr
            jmp       volta
    incr:   
            inc       dl
    volta:  
            shr       al,1
            loop      a
            xor       ax,ax
            ret
entra endp
imprime proc
            push      dx
            pulalinha
            mov       ah,09
            lea       dx,msg1
            int       21h
            pop       dx
            or        dl,30h
            mov       ah,02
            int       21h
            ret
imprime endp
end main
