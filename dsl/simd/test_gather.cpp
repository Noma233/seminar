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

__m256d test_gather(double a[][3]){
    __m256d x;
    int index[] = {0, 3, 6, 9};
    __m128i vindex = _mm_load_si128((const __m128i*)index);
    x = _mm256_i32gather_pd((double *)a, vindex, 8);
    return x;
}

int main() {
    double a[4][3] = {{0, 8989898, 21121}, {1, 212121, 21212}, {2, 21212, 2121}, {3, 213123, 4321432}};
    
    __m256d ans = test_gather(a);
    printf("%lf, %lf, %lf, %lf\n", ans[0], ans[1], ans[2], ans[3]);
}