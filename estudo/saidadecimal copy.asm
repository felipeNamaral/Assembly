title decimal saida 
.model small
.stack 100h
.data 
.code 
main proc



mov   ax, 123
mov bx,10
call saidaD

mov ah,4ch
int 21h


main endp
saidaD proc 

a:
div bx 
push dx
mov dl,al
or dl,30h
mov ah,2
int 21h
pop ax
jnz a

ret



saidaD endp 
end main 