.MODEL SMALL
.STACK 100H
.DATA
    msg1 DB 'Enter a number: $'
    msg_even DB 10,13, 'The number is EVEN.$'
    msg_odd DB 10,13, 'The number is ODD.$'

.CODE
MAIN PROC
    ; Initialize Data Segment
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display message to enter a number
    LEA DX, msg1
    MOV AH, 9
    INT 21H
    
    ; Take input from user
    MOV AH, 1
    INT 21H
    SUB AL, '0'   ; Convert ASCII to number
    
    ; Check if number is even or odd
    MOV AH, 0     ; Clear AH (important for division)
    MOV BL, 2     ; Divisor = 2
    DIV BL        ; AL / 2 ? Quotient in AL, Remainder in AH

    ; Check remainder (AH)
    CMP AH, 0
    JNZ ODD_NUMBER ; If remainder ? 0, jump to ODD_NUMBER
    
    ; If remainder is 0, it's even
    LEA DX, msg_even
    MOV AH, 9
    INT 21H
    JMP EXIT

ODD_NUMBER:
    LEA DX, msg_odd
    MOV AH, 9
    INT 21H

EXIT:
    ; Exit program
    MOV AH, 4Ch
    INT 21H

MAIN ENDP
END MAIN
