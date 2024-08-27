org 100h
num1 db 29h
num2 db 24h
start:
mov al,num1
sub al,num2
mov bl,al
mov ah,al
and ah,0F0h
shr ah,4 
add ah,30h
cmp ah,39h
jle print_first_number
add ah,7
print_first_number:
mov dl,ah 
mov ah,02h
int 21h
mov ah,bl 
and ah,0Fh
add ah,30h 
cmp ah,39h 
jle print_second_number
add ah,7
print_second_number: 
mov dl,ah
mov ah,02h 
int 21h
mov ah,4Ch
int 21h
ret
