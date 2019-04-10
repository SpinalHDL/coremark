#!/bin/sh

rm -rf build
mkdir build

rm -rf *.o
rm -rf *.bin
rm -rf *.asm
rm -rf *.elf
make PORT_DIR=vexriscv_sim XCFLAGS="-DCLOCKS_PER_SEC=1000000 -DCORE_DEBUG=0" ITERATIONS=50 REBUILD=1 clean compile link
mv coremark.bin coremark.elf
riscv64-unknown-elf-objcopy -O binary coremark.elf build/coremark_rv32i.bin
riscv64-unknown-elf-objcopy -O ihex coremark.elf build/coremark_rv32i.hex
riscv64-unknown-elf-objdump -S -d coremark.elf > build/coremark_rv32i.asm


rm -rf *.o
rm -rf *.bin
rm -rf *.asm
rm -rf *.elf
make PORT_DIR=vexriscv_sim XCFLAGS="-DCLOCKS_PER_SEC=1000000 -DCORE_DEBUG=0" ITERATIONS=50  REBUILD=1 MULDIV=yes clean compile link
mv coremark.bin coremark.elf
riscv64-unknown-elf-objcopy -O binary coremark.elf build/coremark_rv32im.bin
riscv64-unknown-elf-objcopy -O ihex coremark.elf build/coremark_rv32im.hex
riscv64-unknown-elf-objdump -S -d coremark.elf > build/coremark_rv32im.asm



rm -rf *.o
rm -rf *.bin
rm -rf *.asm
rm -rf *.elf
make PORT_DIR=vexriscv_sim XCFLAGS="-DCLOCKS_PER_SEC=1000000  -DCORE_DEBUG=0" ITERATIONS=50 REBUILD=1 COMPRESSED=yes clean compile link
mv coremark.bin coremark.elf
riscv64-unknown-elf-objcopy -O binary coremark.elf build/coremark_rv32ic.bin
riscv64-unknown-elf-objcopy -O ihex coremark.elf build/coremark_rv32ic.hex
riscv64-unknown-elf-objdump -S -d coremark.elf > build/coremark_rv32ic.asm




rm -rf *.o
rm -rf *.bin
rm -rf *.asm
rm -rf *.elf
make PORT_DIR=vexriscv_sim XCFLAGS="-DCLOCKS_PER_SEC=1000000  -DCORE_DEBUG=0" ITERATIONS=50 REBUILD=1 MULDIV=yes  COMPRESSED=yes clean compile link
mv coremark.bin coremark.elf
riscv64-unknown-elf-objcopy -O binary coremark.elf build/coremark_rv32imc.bin
riscv64-unknown-elf-objcopy -O ihex coremark.elf build/coremark_rv32imc.hex
riscv64-unknown-elf-objdump -S -d coremark.elf > build/coremark_rv32imc.asm









