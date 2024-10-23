org 100h                    ; Set starting address for COM program
jmp start                   ; Jump to the start label
msg:db "Multiplication of two 8-bit numbers is:", 0Dh, 0Ah, 24h
                             ; Message to display, ends with '$' for DOS interrupt 09h
start:
    mov dx,msg              ; Load the address of the message into DX
    mov ah, 09h              ; DOS interrupt to display a string (function 09h)
    int 21h                  ; Call DOS interrupt to print the message
    ; Load numbers for multiplication
    num1 db 32h              ; First number (32h = 50 decimal)
    num2 db 29h              ; Second number (29h = 41 decimal)

    mov al, num1             ; Load first number into AL
    mul num2                 ; Multiply AL by num2, result in AX (AL * num2 = AX)
    mov bx, ax               ; Store the 16-bit result from AX into BX

    ; Process and display the first hexadecimal digit (most significant nibble)
    and ax, 0F000h           ; Mask the upper nibble (first 4 bits)
    shr ax, 12               ; Shift the upper nibble to the least significant 4 bits
    add ax, 30h              ; Convert the value to ASCII by adding 30h
    cmp ax, 39h              ; Compare with ASCII '9' to check if it's a digit
    jle first_bit            ; Jump if it's less than or equal to '9'
    add ax, 7h               ; Adjust for A-F (ASCII A-F starts at 41h)
first_bit:
    mov dl, al               ; Move the ASCII value to DL for printing
    mov ah, 02h              ; DOS interrupt to print a single character (function 02h)
    int 21h                  ; Call DOS interrupt to print the first digit

    ; Process and display the second hexadecimal digit
    mov ax, bx               ; Reload the result from BX into AX
    and ax, 0F00h            ; Mask the second nibble (bits 8-11)
    shr ax, 8                ; Shift the second nibble to the least significant 4 bits
    add ax, 30h              ; Convert to ASCII
    cmp ax, 39h              ; Compare with '9'
    jle second_bit           ; Jump if less than or equal to '9'
    add ax, 7h               ; Adjust for A-F
second_bit:
    mov dl, al               ; Move to DL for printing
    mov ah, 02h              ; DOS interrupt to print a single character
    int 21h                  ; Print the second digit

    ; Process and display the third hexadecimal digit
    mov ax, bx               ; Reload the result from BX
    and ax, 00F0h            ; Mask the third nibble (bits 4-7)
    shr ax, 4                ; Shift the third nibble to the least significant 4 bits
    add ax, 30h              ; Convert to ASCII
    cmp ax, 39h              ; Compare with '9'
    jle third_bit            ; Jump if less than or equal to '9'
    add ax, 7h               ; Adjust for A-F
third_bit:
    mov dl, al               ; Move to DL for printing
    mov ah, 02h              ; DOS interrupt to print a single character
    int 21h                  ; Print the third digit

    ; Process and display the fourth hexadecimal digit (least significant nibble)
    mov ax, bx               ; Reload the result from BX
    and ax, 000Fh            ; Mask the least significant nibble (bits 0-3)
    add ax, 30h              ; Convert to ASCII
    cmp ax, 39h              ; Compare with '9'
    jle fourth_bit           ; Jump if less than or equal to '9'
    add ax, 7h               ; Adjust for A-F
fourth_bit:
    mov dl, al               ; Move to DL for printing
    mov ah, 02h              ; DOS interrupt to print a single character
    int 21h                  ; Print the fourth digit

    ; End of the program
    ret                      ; Return from the program (terminate)
