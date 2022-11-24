







ORG 0x7c00
BITS 16


start:
	mov ah, 0eh
	mov al, 'H'
	mov bx, 0
	int 0x10

	mov ah, 0eh
	mov al, 'e'
	mov bx, 1
	int 0x10

	mov ah, 0eh
	mov al, 'l'
	mov bx, 1
	int 0x10

	mov ah, 0eh
	mov al, 'l'
	mov bx, 1
	int 0x10

	mov ah, 0eh
	mov al, 'o'
	mov bx, 1
	int 0x10

	jmp $

times 510-($ - $$) db 0
dw 0xaa55
