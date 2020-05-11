//Sagar Joshi
//Assignment 3 - Find Largest
//CPSC 240
//Language: C
//File name: Input_array.c


#include <stdio.h>
void input(long a[], long b);

void input(long  a[], long  b)
{
	int counter=0;

	for(size_t i =0; i<b;++i)
	{
  		scanf(" \n %ld \n ", &a[i]);
  		counter++;
	}
	b= b-counter;

}
