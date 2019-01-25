#!/bin/bash

# Make temp directories
mkdir tmp

# Boot 0 shit
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -Os -g -m32 -Iboot/boot0/ -c -o tmp/boot0.o boot/boot0/boot0.S
ld -nostdlib -m elf_i386 -N -e start -Ttext 0x7c00 -o tmp/boot0.elf tmp/boot0.o
objcopy -S -O binary tmp/boot0.elf tmp/boot0

# Boot 0 shit
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -Os -g -m32 -Iboot/boot1/ -c -o tmp/boot1.o boot/boot1/boot1.S
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -Os -g -m32 -Iboot/boot1/ -c -o tmp/boot1main.o boot/boot1/boot1main.c
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -Os -g -m32 -Iboot/boot1/ -c -o tmp/boot1lib.o boot/boot1/boot1lib.c
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -Os -g -m32 -Iboot/boot1/ -c -o tmp/exec_kernel.o boot/boot1/exec_kernel.S 
ld -nostdlib -m elf_i386 -N -e start -Ttext 0x7e00 -o tmp/boot1.elf tmp/boot1.o tmp/boot1main.o tmp/boot1lib.o tmp/exec_kernel.o
objcopy -S -O binary tmp/boot1.elf tmp/boot1

# Kernel Init shit
gcc -MD -fno-builtin -nostdinc -fno-stack-protector -D_KERN_ -Ikern -Ikern/kern -Ikern/init/ -m32 -O0 -c -o tmp/entry.o kern/init/entry.S
ld -o tmp/kernel -nostdlib -e start -m elf_i386 -Ttext=0x00100000 tmp/entry.o -b binary

# Build image
dd if=/dev/zero of=project0.img bs=512 count=256
parted -s project0.img "mktable msdos mkpart primary 63s -1s set 1 boot on"
dd if=tmp/boot0 of=project0.img bs=446 count=1 conv=notrunc
dd if=tmp/boot1 of=project0.img bs=512 count=62 seek=1 conv=notrunc
dd if=tmp/kernel of=project0.img bs=512 seek=63 conv=notrunc

# Cleans tmp
rm -rf tmp

