#include<math.h>
#include<x86intrin.h>;
int kernel(int n, double ri[][3], double rj[][3], double mass[], double eps2[], double ai[][3]){
   int i;
   int j;
   __m256d ri_tmp_v0;
   __m256d ri_tmp_v1;
   __m256d ri_tmp_v2;
   __m256d rj_tmp_v0;
   __m256d rj_tmp_v1;
   __m256d rj_tmp_v2;
   __m256d mass_tmp;
   __m256d eps2_tmp;
   __m256d ai_tmp_v0;
   __m256d ai_tmp_v1;
   __m256d ai_tmp_v2;
   __m256d float_0_tmp;
   float_0_tmp = _mm256_set1_pd(1.0);
   __m256d rij_tmp_v0;
   __m256d rij_tmp_v1;
   __m256d rij_tmp_v2;
   __m256d r2_tmp;
   __m256d r_inv_tmp;
   __m256d r2_inv_tmp;
   __m256d mr_inv_tmp;
   __m256d mr3_inv_tmp;
   for (i = 0; i < n; i += 4) {
      int index_gather_0[4] = {0, 3, 6, 9};
      __m128i vindex_gather_0 = _mm_load_si128((const __m128i*)index_gather_0);
      ri_tmp_v0 = _mm256_i32gather_pd(&ri[i][0], vindex_gather_0, 8);
      int index_gather_1[4] = {0, 3, 6, 9};
      __m128i vindex_gather_1 = _mm_load_si128((const __m128i*)index_gather_1);
      ri_tmp_v1 = _mm256_i32gather_pd(&ri[i][1], vindex_gather_1, 8);
      int index_gather_2[4] = {0, 3, 6, 9};
      __m128i vindex_gather_2 = _mm_load_si128((const __m128i*)index_gather_2);
      ri_tmp_v2 = _mm256_i32gather_pd(&ri[i][2], vindex_gather_2, 8);
      ai_tmp_v0 = _mm256_set1_pd(0.0);
      ai_tmp_v1 = _mm256_set1_pd(0.0);
      ai_tmp_v2 = _mm256_set1_pd(0.0);
      for (j = 0; j < n; j += 1) {
         rj_tmp_v0 = _mm256_set1_pd(rj[j][0]);
         rj_tmp_v1 = _mm256_set1_pd(rj[j][1]);
         rj_tmp_v2 = _mm256_set1_pd(rj[j][2]);
         mass_tmp = _mm256_set1_pd(mass[j]);
         eps2_tmp = _mm256_set1_pd(eps2[j]);
         rij_tmp_v0 = _mm256_sub_pd(ri_tmp_v0, rj_tmp_v0);
         rij_tmp_v1 = _mm256_sub_pd(ri_tmp_v1, rj_tmp_v1);
         rij_tmp_v2 = _mm256_sub_pd(ri_tmp_v2, rj_tmp_v2);
         
         r2_tmp = _mm256_add_pd(eps2_tmp, _mm256_add_pd(_mm256_add_pd(
                                 _mm256_mul_pd(rij_tmp_v0, rij_tmp_v0), 
                                 _mm256_mul_pd(rij_tmp_v1, rij_tmp_v1)), 
                                 _mm256_mul_pd(rij_tmp_v2, rij_tmp_v2)));
         r_inv_tmp = _mm256_div_pd(float_0_tmp, _mm256_sqrt_pd(r2_tmp));
         r2_inv_tmp = _mm256_mul_pd(r_inv_tmp, r_inv_tmp);
         mr_inv_tmp = _mm256_mul_pd(mass_tmp, r_inv_tmp);
         mr3_inv_tmp = _mm256_mul_pd(mr_inv_tmp, r2_inv_tmp);
         ai_tmp_v0 += _mm256_mul_pd(mr3_inv_tmp, rij_tmp_v0);
         ai_tmp_v1 += _mm256_mul_pd(mr3_inv_tmp, rij_tmp_v1);
         ai_tmp_v2 += _mm256_mul_pd(mr3_inv_tmp, rij_tmp_v2);
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