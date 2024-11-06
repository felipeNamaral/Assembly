.model small
.stack 100h
.data
.code
main proc 

call entraeconverte
call imprime

mov ah,4ch
int 21h
main endp
entraeconverte proc

xor cx,cx

a:
mov ah,1
int 21h
cmp al,13
je fim
shl cx,3
and al,0fh

or cl,al

jmp a



fim:
mov ax,cx
ret
entraeconverte endp

imprime proc
mov bx,8
xor cx,cx
u:
div bx
push dx
inc cx
cmp al,0
jne u

mov ah,02
l:
pop dx
or dl,30h
int 21H
loop l

ret
imprime endp
end main