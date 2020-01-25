transpile: transpile.o
	ld -o transpile transpile.o

transpile.o:
	nasm -f elf64 -o transpile.o transpile.asm