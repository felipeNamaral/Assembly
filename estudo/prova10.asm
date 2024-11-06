title oito 
.model SMALL
.stack 100h
.data
    vetor db 1,2,3,4,5,6,7,8,9,10
    msg1  db 10,13,'Par:$'
    msg2  db 10,13,'Impar:$'
.code
main proc
          mov  ax,@data
          mov  ds,ax

      call leEinc
      call imprime


    mov ah,4ch
    int 21h
main endp
leEinc proc
          xor  dx,dx
          xor  bx,bx
          mov  cx,10
    pt1:  
          mov  ah,vetor[bx]
          and  ah,01h
          cmp ah,0
          jz   epar
          inc  dh
          jmp  volta
    epar: 
          inc  dl
    volta:
          inc  bx
          loop pt1
          mov cx,dx
          ret
leEinc endp
imprime proc
    mov ah,09
    lea dx,msg1
    int 21h

    mov dl,cl
    or dl,30h
    mov ah,02
    int 21h 

    mov ah,09
    lea dx,msg2
    int 21h
    mov dl,ch
    or dl,30h

    mov ah,02
    int 21h
    ret
imprime endp
end main   