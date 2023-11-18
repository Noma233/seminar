#include<x86intrin.h>
#include<stdio.h>
#include <random>
#include <algorithm>
using namespace std;

int vec_add(double a[], double b[], double c[], int n){
   int i;
   for (i = 0; i < n; i += 4) {
      __m256d va = _mm256_load_pd(&a[i]);
      __m256d vb = _mm256_load_pd(&b[i]);
      __m256d vc = va + vb;
      _mm256_store_pd(&c[i], vc);
   };
   return 0;
}

void check_particles(double true_val[], double x[],
                     int n, vector<double> &ans) {
    bool flag = true;
    double eps = 0.000001;
    double max_relerr = 0.0;
    double min_relerr = 10000000;
    for(int i = 0;i < n;i++) {
        
        double t = true_val[i];
        if(t == 0) {
            t = 1;
        }
   
        max_relerr = max(max_relerr, abs(true_val[i] - x[i]) / abs(t));
        min_relerr = min(min_relerr, abs(true_val[i] - x[i]) / abs(t));

    }
    ans.push_back(max_relerr);
    ans.push_back(min_relerr);

}

int main() {
    std::mt19937 mt;
    std::uniform_real_distribution<double> ud(0.0, 1.0);
    int  n = 100;
    __attribute__((aligned(32))) double a[n];
    __attribute__((aligned(32))) double b[n];
    __attribute__((aligned(32))) double c[n];
    __attribute__((aligned(32))) double true_val[n];
    for (int i = 0; i < n; i++) {
        a[i] = ud(mt);
        b[i] = ud(mt);
        true_val[i] = a[i] + b[i];
    }

    vec_add(a, b, c, n);
    vector<double> ans;
    check_particles(true_val, c, n, ans);

    printf("max reldiff = %lf, min reldiff = %lf\n", ans[0], ans[1]);

}