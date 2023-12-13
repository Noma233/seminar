
#include<stdio.h>
#include <x86intrin.h>
int kernel(double xi[], double xj[], double ai[]){
   int i;
   int j;
   __m256d xi_tmp;
   __m256d xj_tmp;
   __m256d ai_tmp;
   __m256d ;
   __m256d check_sub;
   int n = 10;
   for (i = 0; i < n; i += 4) {
      xi_tmp = _mm256_load_pd(&xi[i]);
      for (j = 0; j < n; j += 1) {
         xj_tmp = _mm256_set1_pd(xj[j]);
         check_sub = _mm256_mul_pd(xi_tmp, _mm256_mul_pd(xi_tmp, xi_tmp));
         ai_tmp = _mm256_sqrt_pd(check_sub);
      };
      _mm256_store_pd(&ai[i], ai_tmp);
   };
   return 0;
}
