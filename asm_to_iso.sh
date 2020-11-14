nasm -fbin main.asm -o main.bin
truncate main.bin -s 1200k
mkisofs -o abc.iso -b main.bin ./
