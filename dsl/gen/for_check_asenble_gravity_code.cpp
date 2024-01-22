#include<stdio.h>
#include <x86intrin.h>
#include<algorithm>
#include<math.h>
#include <immintrin.h>
#include <random>
#include<time.h>
#include<iostream>
#include<set>
using namespace std;

#include "gravity_code.hpp"


int main() {
    int n = 10;
    double xi[n][3];
    double m[n];
    double ai[n][3];
    double eps2 = pow(2, -5);
    double g = 1;
    
    kernel(n, xi, xi, m, ai, eps2, g);
    
}