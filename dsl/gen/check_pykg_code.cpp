
#include<stdio.h>
#include <x86intrin.h>
#include<iostream>
using namespace std;

int print_vec(__m256d x){
   cout << "print_vec" << endl;
   
   printf("%lf, %lf, %lf, %lf\n", x[0], x[1], x[2], x[3]);
   return 0;
}


int kernel(double xi[][3], double xj[][3], double ai[][3], int n){
   int i;
   int j;
   __m256d xi_tmp_v0;
   __m256d xi_tmp_v1;
   __m256d xi_tmp_v2;
   __m256d xj_tmp_v0;
   __m256d xj_tmp_v1;
   __m256d xj_tmp_v2;
   __m256d ai_tmp_v0 = _mm256_set1_pd(0.0);
   __m256d ai_tmp_v1 = _mm256_set1_pd(0.0);
   __m256d ai_tmp_v2 = _mm256_set1_pd(0.0);
   for (i = 0; i < n; i += 4) {
      int index_gather_0[4] = {0, 3, 6, 9};
      __m128i vindex_gather_0 = _mm_load_si128((const __m128i*)index_gather_0);
      xi_tmp_v0 = _mm256_i32gather_pd(&xi[i][0], vindex_gather_0, 8);
      xi_tmp_v0 = _mm256_load_pd(&xi[i][0]);
      int index_gather_1[4] = {0, 3, 6, 9};
      __m128i vindex_gather_1 = _mm_load_si128((const __m128i*)index_gather_1);
      xi_tmp_v1 = _mm256_i32gather_pd(&xi[i][1], vindex_gather_1, 8);
      int index_gather_2[4] = {0, 3, 6, 9};
      __m128i vindex_gather_2 = _mm_load_si128((const __m128i*)index_gather_2);
      xi_tmp_v2 = _mm256_i32gather_pd(&xi[i][2], vindex_gather_2, 8);

      for (j = 0; j < n; j += 1) {
         xj_tmp_v0 = _mm256_set1_pd(xj[j][0]);
         xj_tmp_v1 = _mm256_set1_pd(xj[j][1]);
         xj_tmp_v2 = _mm256_set1_pd(xj[j][2]);
         ai_tmp_v0 += _mm256_add_pd(xi_tmp_v0, xj_tmp_v0);
         ai_tmp_v1 += _mm256_add_pd(xi_tmp_v1, xj_tmp_v1);
         ai_tmp_v2 += _mm256_add_pd(xi_tmp_v2, xj_tmp_v2);

      };
      ai[i][0] = (double)ai_tmp_v0[0];
      ai[i + 1][0] = ai_tmp_v0[1];
      ai[i + 2][0] = ai_tmp_v0[2];
      ai[i + 3][0] = ai_tmp_v0[3];
      ai[i][1] = ai_tmp_v1[0];
      ai[i + 1][1] = ai_tmp_v1[1];
      ai[i + 2][1] = ai_tmp_v1[2];
      ai[i + 3][1] = ai_tmp_v1[3];
      ai[i][2] = ai_tmp_v2[0];
      ai[i + 1][2] = ai_tmp_v2[1];
      ai[i + 2][2] = ai_tmp_v2[2];
      ai[i + 3][2] = ai_tmp_v2[3];
   };
   return 0;
}

int main() {
   
   __attribute__((aligned(32))) double x[4][3] = {{1.0, 1.0, 1.0}, {2.0, 2.0, 2.0}, {3.0, 3.0, 3.0}, {4.0, 4.0, 4.0}};

   __attribute__((aligned(32))) double ans[4][3];
   kernel(x, x, ans, 4);
   for(int i  = 0;i < 4;i++) {
      printf("(ans[%d][0], ans[%d][1], ans[%d][2]) = (%lf, %lf, %lf)\n",i, i, i, ans[i][0], ans[i][1], ans[i][2]);
   }
   std::cout << "correct" << std::endl;
   return 0;

}int kernel(int n, double xi[], double xj[], double ai[], double eps){
   int i;
   int j;
   __m256d xi_tmp;
   __m256d xj_tmp;
   __m256d ai_tmp;
   __m256d eps_tmp;
   __m256d x0;
   for (i = 0; i < n; i += 4) {
      xi_tmp = _mm256_load_pd(&xi[i]);
      for (j = 0; j < n; j += 1) {
         xj_tmp = _mm256_set1_pd(xj[j]);
         x0 = _mm256_add_pd(xi_tmp, xj_tmp);
         ai_tmp = _mm256_mul_pd(x0, _mm256_add_pd(eps, x0));
      };
      _mm256_store_pd(&ai[i], ai_tmp);
   };
   return 0;
}