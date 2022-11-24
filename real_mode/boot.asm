





ORG 0x7c00
BITS 16

; Refer to ralf browns interrupt list for more info
; http://www.ctyme.com/intr/rb-0607.htm
read:
	mov ah, 2
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov bx, buffer ; i have absolutely no idea what this does, anyone care to explain?
	int 13h ; disk read interrupt
	jc error ; if carry flag is set, jump to error

	mov si, buffer
	call print
	jmp $

error:
	mov si,	err_msg
	call print

; the print subroutine
; prints whatever the hell the si register is pointing to at the moment
print:
	mov ah, 0eh
	lodsb
	int 10h
	cmp al, 0
	jne print
	ret

err_msg:
	db "Error reading sector", 0

times 510-($-$$) db 0
dw 0xaa55

buffer:
