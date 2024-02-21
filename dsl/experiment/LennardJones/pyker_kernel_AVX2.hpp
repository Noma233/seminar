#include<math.h>
#include<x86intrin.h>;
int kernel(int n, double rix[], double riy[], double riz[], double rjx[], double rjy[], double rjz[], double eps[], double fx[], double fy[], double fz[], double p[]){
   int i;
   int j;
   __m256d rix_tmp;
   __m256d riy_tmp;
   __m256d riz_tmp;
   __m256d rjx_tmp;
   __m256d rjy_tmp;
   __m256d rjz_tmp;
   __m256d eps_tmp;
   __m256d fx_tmp;
   __m256d fy_tmp;
   __m256d fz_tmp;
   __m256d p_tmp;
   __m256d float_4_tmp;
   float_4_tmp = _mm256_set1_pd(1.0);
   __m256d float_1_tmp;
   float_1_tmp = _mm256_set1_pd(48.0);
   __m256d float_2_tmp;
   float_2_tmp = _mm256_set1_pd(24.0);
   __m256d float_3_tmp;
   float_3_tmp = _mm256_set1_pd(4.0);
   __m256d dx_tmp;
   __m256d dy_tmp;
   __m256d dz_tmp;
   __m256d r2_tmp;
   __m256d r2i_tmp;
   __m256d r6i_tmp;
   __m256d f_tmp;
   for (i = 0; i < n; i += 4) {
      rix_tmp = _mm256_load_pd(&rix[i]);
      riy_tmp = _mm256_load_pd(&riy[i]);
      riz_tmp = _mm256_load_pd(&riz[i]);
      fx_tmp = _mm256_set1_pd(0.0);
      fy_tmp = _mm256_set1_pd(0.0);
      fz_tmp = _mm256_set1_pd(0.0);
      p_tmp = _mm256_set1_pd(0.0);
      for (j = 0; j < n; j += 1) {
         rjx_tmp = _mm256_set1_pd(rjx[j]);
         rjy_tmp = _mm256_set1_pd(rjy[j]);
         rjz_tmp = _mm256_set1_pd(rjz[j]);
         eps_tmp = _mm256_set1_pd(eps[j]);

         
         dx_tmp = _mm256_sub_pd(rix_tmp, rjx_tmp);
         dy_tmp = _mm256_sub_pd(riy_tmp, rjy_tmp);
         dz_tmp = _mm256_sub_pd(riz_tmp, rjz_tmp);
         r2_tmp = _mm256_add_pd(
            _mm256_add_pd(
            _mm256_add_pd(eps_tmp,
             _mm256_mul_pd(dx_tmp, dx_tmp)),
              _mm256_mul_pd(dy_tmp, dy_tmp)), 
              _mm256_mul_pd(dz_tmp, dz_tmp));
         r2i_tmp = _mm256_div_pd(float_4_tmp, r2_tmp);
         r6i_tmp = _mm256_mul_pd(r2i_tmp,
          _mm256_mul_pd(r2i_tmp, r2i_tmp));
         f_tmp = _mm256_mul_pd(
            _mm256_mul_pd(r2i_tmp, r6i_tmp),
             _mm256_sub_pd(
               _mm256_mul_pd(float_1_tmp, r6i_tmp), float_2_tmp));
         fx_tmp += _mm256_mul_pd(dx_tmp, f_tmp);
         fy_tmp += _mm256_mul_pd(dy_tmp, f_tmp);
         fz_tmp += _mm256_mul_pd(dz_tmp, f_tmp);
         p_tmp += _mm256_mul_pd(
            _mm256_mul_pd(float_3_tmp, r6i_tmp),
             _mm256_sub_pd(r6i_tmp, float_4_tmp));
      };
      _mm256_store_pd(&fx[i], fx_tmp);
      _mm256_store_pd(&fy[i], fy_tmp);
      _mm256_store_pd(&fz[i], fz_tmp);
      _mm256_store_pd(&p[i], p_tmp);
   };
   return 0;
};