




ORG 0x7c00
BITS 16

start:
	mov si, message ; move address of message to si
	call print
	jmp $

print:
	mov bh, 0
	mov bl, 12h
.loop:
	lodsb ; load byte from si to al, increment si
	cmp al, 0 ; compare al to 0, if equal, jump to .done
	je .done
	call print_char
	jmp .loop
.done: ; label, used for returning, only applies to the print subroutine
	ret

print_char:					; a routine to print a string, or as far as I know, a function
	mov ah, 0eh ; function for outputting a character
	int 10h
	ret

message db 'Hello world!!!', 0 ; null terminated string

times 510-($-$$) db 0
dw 0xaa55
