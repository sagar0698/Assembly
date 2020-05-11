//Sagar Joshi
//Assignment 3 - Find Largest
//CPSC 240
//Language: C++
//File name: Largest.cpp

#include <cstdio>
#include <iostream>

extern "C" long int manager();

int main()
{
  long int value= -999999;
  printf("Welcome to CPSC 240 Assignment 3 brought to you by Sagar Joshi. \n");
  value = manager();
  printf("\nThe driver received this value: %ld", value);
  printf("\nHave a nice day. Main will return control to the operating system.\n");
  return 0;
}

