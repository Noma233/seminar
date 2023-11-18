#include<x86intrin.h>
#include<stdio.h>

int vec_add(double a[], double b[], double c[], int n) {
    int i;
    for(i = 0;i < n;i += 4) {
        __m256d va = _mm256_load_pd(&a[i]);
        __m256d vb = _mm256_load_pd(&b[i]);
        __m256d vc = va + vb;
        _mm256_store_pd(&c[i], vc);
    }
    return 0;
}



