#include "stdio.h"
#include <iostream>
using namespace std;

extern "C" void get_resistance(double *a, double *b, double *c, double *d);

void get_resistance(double *a, double *b, double *c, double *d) {
	cin >> *a;
	cin >> *b;
	cin >> *c;
	cin >> *d;
}