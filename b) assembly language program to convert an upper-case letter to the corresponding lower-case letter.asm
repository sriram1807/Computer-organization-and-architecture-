ORG 100h
MOV DX, OFFSET msg_input
MOV AH, 09h
INT 21h
MOV AH, 01h
INT 21h
MOV DL, AL
CMP AL, 'A'
JL NotUpperCase
CMP AL, 'Z'
JG NotUpperCase
ADD AL, 20h
mov cl,al
MOV DX, OFFSET msg_output
MOV AH, 09h
INT 21h
mov dx,0000h
mov dl,cl
MOV AH, 02h
INT 21h
JMP EndProgram
NotUpperCase:
MOV DX, OFFSET msg_error
MOV AH, 09h
INT 21h
EndProgram:
MOV AH, 4Ch
INT 21h
msg_input  DB 'Enter an uppercase letter: $'
msg_output DB 0Dh, 0Ah, 'The lowercase letter is: $'
msg_error  DB 0Dh, 0Ah, 'Error: Not an uppercase letter! $'
END
