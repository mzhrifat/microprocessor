.model small
.stack 100h
.data

x db 0d,1d,2d,3d,4d,5d,6d,7d,8d,9d

.code
main proc
    mov ax,@data
    mov ds, ax
    lea bx,x
    mov cx,10d
    
    
    mov ah,2h
    d_loop:
    mov dl,[bx]
    int 21h
    inc bx
    
    loop d_loop
    mov ah,4ch
    int 21h
    main endp
endp main
