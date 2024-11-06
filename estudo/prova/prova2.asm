title 
.model SMALL
.stack 100h

.DATA
     matriz db 1,2,3,4
            db 1,2,3,4
            db 1,2,3,4
            db 1,2,3,4
.code

main proc
          mov  ax,@data
          mov  ds,ax
 
          call leeimprime

          mov  ah,4ch
          int  21h

main endp
leeimprime proc
          mov  cx,4
          xor  bx,bx
          xor  si,si
          mov  ah,2h
     pt1: 
          mov  dl,matriz[bx][si]
          or   dl,30h
          int  21h
          add  bx,4
          inc  si
          loop pt1
          ret
leeimprime endp
end main