#include "stdio.h"
#include <iostream>
using namespace std;

extern "C" void show_resistance(double ohm);

void show_resistance(double ohm) {
	cout << "The total resistance of the system is " << ohm << " ohms" << endl;
}