ORG 100h
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h
MOV AH, 01h
INT 21h
mov cl,al
MOV DX, OFFSET msg_output
MOV AH, 09h
INT 21h
mov DX,0000h
MOV DL, CL
MOV AH, 02h
INT 21h
msg_input  DB 'Enter a character: $'
msg_output DB 0Dh, 0Ah, 'The character is: $'
MOV AH, 4Ch
INT 21h
END
