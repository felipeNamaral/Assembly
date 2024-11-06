title 
.model SMALL
.stack 100h
.DATA
     matriz db 1,2,3
            db 1,5,3
            db 1,2,1
.code

main proc
             mov  ax,@data
             mov  ds,ax
             CALL leesoma
             call imprime
             mov  ah,4ch
             int  21h
main endp
leesoma proc
             xor  bx,bx
             xor  si,si
             xor  dl,dl
             mov  cx,3

     pt1:    
             mov  al,matriz[bx][si]
             add  bx,3
             inc  SI
             add  dl,al
             loop pt1
             ret
leesoma endp
imprime proc
             or   dl,30h
             mov  ah,02
             int  21h
             ret
imprime endp
end main