# bf-c

I've written this Brainfuck to C transpiler during a party. I don't actually
recall which party, nor can I think of any apropriate moment to write a
transpiler during a social event. But I must admit I was quite pleased when I
rediscovered this project the following afternoon.

## Usage

Simply pipe some Brainfuck code to the standard input of the `transpile`
program. The program will write the corresponding C code to its standard
output.

```sh
./transpile < example.bf > example.c
```

## Building

Make sure `nasm` is available in your environment, then run `make transpile` to
create the binary. Currently only x86-64 systems which implement Linux system
calls are supported by this transpiler.