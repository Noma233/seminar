//includeも出来るようにする。
#include<stdio.h> 
#include <x86intrin.h>

int kernel(int n, double xi[], double xj[], double ai[]){
   int i;
   int j;
   __m256d xi_tmp;
   __m256d xj_tmp;
   __m256d ai_tmp; 
   for (i = 0; i < n; i += 4) {
      xi_tmp = _mm256_load_pd(&xi[i]);
      //ここでai を0に初期化
      ai_tmp = _mm256_set1_pd(0.0);
      for (j = 0; j < n; j += 1) {
         
         //同じ粒子を計算する場合を除く

         xj_tmp = _mm256_set1_pd(xj[j]);
         
         //+= にする。
         ai_tmp += _mm256_add_pd(xi_tmp, xj_tmp); 

         //関数名を変数の型にあわせる

      };
      _mm256_store_pd(&ai[i], ai_tmp);
   };
   return 0;
}

int main() {
   //   __attribute__((aligned(32))) double xvec[4][3] = {{1.0, 1.0, 1.0}, {2.0, 2.0, 2.0}, {3.0, 3.0, 3.0}, {4.0, 4.0, 4.0}};
   // __attribute__((aligned(32))) double ansvec[4][3];

     __attribute__((aligned(32))) double x[4] = {1.0, 2.0, 3.0, 4.0};
   __attribute__((aligned(32))) double ans[4];


   kernel(4, x, x, ans);
   for(int i  = 0;i < 4;i++) {
      // printf("(ans[%d][0], ans[%d][1], ans[%d][2]) = (%lf, %lf, %lf)\n",i, i, i, ans[i][0], ans[i][1], ans[i][2]);
      printf("ans[%d] = %lf\n",i, ans[i]);
   }
   return 0;

}

int kernel(int n, double xi[], double xj[], double mass[], double ai[]){
   int i;
   int j;
   __m256d xi_tmp;
   __m256d xj_tmp;
   __m256d mass_tmp;
   __m256d ai_tmp;
   __m256d x0;
   __m256d r;
   for (i = 0; i < n; i += 4) {
      xi_tmp = _mm256_load_pd(&xi[i]);
      for (j = 0; j < n; j += 1) {
         xj_tmp = _mm256_set1_pd(xj[j]);
         mass_tmp = _mm256_set1_pd(mass[j]);
         x0 = _mm256_add_pd(xi_tmp, xj_tmp);
         r = x0;
         ai_tmp = _mm256_add_pd(mass_tmp, x0);
      };
      _mm256_store_pd(&ai[i], ai_tmp);
   };
 
   return 0;
}


int kernel(int n, double xi[], double xj[], double mass[], double ai[], double eps){
   int i;
   int j;
   __m256d xi_tmp;
   __m256d xj_tmp;
   __m256d mass_tmp;
   __m256d ai_tmp;
   __m256d eps_tmp;
   __m256d x0;
   __m256d r;
   for (i = 0; i < n; i += 4) {
      xi_tmp = _mm256_load_pd(&xi[i]);
      for (j = 0; j < n; j += 1) {
         xj_tmp = _mm256_set1_pd(xj[j]);
         mass_tmp = _mm256_set1_pd(mass[j]);
         eps_tmp = _mm256_set1_pd(eps); // ここでset1でロードする
         x0 = _mm256_add_pd(xi_tmp, xj_tmp);
         r = _mm256_add_pd(eps_tmp, x0);
         ai_tmp = _mm256_add_pd(mass_tmp, x0);
      };
      _mm256_store_pd(&ai[i], ai_tmp);
   };
   return 0;
}