[ORG 0x7C00]
 
; moving contents of the string to a register at cpu.
mov si, STR

; calling the print function.
call printf

; making the os to hang for infinite loop so 
; that we can see whatever is displayed.
jmp $

; printf function
printf:
	; pushing everything to stack so that we 
	; wont interfere with stuff we dont need.
	pusha
	str_loop:
		; reading each character from si.
		mov al, [si]
		; To know wether we came to end of string (eof).
		cmp al, 0
		; If not equal then go to print each letter.
		jne print_char
		; removing everything from stack.
		popa
		; returning back to call.
		ret

	; printing each character
	print_char:
		; system call to move to next column in screen. 
		mov ah,0x0e
		; interrupt to display character on the screen.
		int 0x10
		; incrementing si to next letter.
		add si, 1
		; jump back to go get next letter.
		jmp str_loop



; Creating a string.
; 0 indicate end of string.

STR: db 'Hello World', 0

; Padding and magic number.
times 510 - ( $ - $$ ) db 0
; magic number to identify this code to be executed while os booting.
dw 0xaa55

; 	ah -> system call to go to next character.
; 	al -> Holds the character.
; 	int -> interrupt to display on the screen.