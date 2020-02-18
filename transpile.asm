%macro define_bytes 3+
%1:
    db %2 - %1 - 1, %3
%endmacro

%macro match_token 4
%1:
    cmp byte [k], %2
    jne %3
    prepare_write %4
    jmp l
%endmacro

%macro perform_write 0
    mov rax, 1
    mov rdi, 1
    syscall
%endmacro

%macro prepare_write 1
    mov rsi, %1 + 1
    mov dl, [%1]
%endmacro

global _start

section .data

define_bytes a, b, "#include<unistd.h>", 10, "char a[30000];char*b=a;int main(void){"
define_bytes b, c, "++b;"
define_bytes c, d, "--b;"
define_bytes d, e, "++*b;"
define_bytes e, f, "--*b;"
define_bytes f, g, "write(1,b,1);"
define_bytes g, h, "read(0,b,1);"
define_bytes h, i, "while(*b){"
define_bytes i, j, "}"
define_bytes j, k, "return 0;}"
k:
    db 0

section .text

_start:
prepare_write a
l:
perform_write
m:
    xor rax, rax
    xor rdi, rdi
    mov rdx, 1
    mov rsi, k
    mov byte [k], 0
    syscall
    cmp byte [k], 0
    jne n
prepare_write j
perform_write
    mov rax, 60
    xor rdi, rdi
    syscall
match_token n, '>', o, b
match_token o, '<', p, c
match_token p, '+', q, d
match_token q, '-', r, e
match_token r, '.', s, f
match_token s, ',', t, g
match_token t, '[', u, h
match_token u, ']', m, i