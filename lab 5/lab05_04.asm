 Title Letras maiusculas linha 
.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
              mov  cx, 20
              mov  dl,97
              mov  ah,02H
    criaLoop:

              int  21h
              inc  dl
              inc  bl
              cmp  bl,4
              je   pulaLinha
              loop criaLoop
              cmp  cx,0
              je   fim

    pulaLinha:
              mov  bh,dl
              mov  ah,02H
              mov  dl,10
              int  21h
              mov  dl,bh
              mov  bl,00
              jmp  criaLoop


    fim:      
              MOV  AH,4CH       ; finaliza o programa
              INT  21H
MAIN ENDP
END MAIN