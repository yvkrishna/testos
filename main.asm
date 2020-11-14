MOV ah,0x0e
MOV al,'H'
int 0x10

jmp $

; Padding and magic number
times 510 - ( $ - $$ ) db 0
dw 0xaa55