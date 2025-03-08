.model small
.stack 100h
.data  
   msg DB 'How many times would you like to print$'

  msg1 DB 10,13, 'Hello!$'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx ,msg
    mov ah,9
    int 21h 
    
    mov ah, 1
    int 21h
    sub al,'0'
 
     
    mov cl,al
    mov ch,0
    
    lea dx,msg1
    Top:
    mov ah,9
    int 21h
    loop Top 
    
    mov ah,4ch
    int 21h
    main endp
endp main
