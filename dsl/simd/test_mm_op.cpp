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

int main() {

    double x = 1.0, y = 2.0;
    __m256d set_test1 = _mm256_set1_pd(x);
    __m256d set_test2 = _mm256_set1_pd(y);


    __m256d result_set = set_test1 + set_test2;

    __m256d test1 = {x, x, x, x};
    __m256d test2 = {y, y, y, y};

    __m256d result = test1 + test2;

    // test1 = test1 + test2;
    int n = 1000;
    double a[n], b[n], c[n];


    int index_gather_0[4] = {0, 3, 6, 9};
    __m128i vindex_gather_0 = _mm_load_si128((const __m128i*)index_gather_0);    
    // printf("%lld %lld %lld \n", vindex_gather_0[0], vindex_gather_0[1], vindex_gather_0[2]);
    printf("%d\n", vindex_gather_0);
    // _mm256d xs = _mm256_i32gather_pd(&xi[i][0], vindex_gather_0, 8);
}