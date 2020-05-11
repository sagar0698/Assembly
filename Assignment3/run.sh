#!/bin/bash

echo "Assembling Manager.asm"
nasm -f elf64 -l Manager.lis -o Manager.o Manager.asm

echo "Compiling Output_array.asm"
nasm -f elf64 -l Output_array.lis -o Output_array.o Output_array.asm

echo "Compiling Find_largest"
nasm -f elf64 -l Find_largest.lis -o Find_largest.o Find_largest.asm

echo "Compiling Input_array.c"
gcc -c -Wall -m64 -no-pie -o Input_array.o Input_array.c -std=c11

echo "Compiling Largest.cpp"
g++ -c -Wall -m64 -no-pie -o Largest.o Largest.cpp -std=c++17

echo "Linking all objects together"
g++ -m64 -no-pie -o run.out -std=c++17 Manager.o Largest.o Input_array.o Output_array.o Find_largest.o

./run.out
