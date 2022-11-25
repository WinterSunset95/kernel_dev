





all:
	nasm -f bin boot.asm -o boot.bin
	dd if=message.txt >> boot.bin
	dd if=/dev/zero bs=512 count=1 >> boot.bin
	dd if=/dev/zero of=boot.iso bs=1024 count=1440
	dd if=boot.bin of=boot.iso conv=notrunc
	qemu-system-x86_64 boot.iso
