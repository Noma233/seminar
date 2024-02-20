#include<math.h>
#include<x86intrin.h>
int kernel(int n, double ri[][3], double vi[][3], double rj[][3], double vj[][3], double mj[], double eps2[], double F[][3], double J[][3]){
   int i;
   int j;
   __m256d ri_tmp_v0;
   __m256d ri_tmp_v1;
   __m256d ri_tmp_v2;
   __m256d vi_tmp_v0;
   __m256d vi_tmp_v1;
   __m256d vi_tmp_v2;
   __m256d rj_tmp_v0;
   __m256d rj_tmp_v1;
   __m256d rj_tmp_v2;
   __m256d vj_tmp_v0;
   __m256d vj_tmp_v1;
   __m256d vj_tmp_v2;
   __m256d mj_tmp;
   __m256d eps2_tmp;
   __m256d F_tmp_v0;
   __m256d F_tmp_v1;
   __m256d F_tmp_v2;
   __m256d J_tmp_v0;
   __m256d J_tmp_v1;
   __m256d J_tmp_v2;
   __m256d float_0_tmp;
   float_0_tmp = _mm256_set1_pd(1.0);
   __m256d float_1_tmp;
   float_1_tmp = _mm256_set1_pd(3.0);
   __m256d dr_tmp_v0;
   __m256d dr_tmp_v1;
   __m256d dr_tmp_v2;
   __m256d dv_tmp_v0;
   __m256d dv_tmp_v1;
   __m256d dv_tmp_v2;
   __m256d r2_tmp;
   __m256d r1i_tmp;
   __m256d r2i_tmp;
   __m256d r3i_tmp;
   __m256d r5i_tmp;
   __m256d rv_tmp;
   __m256d af_tmp;
   __m256d jf_tmp;
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
      int index_gather_3[4] = {0, 3, 6, 9};
      __m128i vindex_gather_3 = _mm_load_si128((const __m128i*)index_gather_3);
      vi_tmp_v0 = _mm256_i32gather_pd(&vi[i][0], vindex_gather_3, 8);
      int index_gather_4[4] = {0, 3, 6, 9};
      __m128i vindex_gather_4 = _mm_load_si128((const __m128i*)index_gather_4);
      vi_tmp_v1 = _mm256_i32gather_pd(&vi[i][1], vindex_gather_4, 8);
      int index_gather_5[4] = {0, 3, 6, 9};
      __m128i vindex_gather_5 = _mm_load_si128((const __m128i*)index_gather_5);
      vi_tmp_v2 = _mm256_i32gather_pd(&vi[i][2], vindex_gather_5, 8);
      F_tmp_v0 = _mm256_set1_pd(0.0);
      F_tmp_v1 = _mm256_set1_pd(0.0);
      F_tmp_v2 = _mm256_set1_pd(0.0);
      J_tmp_v0 = _mm256_set1_pd(0.0);
      J_tmp_v1 = _mm256_set1_pd(0.0);
      J_tmp_v2 = _mm256_set1_pd(0.0);
      for (j = 0; j < n; j += 1) {
         rj_tmp_v0 = _mm256_set1_pd(rj[j][0]);
         rj_tmp_v1 = _mm256_set1_pd(rj[j][1]);
         rj_tmp_v2 = _mm256_set1_pd(rj[j][2]);
         vj_tmp_v0 = _mm256_set1_pd(vj[j][0]);
         vj_tmp_v1 = _mm256_set1_pd(vj[j][1]);
         vj_tmp_v2 = _mm256_set1_pd(vj[j][2]);
         mj_tmp = _mm256_set1_pd(mj[j]);
         eps2_tmp = _mm256_set1_pd(eps2[j]);
         dr_tmp_v0 = _mm256_sub_pd(ri_tmp_v0, rj_tmp_v0);
         dr_tmp_v1 = _mm256_sub_pd(ri_tmp_v1, rj_tmp_v1);
         dr_tmp_v2 = _mm256_sub_pd(ri_tmp_v2, rj_tmp_v2);
         dv_tmp_v0 = _mm256_sub_pd(vi_tmp_v0, vj_tmp_v0);
         dv_tmp_v1 = _mm256_sub_pd(vi_tmp_v1, vj_tmp_v1);
         dv_tmp_v2 = _mm256_sub_pd(vi_tmp_v2, vj_tmp_v2);
         r2_tmp = _mm256_add_pd(eps2_tmp,
          _mm256_add_pd(                   
         _mm256_add_pd(
         _mm256_mul_pd(dr_tmp_v0, dr_tmp_v0), 
         _mm256_mul_pd(dr_tmp_v1, dr_tmp_v1)),
         _mm256_mul_pd(dr_tmp_v2, dr_tmp_v2)));
         r1i_tmp = _mm256_div_pd(float_0_tmp, 
         _mm256_sqrt_pd(r2_tmp));
         r2i_tmp = _mm256_mul_pd(r1i_tmp, r1i_tmp);
         r3i_tmp = _mm256_mul_pd(r1i_tmp, r2i_tmp);
         r5i_tmp = _mm256_mul_pd(r2i_tmp, r3i_tmp);
         rv_tmp = _mm256_add_pd(
                  _mm256_add_pd(
                     _mm256_mul_pd(dr_tmp_v0, dv_tmp_v0), 
                                _mm256_mul_pd(dr_tmp_v1, dv_tmp_v1)), 
                                _mm256_mul_pd(dr_tmp_v2, dv_tmp_v2));
         af_tmp = _mm256_mul_pd(mj_tmp, r3i_tmp);
         jf_tmp = _mm256_mul_pd(
            _mm256_mul_pd(
            _mm256_mul_pd(float_1_tmp, mj_tmp), r5i_tmp), rv_tmp);
         F_tmp_v0 += _mm256_mul_pd(af_tmp, dr_tmp_v0);
         F_tmp_v1 += _mm256_mul_pd(af_tmp, dr_tmp_v1);
         F_tmp_v2 += _mm256_mul_pd(af_tmp, dr_tmp_v2);
         J_tmp_v0 += _mm256_sub_pd(
            _mm256_mul_pd(af_tmp, dv_tmp_v0),
             _mm256_mul_pd(dr_tmp_v0, jf_tmp));
         J_tmp_v1 += _mm256_sub_pd(
            _mm256_mul_pd(af_tmp, dv_tmp_v1),
             _mm256_mul_pd(dr_tmp_v1, jf_tmp));
         J_tmp_v2 += 
         _mm256_sub_pd(
            _mm256_mul_pd(af_tmp, dv_tmp_v2),
             _mm256_mul_pd(dr_tmp_v2, jf_tmp));
      };
      F[i][0] = F_tmp_v0[0];
      F[i + 1][0] = F_tmp_v0[1];
      F[i + 2][0] = F_tmp_v0[2];
      F[i + 3][0] = F_tmp_v0[3];
      F[i][1] = F_tmp_v1[0];
      F[i + 1][1] = F_tmp_v1[1];
      F[i + 2][1] = F_tmp_v1[2];
      F[i + 3][1] = F_tmp_v1[3];
      F[i][2] = F_tmp_v2[0];
      F[i + 1][2] = F_tmp_v2[1];
      F[i + 2][2] = F_tmp_v2[2];
      F[i + 3][2] = F_tmp_v2[3];
      J[i][0] = J_tmp_v0[0];
      J[i + 1][0] = J_tmp_v0[1];
      J[i + 2][0] = J_tmp_v0[2];
      J[i + 3][0] = J_tmp_v0[3];
      J[i][1] = J_tmp_v1[0];
      J[i + 1][1] = J_tmp_v1[1];
      J[i + 2][1] = J_tmp_v1[2];
      J[i + 3][1] = J_tmp_v1[3];
      J[i][2] = J_tmp_v2[0];
      J[i + 1][2] = J_tmp_v2[1];
      J[i + 2][2] = J_tmp_v2[2];
      J[i + 3][2] = J_tmp_v2[3];
   };
   return 0;
};