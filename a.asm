title 
.model SMALL
.stack 100h

.DATA


    matriz db 31h,30h,30h,30h
           db 30h,32h,30h,30h
           db 30h,30h,33h,30h
           db 30h,30h,30h,34h

.code

main proc
         mov  ax,@data
         mov  ds,ax

         mov  cx,4
         xor  bx,bx
         xor  si,si
         mov  ah,2h
    pt1: 
         mov  dl,matriz[bx][si]
         int  21h
         add  bx,4
         inc  si
         loop pt1

         mov  ah,4ch
         int  21h

main endp
end main