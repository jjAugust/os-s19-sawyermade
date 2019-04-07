#!/bin/bash
##Project0
#bash ./build.sh
#qemu-system-x86_64 -smp 1 -hda project0.img -serial mon:stdio -gdb tcp::4444 -m 512 -k en-us
#rm project0.img
##Project1
#make clean
#make -j8 TEST=1
##Project2
make clean
make TEST=1
make clean
