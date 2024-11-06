title nome 
.model SMALL
.stack 100h 
.data
    nome db "AAIAVATUOAVUSAQRTUOA"
.CODE
MAIN proc
             MOV  ax,@DATA
             mov  ds,ax


             xor  ax,ax
             xor  bx,bx
             mov  cx,20
    A:       
             cmp  nome[bx],'A'
             jne  e
             inc  ax
             jmp  continua
    e:       
             cmp  nome[bx],'E'
             jne  i
             inc  ax
             jmp  continua

    i:       
             cmp  nome[bx],'I'
             jne  o
             inc  ax
             jmp  continua
    o:       
             cmp  nome[bx],'O'
             jne  u
             inc  ax
             jmp  continua
    u:       
             cmp  nome[bx],'U'
             jnz  continua
             inc  ax
    continua:
             inc  bx
             loop A

             call decimal

             mov  ah,4CH
             int  21h

MAIN endp
decimal proc
             mov  dl,10
             div  dl
             mov  dl,al
             mov  bl,ah
             or   dl,30h
             mov  ah,02
             int  21h
             mov  dl,bl
             or   dl,30h
             mov  ah,02
             int  21h
             ret
decimal endp
end MAIN
