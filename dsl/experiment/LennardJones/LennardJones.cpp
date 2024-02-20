#include<x86intrin.h>
#include<stdio.h>
#include<pikg_vector.h>
#include<pikg_vector.hpp>
#include<cstdlib> // 乱数生成のために必要
#include<ctime> // 乱数のシード設定のために必要
// #include<algorithm>
#include<cmath>
#include<time.h>
#include<iostream>
// using namespace std;


struct EPI{
  double rx,ry,rz;
};

struct EPJ{
   double rx,ry,rz;
   double eps;
};

struct FORCE{
  double fx,fy,fz;
  double p;
};

#include "pikg_kernel.hpp"
#include "pyker_kernel.hpp"
// #include "pikg_kernel_AVX2.hpp"
// #include "pyker_kernel_AVX2.hpp"

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

   int n;

   std::cin >> n;

   //PIKG用のコード
   const int nepi = n; 
   const int nepj = n; 
   EPI *epi = new EPI[nepi];
   EPJ *epj = new EPJ[nepj];
   FORCE *force = new FORCE[n];
   Kernel pikg_kernel;


   double (*rix) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*riy) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*riz) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*rjx) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*rjy) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*rjz) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double *mj = static_cast<double*>(aligned_alloc(32, n * sizeof(double)));
   double *eps2 = static_cast<double*>(aligned_alloc(32, n * sizeof(double)));
   double (*fx) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*fy) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*fz) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 
   double (*p) = static_cast<double(*)>(aligned_alloc(32, n * sizeof(double))); 

   // epiとepjの変数を乱数で初期化
   for(int i = 0; i < nepi; ++i) {
      epi[i].rx = rand_double(-1.0, 1.0);
      epi[i].ry = rand_double(-1.0, 1.0);
      epi[i].rz = rand_double(-1.0, 1.0);
      epj[i].eps = pow(2, -5);
      epj[i].rx = epi[i].rx;
      epj[i].ry = epi[i].ry;
      epj[i].rz = epi[i].rz;
      
      rix[i] = epi[i].rx;
      riy[i] = epi[i].ry;
      riz[i] = epi[i].rz;
      
      rjx[i] = epj[i].rx;
      rjy[i] = epj[i].ry;
      rjz[i] = epj[i].rz;

      force[i].fx = 0;
      force[i].fy = 0;
      force[i].fz = 0;
      force[i].p = 0;

      fx[i] = 0;
      fx[i] = 0;
      fx[i] = 0;
      p[i] = 0;
      eps2[i] = pow(2, -5);


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
   kernel(n, rix, riy, riz, rjx, rjy, rjz, eps2, fx, fy, fz, p);
   end = clock();
   double pyker_code_elapsed = (double)(end - start) / CLOCKS_PER_SEC;
   printf("N = %d\n", n);
   printf("pyker code of elapsed time = %lfsec\n", pyker_code_elapsed);


   double max_relerr_Fx = 0.0;
   double max_relerr_Fy = 0.0;
   double max_relerr_Fz = 0.0;
   double max_relerr_p= 0.0;
    for (int i = 0; i < n; i++) {
        max_relerr_Fx = std::max(abs(force[i].fx - fx[i]) / force[i].fx, max_relerr_Fx);
        max_relerr_Fy = std::max(abs(force[i].fy - fy[i]) / force[i].fy, max_relerr_Fy);
        max_relerr_Fz = std::max(abs(force[i].fz - fz[i]) / force[i].fz, max_relerr_Fz);
        max_relerr_p = std::max(abs(force[i].p - p[i]) / force[i].p, max_relerr_p);
      //   if(i % 10 == 0) {
      //       printf(" %lf %lf \n", force[i].fx, fx[i]);
      //   }
    }

   printf("max difference in F.x: %f\n", max_relerr_Fx);
   printf("max difference in F.y: %f\n", max_relerr_Fy);
   printf("max difference in F.z: %f\n", max_relerr_Fz);
   printf("Total difference in p: %f\n", max_relerr_p);
}
