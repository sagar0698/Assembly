#!/bin/bash

echo "Assemble resistance.asm"
nasm -f elf64 -l resistance.lis -o resistance.o resistance.asm

echo "Compiling compute_resistance.asm"
nasm -f elf64 -l compute_resistance.lis -o compute_resistance.o compute_resistance.asm

echo "Compiling get_resistance.c"
g++ -c -Wall -m64 -std=c++14 -o get_resistance.o get_resistance.c -no-pie -fno-pie

echo "Compiling show_resistance.c"
g++ -c -Wall -m64 -std=c++14 -o show_resistance.o show_resistance.c -no-pie -fno-pie

echo "Compiling ohm.c"
g++ -c -Wall -m64 -std=c++11 -o ohm.o ohm.c -no-pie -fno-pie

echo "Linking all objects together"
g++ -m64 -o run.out ohm.o show_resistance.o get_resistance.o compute_resistance.o resistance.o -no-pie -fno-pie -std=c++11

./run.out
