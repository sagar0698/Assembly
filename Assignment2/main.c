//Sagar Joshi
//CPSC 240
//Assignment 2 - Arrays

#include <stdio.h>
#include <stdint.h>

long int manager();

int main()
{
	long int answer = -999;
	printf("Welcome to Arrays of Integers\n");
	printf("Brought to you by Sagar Joshi\n");
	answer = manager();
	printf("%s%ld\n","Main recieved this number: ",answer);
	printf("Main will return 0 to the operating system. Bye.\n");
	return 0;
}
