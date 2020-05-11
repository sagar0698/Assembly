//Sagar Joshi
//CPSC 240
//Assignment 2 - Arrays

#include <stdio.h>
using namespace std;
extern "C"  void reverse(long [], long);

void reverse(long a[], long size)
{
	int i = 0;
	int j = size;
	while(i < j)
	{
		int temp = a[i];
		a[i] = a[j];
		a[j] = temp;
    		i++;
    		j--;
  	}
}
