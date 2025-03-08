.model small
.stack 100h
.data 
 msg db 10,13, 'This is not a numbers$'
.code
main proc
    mov ah,01
    int 21h
    
    cmp al,30h
    jl exit
    cmp al,39h
    JA exit
    JMP display
    exit:
    
    mov ax,@data
    mov ds,ax
    lea dx,msg
    mov ah,9
    int 21h
    mov ah,4ch
    int 21h
    
    display:
    mov ah,2
    mov dl,al
    int 21h
    main endp
endp main