 #add two numbers

.model small
.stack 100h
.data
.code
main proc
    mov al,02d
    add al,03d
    mov bl,al 
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h
    main endp
endp main