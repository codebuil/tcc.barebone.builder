rm *.bin
rm *.o
as -o boot.o boot.s
pcc -c -nostdlib kernel.c -o kernel.o
pcc -nostdlib -T link.ld  boot.o kernel.o -o kernel.bin 
grub-file --is-x86-multiboot kernel.bin

