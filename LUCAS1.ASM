title le string com backspace
.MODEL SMALL
.STACK 0100H
PUSH_ALL  MACRO  
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    PUSH DI
ENDM
POP_ALL  MACRO  
    POP DI
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
ENDM
.DATA
    str1 DB 100 DUP (?)
.CODE
main proc
    MOV AX,@DATA
    MOV DS,AX
    MOV ES,AX
    lea di,str1
    CALL le_bks
    lea si,str1
    ;CALL imp_str
    ;CALL imp_strload
    mov ah,2
    and ah,ah
    call scanb
    MOV AH,4CH
    INT 21H
    main endp
le_str proc
; entrada:  di aponta para a posição inicial do local de armazenamento do str

; saída : cx    tamanho do str
    push ax
    push dx
	xor cx,cx
	cld
	mov ah,1
le_car:
	int 21h
	cmp al,0dh
	je fim2
	stosb
	inc cx
	jmp le_car
fim2:	
	pop dx
	pop ax
	ret
le_str endp
le_bks proc
; entrada:  di aponta para a posição inicial do local de 
; armazenamento do str
; saída : cx tamanho do str
    push ax
    push bx
    push dx
	xor cx,cx
	cld
	mov ah,1
le1_car:
	int 21h
	cmp al,0dh
	je fim1
    cmp al,08
    jne salta
    dec di
    dec cx
    xchg ax,bx
    mov ah,02
    mov dl,' '
    int 21h
    mov dl,8
    int 21h
    xchg ax,bx
    jmp le1_car
    salta: 
        stosb
        inc cx
        jmp le1_car
fim1:	
	pop dx
    pop bx
	pop ax
	ret
le_bks endp
imp_str proc
; entrada:  si aponta para a posição inicial do local de armazenamento 
;do str
; cx    tamanho do str
    push ax
    push cx
    CLD
    MOV AH,02
REPETE:
    MOV DL,[SI]
    INT 21H
    INC SI
    LOOP REPETE 
    pop cx
    pop ax
    ret
imp_str endp
imp_strload proc
    push ax
    push cx
    CLD
    MOV AH,02
REPETE1:
    lodsb
    mov dl,al
    INT 21H
    LOOP REPETE1 
    pop cx
    pop ax
    ret
imp_strload ENDP
scanb proc
    push ax
    push cx
    CLD                             ; zera DF
	LEA  DI,STR1     ; aponta STR1
	MOV AL,'R'
	REPNE SCASB     ; repete enquanto não achar
    pop cx
    pop ax
    ret
scanb endp
    end main