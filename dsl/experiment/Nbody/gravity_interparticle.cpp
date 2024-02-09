#include<stdio.h>
#include<pikg_vector.h>
#include<pikg_vector.hpp>
#include<cstdlib> // 乱数生成のために必要
#include<ctime> // 乱数のシード設定のために必要
// #include<algorithm>
#include<cmath>
#include<time.h>

struct EPI {
   pikg_f64vec3 r;
};

struct EPJ{
   pikg_f64vec3 r;
   double m;
   double eps;
};

struct FORCE {
   pikg_f64vec3 acc;
};

#include "pikg_kernel.hpp"
#include "pyker_code.hpp"

// #include "pikg_kernel_AVX2.hpp"
// #include "pyker_kernel_AVX2.hpp"

// 乱数を生成するための関数
double rand_double(double min, double max) {
   return min + (double)rand() / ((double)RAND_MAX / (max - min));
}

// double calculate_difference(double a[][3], double b[][3], int n) {
//     double diff = 0;
//     for (int i = 0; i < n; i++) {
//         for (int j = 0; j < 3; j++) {
//             diff += fabs(a[i][j] - b[i][j]);
//         }
//     }
//     return diff / (n * 3); // 全要素の差異の平均を返す
// }
double calculate_difference(double a, double b) {
   double diff = 0.0;
   diff += fabs(a - b);   
   return diff;
}

int main() {
   srand((unsigned)time(NULL)); // 乱数のシードを設定

   int n = 25000;

   //PIKG用のコード
   const int nepi = n; 
   const int nepj = n; 
   EPI *epi = new EPI[nepi];
   EPJ *epj = new EPJ[nepj];
   FORCE *force = new FORCE[n];
   Kernel pikg_kernel;


   double (*ri)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double (*vi)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double (*rj)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double (*vj)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double *mj = static_cast<double*>(aligned_alloc(32, n * sizeof(double)));
   double *eps2 = static_cast<double*>(aligned_alloc(32, n * sizeof(double)));
   double (*ai)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double)));
   double (*J)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double)));

   // epiとepjの変数を乱数で初期化
   for(int i = 0; i < nepi; ++i) {
      epi[i].r = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      epj[i].r = {epi[i].r.x, epi[i].r.y, epi[i].r.z};
      epj[i].m = rand_double(0.5, 2.0);
      epj[i].eps = rand_double(0.01, 0.1);
      ri[i][0] = epi[i].r.x;
      ri[i][1] = epi[i].r.y;
      ri[i][2] = epi[i].r.z;

      rj[i][0] = epj[i].r.x;
      rj[i][1] = epj[i].r.y;
      rj[i][2] = epj[i].r.z;

      mj[i] = epj[i].m;
      eps2[i] = epj[i].eps;
      // double tmp_ri[3] = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      // double tmp_vi[3] = {rand_double(-1.0, 1.0), rand_double(-1.0, 1.0), rand_double(-1.0, 1.0)};
      // double tmp_rj[3] = {tmp_ri[0], tmp_ri[1], tmp_ri[2]};
      // double tmp_vj[3]  = {tmp_vi[0], tmp_vi[1], tmp_vi[2]};
      // double tmp_mj  = rand_double(0.5, 2.0);
      // double tmp_eps = rand_double(0.01, 0.1)
      // ri[i][0] = tmp_ri[0];
      // ri[i][1] = tmp_ri[1];
      // ri[i][2] = tmp_ri[2];
      // vi[i][0] = tmp_vi[0];
      // vi[i][1] = tmp_vi[1];
      // vi[i][2] = tmp_vi[2];

      // rj[i][0] = tmp_rj[0];
      // rj[i][1] = tmp_rj[1];
      // rj[i][2] = tmp_rj[2];
      // vj[i][0] = tmp_vj[0];
      // vj[i][1] = tmp_vj[1];
      // vj[i][2] = tmp_vj[2];

      // mj[i] = tmp_mj;
      // eps2[i] = tmp_eps;

   }

   //PIKG
   clock_t start, end;
   start = clock();
   pikg_kernel(epi, nepi, epj, nepj, force); // ここで計算
   end = clock();
   double pikg_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
   printf("N = %d\n", n);
   printf("pikg_kernel of elapsed time = %lfsec\n", pikg_elapsed);


   start = clock();
   kernel(n, ri, rj, mj, eps2, ai);
   end = clock();
   double pyker_code_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
   printf("N = %d\n", n);
   printf("pyker code of elapsed time = %lfsec\n", pyker_code_elapsed);



   double total_diff_Fx = 0.0;
   double total_diff_Fy = 0.0;
   double total_diff_Fz = 0.0;
   double total_diff_Jx = 0.0;
   double total_diff_Jy = 0.0;
   double total_diff_Jz = 0.0;
    for (int i = 0; i < n; i++) {
        total_diff_Fx = std::max(abs(force[i].acc.x - ai[i][0]) / force[i].acc.x, total_diff_Fx);
        total_diff_Fy = std::max(abs(force[i].acc.y - ai[i][1]) / force[i].acc.y, total_diff_Fy);
        total_diff_Fz = std::max(abs(force[i].acc.z - ai[i][2]) / force[i].acc.z, total_diff_Fz);
      //   total_diff_Jx = std::max(abs(force[i].j.x - J[i][0]) / force[i].j.x, total_diff_Jx);
      //   total_diff_Jy = std::max(abs(force[i].j.y - J[i][0]) / force[i].j.y, total_diff_Jy);
      //   total_diff_Jz = std::max(abs(force[i].j.z - J[i][0]) / force[i].j.z, total_diff_Jz);
      if(i % 1000 == 0) {
         printf("%lf %lf\n", force[i].acc.y, ai[i][1]);
      }
    }

   printf("Total difference in F.x: %f\n", total_diff_Fx);
   printf("Total difference in F.y: %f\n", total_diff_Fy);
   printf("Total difference in F.z: %f\n", total_diff_Fz);
   // printf("Total difference in J.x: %f\n", total_diff_Jx / n);
   // printf("Total difference in J.y: %f\n", total_diff_Jy / n);
   // printf("Total difference in J.z: %f\n", total_diff_Jz / n);
}
