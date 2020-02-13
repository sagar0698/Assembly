#!/bin/bash

#Author name: Sagar Joshi
#Program title:  Integer Arithmetic
#Files in this program:  egyptian.c, area.asm, run.sh
#Course number:  CPSC 240
#Assignment number: 1
#Due Date:  Feb 10, 2020
#Language of this module: shell scripting
#Purpose: Show how to perform arithmetic operations by calculating the area of a circle
#File name: run.sh


#Delete some un-needed files
rm *.o
rm *.out

echo "The script file for Program Integer Arithmetic has begun"
echo "Assemble area.asm, the x86 source file"
nasm -f elf64 -l area.lis -o area.o area.asm

echo "Compile egyptian.c, the driver module"
gcc -c -Wall -m64 -no-pie -o egyptian.o egyptian.c -std=c11

echo "Links the two object files"
gcc -m64 -no-pie -o test.out -std=c11 egyptian.o area.o

echo "Run the program Integer Arithmetic:"
./test.out

echo "The script file will terminate"
echo "Good-bye"
