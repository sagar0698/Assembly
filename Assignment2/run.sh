#!/bin/bash

rm * .o
rm * .out

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble displayArray.asm"
nasm -f elf64 -l displayArray.lis -o displayArray.o displayArray.asm

echo "Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c std=c11

echo "Link object files together"
gcc -m64 -no-pie -o test.out -std=c11 manager.o displayArray.o main.o 

echo "Run Program test.out"
./test.out

echo "The script file will terminate"
