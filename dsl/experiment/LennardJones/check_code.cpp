#include<x86intrin.h>
#include<stdio.h>
#include<pikg_vector.h>
#include<pikg_vector.hpp>
#include<cstdlib> // 乱数生成のために必要
#include<ctime> // 乱数のシード設定のために必要
// #include<algorithm>
#include<cmath>
#include<time.h>

struct EPI{
  double rx,ry,rz;
};

struct EPJ{
   double rx,ry,rz,eps;
};

struct FORCE{
  double fx,fy,fz;
  double p;
};

#include "pikg_kernel.hpp"
// #include "harp_pyker_code.hpp"
// #include "pyker_code.hpp"
// #include "avx2_code.hpp"
#include "pyker_simd_code.hpp"

// 乱数を生成するための関数
double rand_double(double min, double max) {
   return min + (double)rand() / ((double)RAND_MAX / (max - min));
}


double calculate_difference(double a, double b) {
   double diff = 0.0;
   diff += fabs(a - b);   
   return diff;
}

int main() {
   srand((unsigned)time(NULL)); // 乱数のシードを設定

   int n = 10;

   //PIKG用のコード
   const int nepi = n; 
   const int nepj = n; 
   EPI* epi = new EPI[n];
   EPJ* epj = new EPJ[n];
   FORCE* force = new FORCE[n];
   Kernel pikg_kernel;

   double (*ri)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double (*rj)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double))); 
   double (*fr)[3] = static_cast<double(*)[3]>(aligned_alloc(32, n * 3 * sizeof(double)));
   double (*p) = static_cast<double(*)>(aligned_alloc(32, n * 3 * sizeof(double)));
   double eps = pow(2, -5);
   // epiとepjの変数を乱数で初期化
   for(int i = 0; i < nepi; ++i) {
      epi[i].rx = rand_double(-1.0, 1.0);
      epi[i].ry = rand_double(-1.0, 1.0);
      epi[i].rz = rand_double(-1.0, 1.0);
      epj[i].eps = pow(2, -5);
      epj[i].rx = epi[i].rx;
      epj[i].ry = epi[i].ry;
      epj[i].rz = epi[i].rz;

      ri[i][0] = epi[i].rx;
      ri[i][1] = epi[i].ry;
      ri[i][2] = epi[i].rz;
      
      rj[i][0] = epj[i].rx;
      rj[i][1] = epj[i].ry;
      rj[i][2] = epj[i].rz;

      force[i].fx = 0;
      force[i].fy = 0;
      force[i].fz = 0;
      force[i].p = 0;

      fr[i][0] = 0;
      fr[i][1] = 0;
      fr[i][2] = 0;

      p[i] = 0;
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
   kernel(n, ri, rj, fr, p, eps);
   end = clock();
   double pyker_code_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
   printf("N = %d\n", n);
   printf("pyker code of elapsed time = %lfsec\n", pyker_code_elapsed);



   double max_relerr_Fx = 0.0;
   double max_relerr_Fy = 0.0;
   double max_relerr_Fz = 0.0;
   double max_relerr_p= 0.0;
    for (int i = 0; i < n; i++) {
        max_relerr_Fx = std::max(abs(force[i].fx - fr[i][0]) / force[i].fx, max_relerr_Fx);
        max_relerr_Fy = std::max(abs(force[i].fy - fr[i][1]) / force[i].fy, max_relerr_Fy);
        max_relerr_Fz = std::max(abs(force[i].fz - fr[i][2]) / force[i].fz, max_relerr_Fz);
        max_relerr_p = std::max(abs(force[i].p - p[i]) / force[i].p, max_relerr_p);
        if(i % 10) {
            printf(" %lf %lf \n", force[i].fx, fr[i][0]);
        }
    }

   printf("max difference in F.x: %f\n", max_relerr_Fx);
   printf("max difference in F.y: %f\n", max_relerr_Fy);
   printf("max difference in F.z: %f\n", max_relerr_Fz);
   printf("Total difference in p: %f\n", max_relerr_p);
}
