#include<x86intrin.h>
#include<stdio.h>


void print_m256(__m256d &v) {
    printf("%f %f %f %f\n", v[0], v[1], v[2], v[3]);
}

__m256d add_m256(__m256d &v1, __m256d &v2) {
    return v1 + v2;
}

void simd_func(double a[], double b[], double c[], int n) {
    int i = 0;
    for(i = 0;i < n;i += 4) {
        __m256d va = _mm256_load_pd(&a[i]);
        __m256d vb = _mm256_load_pd(&b[i]);
        __m256d vc = va + vb;
        _mm256_store_pd(&c[i], vc);
    }
}

int main() {

    __m256d v1 = _mm256_set_pd(3.0, 2.0, 1.0, 0.0);
    __m256d v2 = _mm256_set_pd(9.0, 8.0, 7.0, 6.0);
    __m256d v3 = add_m256(v1, v2);
    print_m256(v3);

    __m256d v4 = v1 * v2;
    print_m256(v4);

}