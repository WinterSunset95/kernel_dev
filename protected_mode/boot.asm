



ORG 0x7c00
BITS 16

read:
	mov ah, 2
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov bx, buffer
	int 13h
	jc error

	mov si, buffer
	call print
	jmp $

error:
	mov si, err_msg
	call print

print:
	mov ah, 0eh
	lodsb
	int 10h
	cmp al, 0
	jne print
	ret

err_msg:
	db "Error loading sector", 0
times 510-($-$$) db 0
dw 0xaa55

buffer:
