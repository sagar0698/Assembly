#include "stdio.h"
#include <iostream>
using namespace std;

extern "C" double resistance();

int main() {
	cout << "Welcome to Parallel Circuits by Sagar Joshi" << endl;
	double answer = resistance();
	cout << "Main has received this number: " << answer << endl;
	cout << "Main will now return 0 to the operating system" << endl;
}