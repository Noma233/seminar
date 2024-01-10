#include<math.h>
#include<x86intrin.h>;
int kernel(int n, double xi[][3], double xj[][3], double mass[], double ai[][3], double g, double eps2){
   int i;
   int j;
   __m256d xi_tmp_v0;
   __m256d xi_tmp_v1;
   __m256d xi_tmp_v2;
   __m256d xj_tmp_v0;
   __m256d xj_tmp_v1;
   __m256d xj_tmp_v2;
   __m256d mass_tmp;
   __m256d ai_tmp_v0;
   __m256d ai_tmp_v1;
   __m256d ai_tmp_v2;
   __m256d g_tmp;
   __m256d eps2_tmp;
   __m256d x0_tmp_v0;
   __m256d x0_tmp_v1;
   __m256d x0_tmp_v2;

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
      for (j = 0; j < n; j += 1) {
         xj_tmp_v0 = _mm256_set1_pd(xj[j][0]);
         xj_tmp_v1 = _mm256_set1_pd(xj[j][1]);
         xj_tmp_v2 = _mm256_set1_pd(xj[j][2]);
         mass_tmp = _mm256_set1_pd(mass[j]);
         x0_tmp_v0 = _mm256_sub_pd(xj_tmp_v0, xi_tmp_v0);
         x0_tmp_v1 = _mm256_sub_pd(xj_tmp_v1, xi_tmp_v1);
         x0_tmp_v2 = _mm256_sub_pd(xj_tmp_v2, xi_tmp_v2);
         ai_tmp_v0 = _mm256_div_pd(_mm256_mul_pd(_mm256_mul_pd(g_tmp, mass_tmp), x0_tmp_v0), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v0, x0_tmp_v0))), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v0, x0_tmp_v0))), _mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v0, x0_tmp_v0))))));
         ai_tmp_v1 = _mm256_div_pd(_mm256_mul_pd(_mm256_mul_pd(g_tmp, mass_tmp), x0_tmp_v1), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v1, x0_tmp_v1))), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v1, x0_tmp_v1))), _mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v1, x0_tmp_v1))))));
         ai_tmp_v2 = _mm256_div_pd(_mm256_mul_pd(_mm256_mul_pd(g_tmp, mass_tmp), x0_tmp_v2), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v2, x0_tmp_v2))), _mm256_mul_pd(_mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v2, x0_tmp_v2))), _mm256_sqrt_pd(_mm256_add_pd(eps2_tmp, _mm256_mul_pd(x0_tmp_v2, x0_tmp_v2))))));
      };
      ai[i][0] = ai_tmp_v0[0];
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
};