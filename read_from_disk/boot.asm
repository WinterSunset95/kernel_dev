




ORG 0x7c00
BITS 16

load:
	mov ah, 0x02
	mov al, 0x01
	mov ch, 0x00
	mov cl, 0x02
	mov dh, 0x00
	mov bx, buffer
	int 13h
	jc error

	mov si, buffer
	call print
	jmp $

error:
	mov si, err_msg

print:
	mov ah, 0eh
	lodsb
	int 10h
	cmp al, 0
	jne print
	ret

err_msg: db "error loading", 0
times 510-($-$$) db 0
dw 0xaa55

buffer:
