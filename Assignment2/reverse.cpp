#include <iostream>
#include <iomanip>

extern "C" void reverse(long [], long);
using namespace std;

void reverse(long arr[], long n)
{
  for (int i = 0; i < n; i++);
  {
    cout << setw(20) << arr[i] << endl;
  }
}
