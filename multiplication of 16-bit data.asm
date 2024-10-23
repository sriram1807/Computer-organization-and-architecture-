org 100h           ; Set starting address

; Load two 16-bit values into AX and BX
mov ax, 1234h      ; Load AX with 1234h (first number)
mov bx, 5678h      ; Load BX with 5678h (second number)

; Multiply AX by BX
mul bx             ; Multiply AX by BX, result in DX:AX (32-bit result)

; Move the lower 16 bits of the result (AX) into BX
mov bx, ax         ; BX now holds the result's lower 16 bits
mov cx,0000h 
mov cx,dx 

; --- Convert and print the high nibble of DH (high byte of DX) ---
mov ah, dh         ; Move DH (high byte of DX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble_dx ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble_dx:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output (DOS function 02h)
int 21h            ; Print the high nibble of DH

; --- Convert and print the low nibble of DH (high byte of DX) ---
mov ah, dh         ; Move DH back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble_dx ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble_dx:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of DH

; --- Convert and print the high nibble of DL (low byte of DX) ---
mov ah, cl         ; Move DL (low byte of DX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble_dl ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble_dl:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of DL

; --- Convert and print the low nibble of DL (low byte of DX) ---
mov ah, cl         ; Move DL back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble_dl ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble_dl:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of DL

; --- Convert and print the high nibble of BH (high byte of BX) ---
mov ah, bh         ; Move BH (high byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble_bx ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble_bx:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of BH

; --- Convert and print the low nibble of BH (high byte of BX) ---
mov ah, bh         ; Move BH back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble_bx ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble_bx:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BH

; --- Convert and print the high nibble of BL (low byte of BX) ---
mov ah, bl         ; Move BL (low byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble_bl ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_high_nibble_bl:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of BL

; --- Convert and print the low nibble of BL (low byte of BX) ---
mov ah, bl         ; Move BL back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble_bl ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed

print_low_nibble_bl:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BL

; --- Terminate the program ---
mov ah, 4Ch        ; DOS terminate function
int 21h            ; Terminate the program
