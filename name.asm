org 100h
jmp start
msg: db"Sriram Bandaru", 0Dh,0Ah, 24h
start:  movdx, msg
        movah, 09h 
        int21h       
        movah, 0 
        int16h 
ret 
