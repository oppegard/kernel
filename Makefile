build:
	nasm -f elf64 multiboot_header.asm
	nasm -f elf64 boot.asm
	ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o
iso:
	mv kernel.bin isofiles/boot/
	grub-mkrescue -o os.iso isofiles

run:
	qemu-system-x86_64 -drive format=raw,file=os.iso

default: build iso run
