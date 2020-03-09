// Author name: Sagar Joshi
// Program title:  Arrays
// Files in this program:  main.c, manager.asm, displayarray.asm, reverse.cpp
// Course number:  CPSC 240
// Assignment number: 2
// Due Date: Feb 20, 2020
// Language of this module: C
// Purpose: Using C++ as a linker in order to display an array in the reverse order
// File name: main.c
// Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c
// Link to C program: gcc -c -Wall -m64 -fno-pie -std=c11 -o test.out main.o
// Running just C program: ./test.out

#include "stdio.h"

long int manager();

int main()
{
  long int result_code;
  printf("Welcome to Array of Integers\n");
  printf("Brought to you by Sagar Joshi\n");
  result_code = manager();   //rax = result_code
  printf("\n\nMain received this integer: %ld", result_code);
  printf("\n\nMain will return 0 to the operating system. Bye");

  return 0;
}
