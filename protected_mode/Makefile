




all:
	nasm -f bin boot.asm -o boot.bin
	dd if=message.txt bs=512 count=1 >> boot.bin
	dd if=/dev/zero bs=512 count=1 >> boot.bin
	qemu-system-x86_64 boot.bin


