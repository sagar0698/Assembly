// Author name: Sagar Joshi
// Program title:  Integer Arithmetic
// Files in this program:  egyptian.c, area.asm, run.sh
// Course number:  CPSC 240
// Assignment number: 1
// Due Date: Feb 10, 2020
// Language of this module: C
// Purpose: Show how to perform arithmetic operations by calculating the area of a circle
// File name: egyptian.c
// Compile: gcc -c -m64 -Wall -fno-pie -no-pie -o egyptian.o egyptian.c
// Link to C program: gcc -c -Wall -m64 -fno-pie -std=c11 -o test.out egyptian.o
// Running just C program: ./test.out

#include "stdio.h"

long int area();  //from segment .text

int main()
{
  long int result_code = -99;
  printf("Welcome to your friendly area calculator\n\n");
  printf("The main program will now call the area function\n\n");
  result_code = area();
  printf("\nThe main received this integer: %ld", result_code);
  printf("\nHave a nice day. Main will now return 0 to the operating system\n\n");
  return 0;
}
