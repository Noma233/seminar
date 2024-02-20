#include<math.h>
#include<x86intrin.h>;
int kernel(int n, double xi[][3], double yi[][3], double f[]){
   int i;
   int j;
   __m256d xi_tmp_v0;
   __m256d xi_tmp_v1;
   __m256d xi_tmp_v2;
   __m256d yi_tmp_v0;
   __m256d yi_tmp_v1;
   __m256d yi_tmp_v2;
   __m256d f_tmp;
   for (i = 0; i < n; i += 4) {
      int index_gather_0[4] = {0, 3, 6, 9};
      __m128i vindex_gather_0 = _mm_load_si128((const __m128i*)index_gather_0);
      xi_tmp_v0 = _mm256_i32gather_pd(&xi[i][0], vindex_gather_0, 8);
      int index_gather_1[4] = {0, 3, 6, 9};
      __m128i vindex_gather_1 = _mm_load_si128((const __m128i*)index_gather_1);
      xi_tmp_v1 = _mm256_i32gather_pd(&xi[i][1], vindex_gather_1, 8);
      int index_gather_2[4] = {0, 3, 6, 9};
      __m128i vindex_gather_2 = _mm_load_si128((const __m128i*)index_gather_2);
      xi_tmp_v2 = _mm256_i32gather_pd(&xi[i][2], vindex_gather_2, 8);
      f_tmp = _mm256_set1_pd(0.0);
      for (j = 0; j < n; j += 1) {
         yi_tmp_v0 = _mm256_set1_pd(yi[j][0]);
         yi_tmp_v1 = _mm256_set1_pd(yi[j][1]);
         yi_tmp_v2 = _mm256_set1_pd(yi[j][2]);
         f_tmp += _mm256_add_pd(xi_tmp_v0, yi_tmp_v0);
      };
      _mm256_store_pd(&f[i], f_tmp);
   };
   return 0;
};