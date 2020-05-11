#!/bin/bash

#Sagar Joshi
#CPSC 240
#Assignment 2 - Arrays

rm *.o
rm *.out

echo "Assembling manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Compiling display_array.asm"
nasm -f elf64 -l display_array.lis -o display_array.o display_array.asm

echo "Compiling main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

echo "Compiling reverse.cpp"
g++ -c -Wall -m64 -no-pie -o reverse.o reverse.cpp -std=c++17

echo "Linking all objects together"
gcc -m64 -no-pie -o run.out -std=c11 manager.o main.o display_array.o reverse.o

./run.out
